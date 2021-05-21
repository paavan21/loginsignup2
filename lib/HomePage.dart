import 'package:loginsignup/start.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;

  checkAuthentication() async{
    _auth.authStateChanges().listen((user){
      if(user == null){
        Navigator.of(context).pushReplacementNamed("start");
      }
    });
  }

  getUser() async{
    User firebaseUser = _auth.currentUser;
    await firebaseUser ?.reload();
    firebaseUser = _auth.currentUser;

    if(firebaseUser != null){
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }
  }

  signOut() async{
    _auth.signOut();

    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  void initState(){
    super.initState();
    this.checkAuthentication();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: !isloggedin ? CircularProgressIndicator()
        : Column(
          children: <Widget>[
            SizedBox(height: 40.0,),
            Container(
              height:300,
              child: Image(
                image: AssetImage("images/signup.png"),
                fit: BoxFit.contain,
              ),
            ),
            Container(
              child: Text(
                "Hello ${user.displayName} you are logged in as ${user.email}",
                style:
                TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),

            ),
            RaisedButton(
              padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                onPressed: signOut,
              child: Text('Sign Out',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
              )),
              color: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
              ),
            )
          ],
        ),
      ),
    );
  }
}
