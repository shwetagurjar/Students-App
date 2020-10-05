import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode usernameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: "Raleway"
                  ),
                ),
              ],
            ),
            SizedBox(height: 120.0),
            TextField(
              focusNode: usernameFocusNode,
              onSubmitted: (var str){
                usernameFocusNode.unfocus();
                FocusScope.of(context).requestFocus(passwordFocusNode);
              },
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(
                  fontFamily: "Raleway"
                ),
              ),
              style: TextStyle(
                fontFamily: "Raleway"
              ),
              controller: usernameController,
            ),
            SizedBox(height: 12.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                  fontFamily: "Raleway"
                )
              ),
              style: TextStyle(
                fontFamily: "Raleway"
              ),
              controller: passwordController,
              focusNode: passwordFocusNode,
              onEditingComplete: (){
                passwordFocusNode.unfocus();
              },
              obscureText: true,
            ),
            SizedBox(
              height: 32,
            ),
            CupertinoButton(
              color: Colors.red,
              child: Text(
                "Login"
              ),
              onPressed: (){
                var username = usernameController.text;
                FocusScope.of(context).requestFocus(usernameFocusNode);
                usernameFocusNode.unfocus();
                usernameController.clear();
                passwordController.clear();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => DashboardScreen(
                      username: username
                    )
                  )
                );
              }
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     var username = usernameController.text;
      //     FocusScope.of(context).requestFocus(usernameFocusNode);
      //     usernameFocusNode.unfocus();
      //     usernameController.clear();
      //     passwordController.clear();
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (BuildContext context) => DashboardScreen(
      //           username: username
      //         )
      //       )
      //     );
      //   },
      //   child: Icon(
      //     Icons.chevron_right
      //   ),
      // ),
    );
  }
}