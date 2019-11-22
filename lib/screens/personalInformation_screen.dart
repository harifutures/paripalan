import 'dart:io';
//import '../screens/HomePage.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:image_picker_modern/image_picker_modern.dart';

import '../providers/departments_provider.dart';
import '../providers/states_provider.dart';
import '../providers/districts_provider.dart';
import '../providers/mandals_provider.dart';
import '../providers/villages_provider.dart';
import '../providers/role_provider.dart';
import '../providers/users_provider.dart';

import '../providers/state.dart';
import '../models/district.dart';
import '../models/mandal.dart';
import '../models/village.dart';
import '../models/Role.dart';

import '../widgets/districts_dropdown_widget.dart';
import '../widgets/mandals_dropdown_widget.dart';
import '../widgets/dropdowns_widget.dart';
import '../widgets/main_drawer.dart';
import '../models/appConstants.dart';


//import 'package:image_picker/image_picker.dart';

class MyPersonalInformationScreen extends StatefulWidget {

  //MyPersonalInformationPage({Key key, this.title, this.userProvider }) : super(key: key);

  @override
  _MyPersonalInformationScreenState createState() => _MyPersonalInformationScreenState();

}

/*class PersonalInformationPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("Inside PersonalInfoPage...");
    
    return MyPersonalInformationPage(title: AppConstants.appName);
  }
}*/

class _MyPersonalInformationScreenState extends State<MyPersonalInformationScreen> {

  Map<String, String> userInfo;
  List<TextEditingController> textControllers;
  //UserProvider _userProvider;

  bool _imageChanged = false;
  
  File _newImage;

  String _firstName; 
  String _lastName; 
  String firstName;
  File _image;

  final _phoneFocusNode = FocusNode();

  var _initValues = {
    
  };

  /*void saveInfo() {
    AppConstants.currentUser.firstName = userInfo['First Name'];
    AppConstants.currentUser.lastName = userInfo['Last Name'];
    AppConstants.currentUser.bio = userInfo['Bio'];
    AppConstants.currentUser.location = userInfo['Location'];

    AppConstants.currentUser.saveToFirestore().then((value) {
      AppConstants.currentUser.saveImageToFirebase(_newImage).whenComplete(() {
        print("Going to the next page");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      });
    });
  }*/
  /*void _openImageSelector() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imageChanged = true;
        _newImage = image;
      });
    }
  }*/

  /*@override
  void initState() {
    setState(() {
      print("inside personalInfoPage setState...");
    //  nameController = TextEditingController(text: AppConstants.);
      //firstName = _userProvider.findById(1).firstName;
      //_nameController.text = firstName;
      userInfo = {
        /*"First Name": AppConstants.currentUser.firstName,
        "Last Name": AppConstants.currentUser.lastName,
        "Bio": AppConstants.currentUser.bio,
        "Location": AppConstants.currentUser.location,*/
        "First Name": "Hari Prasad",
        "Last Name": "Bandaru",
        "Bio": "Bio",
        "Location": "Bentonville",
      };
       
      textControllers = List<TextEditingController>();
      userInfo.forEach((key, value) {
        textControllers.add(TextEditingController(text: value));
      });
    });

    super.initState();
  }*/

  @override
  void dispose() {
    _phoneFocusNode.dispose();
    super.dispose();
  }

_saveForm1(){}
  _saveForm(UserProvider userProvider) {
    //_showMessage();

    userProvider.saveUserProfile(userProvider.user);

    // final isValid = _form.currentState.validate();
    // if (!isValid) {
    //   return;
    // }
    // _form.currentState.save();
    // if (_editedProduct.id != null) {
    //   Provider.of<Products>(context, listen: false)
    //       .updateProduct(_editedProduct.id, _editedProduct);
    // } else {
    //   Provider.of<Products>(context, listen: false).addProduct(_editedProduct);
    // }
    // Navigator.of(context).pop();
  }

  void _showMessage(BuildContext  context){
    Scaffold.of(context)
        .showSnackBar(new SnackBar(content: new Text("Submitting Form..")));
  }

  Future getImage() async {
    /*We can choose ImageSource as camera or gallery whatever is required.*/ 
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("inside personalInfoPage...");
    final _userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
       appBar: AppBar(
        title: Text('Personal Information'),
        actions: <Widget>[
          MaterialButton(
            onPressed: null,
            child: Text(
              'Save',
              style: TextStyle(
                fontSize: AppConstants.smallFontSize,
                color: Colors.white,
              ),
            ),
            textColor: Colors.white,
          ),
        ],
      ),
      //drawer: MainDrawer(),
      body: Center (
       /* padding: const EdgeInsets.fromLTRB(
          AppConstants.mediumPadding,
          AppConstants.mediumPadding,
          AppConstants.largePadding,
          0.0,
        ),*/
       // padding: const EdgeInsets.all(10.0),
       // padding: const EdgeInsets.fromLTRB(40,10,0,10),
        child: Form (
          child: ListView (
            padding: const EdgeInsets.all(15),
            children: <Widget>[
              //Populate DropDowns.
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: RegionDropDowns(),
              ),
             // RegionDropDowns(),
              TextFormField(
                  initialValue: _initValues['Phone'],
                  controller: TextEditingController(text: _userProvider.findById(1).phoneNumber.toString()),
                  decoration: InputDecoration(
                    icon: Icon(Icons.phone),
                    labelText: '* Phone'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter phone number.';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number.';
                    }
                    if (double.parse(value) < 10) {
                      return 'Phone number should be 10 digits.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // _editedProduct = Product(
                    //     title: _editedProduct.title,
                    //     price: double.parse(value),
                    //     description: _editedProduct.description,
                    //     imageUrl: _editedProduct.imageUrl,
                    //     id: _editedProduct.id,
                    //     isFavorite: _editedProduct.isFavorite);
                  },
              ),
              Padding (
              padding: EdgeInsets.only(top:30),
              child: TextField(
                    //controller: TextEditingController(text: Provider.of<UserProvider>(context).findById(1).firstName),
                    controller: TextEditingController(text: _userProvider.findById(1).firstName),
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      contentPadding: EdgeInsets.all(5.0),
                      labelText: '* Name', 
                    ),
                    style: TextStyle(
                      fontSize: AppConstants.smallFontSize,
                    ),
                    onChanged: (textVal) {
                      _userProvider.findById(1).firstName = textVal;
                    }, 
                  ),
              ),
              Padding (
              padding: EdgeInsets.only(top:30),
              child: TextField(
                    controller: TextEditingController(text: _userProvider.findById(1).email),
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      contentPadding: EdgeInsets.all(5.0),
                      labelText: 'Email', 
                    ),
                    style: TextStyle(
                      fontSize: AppConstants.smallFontSize,
                    ),
                    onChanged: (textVal) {
                      _userProvider.findById(1).email = textVal;
                    }, 
                  ),
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
              ),

              Center(
                heightFactor: 5,
                child: _image == null ? Text(
                  'Choose Profile Photo',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ) : Image.file(_image),
              ),
              Padding (
              padding: EdgeInsets.only(top:10),
              child: new  FloatingActionButton(
                onPressed: getImage,
                tooltip: 'Pick Image',
                child: Icon(Icons.add_a_photo),
              )
              ),

              Builder(
                /* Create an inner BuildContext so that the onPressed methods
                 can refer to the Scaffold with Scaffold.of().
                 When the Scaffold is actually created in the same build function, 
                 the context argument to the build function can't be used to find the Scaffold 
                 (since it's "above" the widget being returned). In such cases, the following technique 
                 with a Builder can be used to provide a new scope with a BuildContext that is "under" the Scaffold:
                 We can solve this by just using a different context.
                 */
                builder: (BuildContext context) {
                  return Center(
                    heightFactor: 2,
                    child: RaisedButton(
                      child: Text('SAVE'),
                      //focusColor: Colors.blue,
                      //highlightColor: Colors.purple,
                      //hoverColor: Colors.purpleAccent,
                      splashColor: Colors.blue[300],
                      //color: Colors.purpleAccent,
                      onPressed: () => {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.purpleAccent,
                          content: Text(
                            'Saving..',
                            ),
                          /*
                          //In case if want to add some action to SnackBar
                          action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),*/
                        ),
                        ),
                        Provider.of<UserProvider>(context, listen: false).saveUserProfile(
                        _userProvider.findById(1))
                      },
                    ),
                  );
                },
              ),
             /* new Container(
                padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                child: new RaisedButton(
                  child: const Text('Save'),
                  //textColor: Theme.of(context).primaryColor,
                 // onPressed: _saveForm(_userProvider),
                  onPressed: () => {
                     _showMessage(context),
                    Provider.of<UserProvider>(context, listen: false).saveUserProfile(
                        _userProvider.findById(1)
                      )
                  } 
                 
                )
              ),*/
              // IconButton(
              //   icon: Icon(Icons.save),
              //   onPressed: _saveForm,
              // ),

            ],
          ),
        
        ),
      ),
    );
  }
}
