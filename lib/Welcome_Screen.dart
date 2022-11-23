
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

SnackBar _snackBar = SnackBar(
    elevation: 5.0,
    duration: const Duration(milliseconds: 850),
    margin: EdgeInsets.all(20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    behavior: SnackBarBehavior.floating,
    content: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Icon(Icons.battery_alert),
        SizedBox(
          width: 60,
        ),
        Text('You are Signing up!'),
      ],
    ));

class Welcome_Screen extends StatefulWidget {
  const Welcome_Screen({Key? key}) : super(key: key);

  @override
  State<Welcome_Screen> createState() => _Welcome_ScreenState();
}

class _Welcome_ScreenState extends State<Welcome_Screen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  late String email = '';
  late String password = '';
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _username = TextEditingController();
  File? image;
  final picker = ImagePicker();
  FocusNode focusNode = FocusNode();

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    _pass.dispose();
    super.dispose();
  }
  // Future pickImage() async {
  //   try {
  //     final image = await picker.pickImage(source: ImageSource.gallery);
  //     if(image == null) return;
  //     final imageTemp = File(image.path);
  //     setState(() => this.image = imageTemp);
  //   } on PlatformException catch(e) {
  //     print('Failed to pick image: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {

    final kTextFieldDecoration = InputDecoration(
      hintStyle: TextStyle(color: Colors.grey),
      contentPadding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 5.0),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(50),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(50),
      )
    );
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:
      //Implements progressSpinner on this context
      ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 58.0),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      CircleAvatar(
                        minRadius: 50,
                        backgroundImage: AssetImage("assets/images/Image1.jpg"),
                      ),
                      Positioned(
                        bottom: height * 0,
                        right: width * 0.32,
                        child: MaterialButton(
                          height: 40,
                          minWidth: 40,
                          padding: EdgeInsets.only(left: 1, top: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            // side: BorderSide(color: Colors.white),
                          ),
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            // pickImage();
                          },
                          child: Icon(Icons.camera_alt_outlined),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Center(child: Text('Sign Up', style: TextStyle( fontSize: 30),)),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(children: [TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email field is empty';
                        }
                        return null;
                      },
                      onChanged: (value){
                      email = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          labelText: 'Enter your email',
                          prefixIcon: Icon(Icons.email) ),
                    ),
                  SizedBox(height: 10,),
                  TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        obscureText: false,
                        controller: _phoneNumber,
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return 'Enter you Phone number';
                          }
                        },
                        decoration: kTextFieldDecoration.copyWith(
                            prefixIcon: Icon(Icons.phone),
                        labelText: 'Enter Phone no')),
                  SizedBox(height: 10,),
                  TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        obscureText: false,
                        controller: _username,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Username slot is empty';
                          }
                        },
                        decoration: kTextFieldDecoration.copyWith(
                            prefixIcon: Icon(Icons.nest_cam_wired_stand_outlined),
                        labelText: 'Enter username')),
                  SizedBox(height: 10,),
                  TextFormField(
                    // cursorColor: Colors.lightBlueAccent,
                        textAlignVertical: TextAlignVertical.center,
                        obscureText: true,
                        controller: _pass,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password slot is empty';
                          }
                          if (value != _pass.text) {
                            return 'Password doesn\'t match';
                          }
                        },
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                            labelText: 'Enter Password',
                            prefixIcon: Icon(Icons.account_box_rounded,),)),
                  SizedBox(height: 10,),
                  TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        obscureText: true,
                        controller: _confirmPass,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password slot is empty';
                          }
                          if (value != _pass.text) {
                            return 'Password doesn\'t match';
                          }
                        },
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                            labelText: 'Confirm Password',
                            prefixIcon: Icon(Icons.add_alarm_outlined),)),]),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Aready have an account?'),
                      Theme(
                        data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                        child: MaterialButton(
                          padding: EdgeInsets.zero,
                          minWidth: 0,
                          elevation: 0,
                          child: Text('Sign in', style: TextStyle(color: Theme.of(context).primaryColor),),
                          onPressed: (){
                            Navigator.pushNamed(context, '/login_screen');
                          }),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 3.0,
                  color: Theme.of(context).primaryColor,
                  // color: Color(0xFF76FF03),
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 13),
                  ),
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(_snackBar);
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                        if (newUser != null) {
                          Navigator.pushNamed(context, '/login_screen');
                        }
                      }

                      // if(email.isEmpty || password.isEmpty){
                      //   print('Sorry! Can\'t login today');
                      // }
                      // else{
                      //   Navigator.pushNamed(context, '/login_screen');
                      // }
                    } catch (e) {
                      print(e);
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Divider(
                          indent: 10,
                          endIndent: 10,
                          height: 10,
                          thickness: 0.8,
                        ),
                      ),
                      Text('Or Sign Up with'),
                      Expanded(
                        child: Divider(
                          indent: 10,
                          endIndent: 10,
                          height: 10,
                          thickness: 0.8,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width:40,
                        height:40,
                        child: Image.network(
                            'http://pngimg.com/uploads/google/google_PNG19635.png',
                            fit:BoxFit.cover
                        ),
                      ),
                      Icon(Icons.add_alarm_outlined),
                      Icon(Icons.add_chart_sharp),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
