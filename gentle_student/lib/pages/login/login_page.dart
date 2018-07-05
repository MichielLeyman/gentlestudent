import 'package:Gentle_Student/pages/home/home_page.dart';
import 'package:Gentle_Student/pages/opportunity_list/opportunity_list_page.dart';
import 'package:Gentle_Student/pages/register/register_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  var emailController;
  var wachtwoordController;

  _LoginPageState() {
    emailController = new TextEditingController();
    wachtwoordController = new TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    wachtwoordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
        tag: 'hero',
        child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 60.0,
            child: Image.asset('assets/crest-gentlestudent.png')));

    final email = TextField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: emailController,
      decoration: InputDecoration(
          labelText: 'E-mailadres',
          hintText: 'naam@student.arteveldehs.be',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );

    final password = TextField(
      autofocus: false,
      obscureText: true,
      controller: wachtwoordController,
      decoration: InputDecoration(
          labelText: 'Wachtwoord',
          hintText: '**********',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            //Navigator.of(context).pushNamed(HomePage.tag);
            Navigator.of(context).pushNamed(OpportunityListPage.tag);
          },
          color: Colors.lightBlueAccent,
          child: Text('Log in', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    final registerLabel = FlatButton(
      child:
          Text('Geen account? Registreer hier!', style: TextStyle(color: Colors.black54)),
      onPressed: () {
        Navigator.of(context).pushNamed(RegisterPage.tag);
      },
    );

    return Scaffold(
      appBar: new AppBar(
        title: new Text("Login", style: TextStyle(color: Colors.white)),
      ),
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            registerLabel
          ],
        ),
      ),
    );
  }
}
