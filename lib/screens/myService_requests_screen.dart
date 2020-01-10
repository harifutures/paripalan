import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:paripalan/models/serviceRequest.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/myRequests_provider.dart';

class MyServiceRequests extends StatefulWidget {

  static const routeName = '/myServiceRequests';

  @override
  _MyServiceRequestsState createState() => _MyServiceRequestsState();
}

class _MyServiceRequestsState extends State<MyServiceRequests> {
  var _expanded = false;
  var _selectedIndex = -1;

  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  /**
   * didChangeDependencies() is a life cycle method run after Widget
   * has been fully initialized, so to say before build ran for teh first time
   * and unlike initState, this methods runs multiple times not just when it gets created.
   * To stop this method runs multiple times we can use some helper variable like
   * '_isInit' to check every time this method is called.
   *
   * we can not use async on it becauase it does not return a <Future> object.
   * So we are using  on tradition '.then()' method here
   * (.then() behaves exactly same as async , await).
   */
  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<MyRequestsProvider>(context).fetchMyRequests().catchError((error) {
        showDialog(
          context: context,
          builder: (ctx) =>
              AlertDialog(
                title: Text('An error occurred!'),
                content: Text('Something went wrong.'),
                actions: <Widget>[
                  FlatButton(child: Text('Okay'), onPressed: () {
                    Navigator.of(ctx).pop();
                  },)
                ],
              ),
        );
      }).then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> _refreshServiceRequests(BuildContext context) async {
    await Provider.of<MyRequestsProvider>(context).fetchMyRequests();
  }

  @override
  Widget build (BuildContext context) {

    final myRequests = Provider.of<MyRequestsProvider>(context).myRequestsList;
    return Scaffold(
     /* appBar: AppBar(
        title: Text('My Services Requests'),
      ),*/
      body: _isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
      : RefreshIndicator(
      onRefresh: () => _refreshServiceRequests(context),
      child: Column(
        children: <Widget>[
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: myRequests.length,
              itemBuilder: (ctx, i) => _showAllServiceRequests(myRequests[i], i),
            ),
          )
        ],
      ),
    ),
    );
  }

  Widget _showAllServiceRequests(ServiceRequest myRequest, int index) {
    return /*Container(
      height: 100,*/
    Flex ( direction: Axis.horizontal,children: <Widget> [Expanded (
    child: Container(
        //height: 100,
      child: Card(
      elevation: 2.0,
          margin: EdgeInsets.all(5.0),
          /*margin: EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 4,
          ),*/
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Padding(
                  padding: EdgeInsets.fromLTRB(1.0, 10.0, 1.0, 20.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      maxRadius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(3),
                        child: FittedBox(
                          child: Text( (null != myRequest.role && null != myRequest.role.roleName)
                              ? myRequest.role.roleName
                              :""),
                        ),
                      ),
                    ),
                    //TODO: Need to validate for providing either service or description for sure (throwing Nullpoint as there is no null validation for description here.), and role must be chosen always..
                  //  title: Wrap(children:<Widget>[Text((null != myRequest.service && null != myRequest.service.serviceName )
                    title: Text((null != myRequest.service && null != myRequest.service.serviceName )
                        ? myRequest.service.serviceName
                        : myRequest.serviceRequestDescription,//]),
                        overflow: TextOverflow.ellipsis), // TODO: No Null validation here for now, can be change for NUll validation.
                    subtitle: Text(null != myRequest.createdDate
                        ? DateFormat('dd/MM/yyyy hh:mm').format(myRequest.createdDate)
                        : "",
                    ),
                    trailing: processTrails(myRequest, index),
                  ),
                ),
                if(_expanded && _selectedIndex == index)
                   _viewMoreDetails(myRequest)
                  //])),
              ]),
    ))
    )]);
  }

  /*Widget allRequests(ServiceRequest myRequest) {
    print("Inside ALLREQUEST=======");
    return Dismissible(
      key: ValueKey(myRequest.serviceRequestId),
      background: Container(
//        color: Theme
//            .of(context)
//            .errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      /*onDismissed: (direction) {
        Provider.of<ServiceRequest>(context, listen: false).removeItem(productId);
      },*/
      child: Card(
            margin: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 4,
            ),
            child: Column (
                children: <Widget> [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: FittedBox(
                            child: Text(myRequest.role.roleName),
                          ),
                        ),
                      ),
                      title: Text((null != myRequest.service && null != myRequest.service.serviceName )
                          ? myRequest.service.serviceName
                          : myRequest.serviceRequestDescription),
                      subtitle: Text(DateFormat('dd/MM/yyyy hh:mm').format(myRequest.createdDate)),
                      trailing: processTrails(myRequest),
                    ),
                  ),
                  if(_expanded)
                    Container (
                     // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                     // height: min(widget.order.products.length * 20.0 + 10, 100),
                    )
             ])),
      );
    }*/

  Widget _viewMoreDetails(ServiceRequest myRequest) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        height: min(100, 200),
        //  child: Column ( children: <Widget>[ Expanded(
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                    "Requested TO: ",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)
                ),
                Text(myRequest.role.roleName) //TODO: Need to add Person Name here in brackets ex: Requested To: MRO(HARI)
              ],
            ),
            if(null != myRequest.service && null != myRequest.service.serviceName)
              //AutoSizeText(
              AutoSizeText( "Service: " + myRequest.service.serviceName , style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
            /*if(null != myRequest.service && null != myRequest.service.serviceName)
              Text( myRequest.service.serviceName),*/
              //),
            if(null != myRequest.serviceRequestDescription)
              //AutoSizeText(
              AutoSizeText("Description: "+ myRequest.serviceRequestDescription,
                  style: TextStyle(fontSize: 17, fontStyle: FontStyle.italic)),
              //),
          ],
        ));
  }
  Widget processTrails(ServiceRequest serviceRequest, index) {
    if(null != serviceRequest) {
      return Row (
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          /*Chip(
            label: Text(
              serviceRequest.status,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: processStatusColor(serviceRequest.status),
          ),*/
          Text(
            serviceRequest.status,
            style: TextStyle(
              color: processStatusColor(serviceRequest.status),
              fontWeight: FontWeight.bold
            ),
          ),

          //Spacer(),
          IconButton(icon: Icon(
            Icons.chat,
            color: Colors.green,
            size: 30.0,
          )),
          /*Chip(
            label: Text(
              "Chat",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.greenAccent,
          ),*/
          IconButton(
            icon: Icon((_expanded && _selectedIndex == index) ? Icons.expand_less : Icons.expand_more),
            onPressed: () {
              setState(() {
                _expanded = !_expanded;
                _selectedIndex = index;
              });
            },
          )
        ],
      );



    }
  }

  MaterialColor processStatusColor(String status) {
    switch(status) {
      case "Pending":
        return Colors.red;
      case "Working":
        return Colors.orange;
      case "Done":
        return Colors.green;
      default:
        return Colors.red;
    }
  }
}