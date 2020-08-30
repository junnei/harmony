import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'registerPage.dart';
import 'welcomePage.dart';

class LoginPage extends StatefulWidget {
  static const String id = '/login';

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool showSpinner = false;
  //final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(
              backgroundColor:
              Colors.transparent, //You can make this transparent
              elevation: 0.0, //No shadow
            ),
          ),
          Center(
            child: Column(
              children:[
                Flexible(child: SizedBox(height: 100,),),
                Icon(Icons.music_video),
                Text(
                  '로그인'
                ),
              ],
            ),
          ),
          ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: Padding(
              padding: EdgeInsets.fromLTRB(24, 200,24,0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                  Flexible(
                    child: SizedBox(
                      height: 150.0,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: InkWell(
                        child: Center(
                          child: Text(
                            '아이디/비밀번호를 잊어버리셨나요?',
                            style: TextStyle(
                              color: Color.fromRGBO(138, 157, 248, 1),
                            ),
                          ),
                        ),
                        onTap: () async {
                          Navigator.pushNamed(context, RegisterPage.id);
                        }),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: InkWell(
                        child: Center(
                          child: Text(
                            '메인페이지',
                            style: TextStyle(
                              color: Color.fromRGBO(138, 157, 248, 1),
                            ),
                          ),
                        ),
                        onTap: () async {
                          Navigator.pushNamed(context, WelcomePage.id);
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
