import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class start extends StatefulWidget {
  const start({Key key}) : super(key: key);

  @override
  _startState createState() => _startState();
}

class _startState extends State<start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
           // SizedBox(height: 45.0,),
            Container(
              height: 335,
              child: Image(image: AssetImage("images/login.png"),
              fit: BoxFit.contain,),
            ),
            SizedBox(height: 20,),
            RichText(text: TextSpan(
              text: 'Welcome to ',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                  text:'WealthDisk',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.blueAccent)
                )
              ]
            )),
            SizedBox(height: 10,),
            Text('All About Wealth',style: TextStyle(color: Colors.black),),
            SizedBox(height: 30,),
            Row(mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                RaisedButton(
                  padding: EdgeInsets.only(left: 30,right: 30),
                  onPressed: (){},
                  child: Text('Login',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.blue,
                ),
                SizedBox(width: 20.0,),
                RaisedButton(
                  padding: EdgeInsets.only(left: 30,right: 30),
                  onPressed: (){},
                  child: Text('Register',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.blue,
                ),
              ],
            ),
            SizedBox(height: 20,),
            SignInButton(
              Buttons.Google,
              text: "Sign up with Google",
              onPressed: () {},
            )
          ],
        )
      ),
    );
  }
}
