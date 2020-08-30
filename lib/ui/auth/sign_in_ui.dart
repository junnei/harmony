import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:connect/localizations.dart';
import 'package:connect/ui/components/components.dart';
import 'package:connect/helpers/helpers.dart';
import 'package:connect/services/services.dart';

class SignInUI extends StatefulWidget {
  _SignInUIState createState() => _SignInUIState();
}

class _SignInUIState extends State<SignInUI> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _password = new TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _loading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);

    return Scaffold(
      key: _scaffoldKey,
      body: LoadingScreen(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    // LogoGraphicHeader(),
                    // SizedBox(height: 48.0),

                    Container(
                        height: 43,
                        alignment: Alignment.centerLeft,
                        child: Image.asset('assets/images/welcome/icon.png')),
                    SizedBox(height: 28.0),
                    Container(
                        height: 53,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '환영합니다!',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Apple SD Gothic Neo',
                              fontSize: 42,
                              fontWeight: FontWeight.bold),
                        )),
                    SizedBox(height: 9.0),
                    Container(
                      height: 29,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '로그인을 진행해주세요',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(150, 167, 175, 1),
                            fontFamily: 'Apple SD Gothic Neo',
                            fontSize: 24,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      ),
                    ),
                    SizedBox(height: 37.0),
                    FormInputFieldWithIcon(
                      controller: _email,
                      iconPrefix: Icons.email,
                      labelText: labels.auth.emailFormField,
                      validator: Validator(labels).email,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => null,
                      onSaved: (value) => _email.text = value,
                    ),
                    FormVerticalSpace(),
                    FormInputFieldWithIcon(
                      controller: _password,
                      iconPrefix: Icons.lock,
                      labelText: labels.auth.passwordFormField,
                      validator: Validator(labels).password,
                      obscureText: true,
                      onChanged: (value) => null,
                      onSaved: (value) => _password.text = value,
                      maxLines: 1,
                    ),
                    FormVerticalSpace(),
                    Container(

                      height: 40.0,
                      child : RaisedButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 0,
                          onPressed: () {
                            print("3");
                          },
                          child: Text(
                            '로그인',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(49, 69, 106, 1),
                                fontFamily: 'Apple SD Gothic Neo',
                                fontSize: 24,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                    ),
                    new SizedBox(
                      width: 200.0,
                      height: 100.0,
                      child: new RaisedButton(
                        child: new Text('Blabla blablablablablablabla bla bla bla'),
                        onPressed: () {},
                      ),
                    ),
                    /*PrimaryButton(
                        labelText: labels.auth.signInButton,
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              _loading = true;
                            });
                            AuthService _auth = AuthService();
                            bool status = await _auth
                                .signInWithEmailAndPassword(
                                    _email.text, _password.text)
                                .then((status) {
                              setState(() {
                                _loading = false;
                              });
                              return status;
                            });
                            if (!status) {
                              _scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text(labels.auth.signInError),
                              ));
                            }
                          }
                        }),

                     */
                    FormVerticalSpace(),
                    LabelButton(
                      labelText: labels.auth.resetPasswordLabelButton,
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, '/reset-password'),
                    ),
                    LabelButton(
                      labelText: labels.auth.signUpLabelButton,
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, '/signup'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        inAsyncCall: _loading,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
