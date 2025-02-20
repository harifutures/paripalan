import '../customWidgets/Forms.dart';
//import '../customWidgets/ListTiles.dart';
import '../Models/AppConstants.dart';
import '../customWidgets/TextViews.dart';
import 'package:flutter/material.dart';

class MyViewProfilePage extends StatefulWidget {

  MyViewProfilePage({Key key}) : super(key: key);

  @override
  _MyViewProfilePageState createState() => _MyViewProfilePageState();

}

class ViewProfilePage extends StatelessWidget {

  static const routeName = '/viewProfilePage';

  @override
  Widget build(BuildContext context) {
    return MyViewProfilePage();
  }
}

class _MyViewProfilePageState extends State<MyViewProfilePage> {

  /*User _currentUser;

  void _loadUserInfoFromDB(Contact contact) {
    Firestore.instance.document(contact.getDatabaseReference()).get().then((snapshot) {
      setState(() {
        _currentUser.loadUserFromFirestore(snapshot);
      });
    });
  }

  void _submitReview(Review review) {
    setState(() {
      this._currentUser.addReview(review);
    });
  }*/

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold (
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: SingleChildScrollView (
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppConstants.smallPadding,
            AppConstants.smallPadding,
            AppConstants.smallPadding,
            0.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  HeadingText(
                    //text: "Hi, I'm ${(_currentUser.firstName == null) ? "" : _currentUser.firstName}",
                    text: "Hi, I'm Hari",
                    fontSize: AppConstants.largeFontSize,
                  ),
                  CircleAvatar(
                   // backgroundImage: _currentUser.displayImage,
                    child: Icon(Icons.account_circle),
                    radius: MediaQuery.of(context).size.width / 10.0,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: AppConstants.mediumPadding),
                child: HeadingText(text: "Bio"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: AppConstants.smallPadding),
                //child: RegularText(text: (_currentUser.bio == null) ? "" : _currentUser.bio),
                child: RegularText(text: "My BIO"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: AppConstants.mediumPadding),
                child: HeadingText(text: "Location"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: AppConstants.smallPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.home),
                    Padding(
                      padding: const EdgeInsets.only(left: AppConstants.smallPadding),
                      //child: RegularText(text: 'Lives in ${(_currentUser.location == null) ? "" : _currentUser.location}')
                      child: RegularText(text: 'Lives in Bentonville')
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: AppConstants.mediumPadding),
                child: HeadingText(text: "Reviews"),
              ),
              /*(_currentUser.id != AppConstants.currentUser.id) ? Padding(
                padding: const EdgeInsets.only(top: AppConstants.tinyPadding),
                child: ReviewForm(submitReview: _submitReview),
              ) :*/
              Container() ,
              Padding(
                padding: const EdgeInsets.only(top: AppConstants.smallPadding),
                child: StreamBuilder(
                  /*stream: Firestore.instance.collection(
                      "users/${_currentUser.id}/reviews").orderBy('dateTime',
                      descending: true).snapshots(),*/
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return new Center(
                            child: new CircularProgressIndicator());
                      default:
                        return ListView.builder(
                          itemCount: snapshot.data.documents.length,
                          shrinkWrap: true,
                          /*itemBuilder: (context, index) {
                            Review review = Review();
                            review.getReviewFromDatabase(snapshot.data.documents[index]);
                            _currentUser.reviews.add(review);
                            return Padding(
                              padding: const EdgeInsets.only(bottom: AppConstants.tinyPadding),
                              child: ReviewListTile(review: review),
                            );
                          },*/
                        );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


