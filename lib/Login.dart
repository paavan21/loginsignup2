import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginsignup/HomePage.dart';
import 'package:loginsignup/signUp.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email, _password;

//  get input => null;

  checkAuthentication() async{
    _auth.authStateChanges().listen((user){
      if(user != null){
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    });
    @override
    void initState()
    {
      super.initState();
      this.checkAuthentication();
    }
  }

  login() async{
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();

      try{
        await _auth.signInWithEmailAndPassword(email: _email, password: _password);
      }catch(e){
        showError(e.message);
        print(e);
      }
    }
  }

  showError(String errormessage) {
    showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('Error'),
            content: Text(errormessage),
            actions: <Widget>[
              FlatButton(onPressed: (){
                Navigator.of(context).pop();
              },
                  child: Text('ok'))
            ],
          );
        });

  }
  navigateToSignUp() async{
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 400,
              child: Image(image: AssetImage("images/login.png"),
              fit: BoxFit.contain,
              ),
            ),
            Container(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: TextFormField(
                        validator: (input)
                          {
                          if(input.isEmpty)
                            return 'Enter email';
                          },
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon:Icon(Icons.email)
                          ),
                          onSaved: (input) => _email = input),
                      ),
                    Container(
                      child: TextFormField(
                          validator: (input)
                          {
                            if(input.length < 6)
                              return 'Provide Minimum 6 Character';
                          },
                          decoration: InputDecoration(
                              labelText: 'Email',
                              prefixIcon:Icon(Icons.lock),

                          ),
                          obscureText: true,
                          onSaved: (input) => _password = input),
                    ),
                    SizedBox(height: 20,),
                    RaisedButton(
                      padding: EdgeInsets.only(left: 30,right: 30),
                      onPressed: (){},
                      child: Text('Login',
                        style: TextStyle(fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              child: Text('Create an Account?'),
              onTap: navigateToSignUp,
            )
          ],
        ),
      ),
    );
  }
}
