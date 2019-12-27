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

  @override
  Widget build (BuildContext context) {

    final myRequests = Provider.of<MyRequestsProvider>(context).myRequestsList;
    return Scaffold(
     /* appBar: AppBar(
        title: Text('My Services Requests'),
      ),*/
      body: Column(
        children: <Widget>[
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: myRequests.length,
              itemBuilder: (ctx, i) => allRequests(myRequests[i]),
            ),
          )
        ],
      ),
    );
  }

  Widget allRequests(ServiceRequest myRequest) {
    return Card(
          margin: EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 4,
          ),
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Padding(
                  padding: EdgeInsets.all(3),
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
                    title: Text((null != myRequest.service && null != myRequest.service.serviceName )
                        ? myRequest.service.serviceName
                        : myRequest.serviceRequestDescription,
                        overflow: TextOverflow.ellipsis), // TODO: No Null validation here for now, can be change for NUll validation.
                    subtitle: Text(null != myRequest.createdDate
                        ? DateFormat('dd/MM/yyyy hh:mm').format(myRequest.createdDate)
                        : ""),
                    trailing: processTrails(myRequest),
                  ),
                ),
              ]),
    );
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

  Widget processTrails(ServiceRequest serviceRequest) {
    if(null != serviceRequest) {
      return Row (
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Chip(
            label: Text(
              serviceRequest.status,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: processStatusColor(serviceRequest.status),
          ),
          //Spacer(),
          //IconButton(icon: Icon(Icons.chat_bubble)),
          Chip(
            label: Text(
              "Chat",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.greenAccent,
          ),
          IconButton(
            icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
            onPressed: () {
              setState(() {
                _expanded = !_expanded;
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