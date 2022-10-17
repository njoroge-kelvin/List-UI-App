import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.5),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

class Welcome_Screen extends StatefulWidget {
  const Welcome_Screen({Key? key}) : super(key: key);

  @override
  State<Welcome_Screen> createState() => _Welcome_ScreenState();
}

class _Welcome_ScreenState extends State<Welcome_Screen> {

  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  late String email = '' ;
  late String password = '';
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                validator: (value){
                  if(value!.isEmpty){
                    return 'Email field is empty';
                  }
                  return null;
                },
                  onChanged: (value) {
                    email = value;
                  },

                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  controller: _pass,
                  validator: (value){
                    if(value != null && value.isEmpty){
                      return 'The passsword is missing';
                    }
                  },
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your Password')),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  controller: _confirmPass,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Password slot is empty';
                    }
                    if(value != _pass.text){
                      return 'Password doesn\'t match';
                    }
                  },
                  onChanged: (value) {
                    password = value;
                  },

                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Confirm your Password')),
              SizedBox(
                height: 24.0,
              ),
              MaterialButton(
                color: Colors.blueAccent,
                child:Text( 'Register'),
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                      if (_formKey.currentState!.validate()){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('')));
                        final newUser = await _auth.createUserWithEmailAndPassword(
                            email: email, password: password);
                        if(newUser != null) {
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
