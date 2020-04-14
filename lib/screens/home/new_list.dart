import 'package:first_vsapp/screens/home/newtile.dart';
import 'package:first_vsapp/screens/models/newa.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewList extends StatefulWidget {
  @override
  _NewListState createState() => _NewListState();
}

class _NewListState extends State<NewList> {
  @override
  Widget build(BuildContext context) {

    final newa = Provider.of<List<Newa>>(context);

    return ListView.builder(
      itemCount: newa?.length??0,
      itemBuilder: (context,index){
        return NewTile(newa: newa[index]);
      },
    );
  }
}
