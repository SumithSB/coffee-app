import 'package:flutter/material.dart';
import 'package:first_vsapp/screens/models/newa.dart';

class NewTile extends StatelessWidget {
 final Newa newa;
 NewTile({this.newa});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[newa.strength],
            backgroundImage: AssetImage('images/coffee1.png'),
          ),
          title: Text(newa.name),
          subtitle: Text('${newa.sugars} sugar(s)\n Strength:${newa.strength}'),
          isThreeLine: true,

        ),
      ),
    );
  }
}
