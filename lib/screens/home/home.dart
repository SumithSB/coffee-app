import 'package:first_vsapp/screens/home/settings_form.dart';
import 'package:first_vsapp/screens/models/newa.dart';
import 'package:first_vsapp/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_vsapp/services/database.dart';
import 'package:provider/provider.dart';

import 'new_list.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettings(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }
    return StreamProvider<List<Newa>>.value(
        value: DatabaseService().newa,
        child: Scaffold(
          backgroundColor: Colors.brown[50],
          appBar: AppBar(
            title: Text("Welcome"),
            backgroundColor: Colors.brown[400],
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                label: Text(
                  "Logout",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  await _auth.signout();
                },
              ),
              FlatButton.icon(
                icon: Icon(Icons.settings,
                color: Colors.white,
                ),
                label: Text(
                  'Settings',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: (){
                  _showSettings();
                },
              ),
            ],
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/coffee.jpeg')
              )
            ),
              child: NewList()
          ),
        ));
  }
}
