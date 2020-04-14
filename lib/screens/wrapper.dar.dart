import 'file:///C:/Users/sumit/AndroidStudioProjects/first_vsapp/lib/screens/authenticate/authenticate.dart';
import 'package:first_vsapp/screens/home/home.dart';
import 'package:first_vsapp/screens/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    //Either home or autheticate
    if (user == null) {
      return Authenticate();
    }
    else {
      return Home();
    }
  }
}
