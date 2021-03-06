import 'package:first_vsapp/services/auth.dart';
import 'package:first_vsapp/shared/constants.dart';
import 'package:first_vsapp/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String email = '';
  String pass = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign up"),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person,color: Colors.white,),
            label: Text("Sign in",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: (){
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child:Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration,
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val){
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                validator: (val) => val.length < 6 ? 'Enter a password more than 6 characters' : null,
                obscureText: true,
                onChanged: (val){
                  pass = val;
                },
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async{
                  if(_formKey.currentState.validate()){
                    setState(() {
                      loading = true;
                    });
                   dynamic result = await _auth.registerWithEmail(email,pass);
                   if(result == null){
                     setState(() {
                       error = 'Enter valid email';
                       loading = false;
                     });
                   }
                  }
                },
              ),
              SizedBox(height: 12.0,),
              Text(error,
              style: TextStyle(
                color: Colors.red,
                fontSize: 14.0
              ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
