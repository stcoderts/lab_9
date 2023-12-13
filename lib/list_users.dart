import 'package:flutter/material.dart';
import 'package:lab_9/db_helper.dart';

class User_List extends StatefulWidget {
  @override
  _User_List createState() => _User_List();
}

class _User_List extends State<User_List> {
  late List<User> users;

  @override
  void initState() async {
    super.initState();
    users = await DBHelper().test_read('user');
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      children: [
        TableRow(children: [
          Text('id'),
          Text('username'),
          Text('phone'),
          Text('email'),
          Text('address')
        ]),
        for (final user in users)
          TableRow(children: [
            Text(user.id.toString()),
            Text(user.username),
            Text(user.phone),
            Text(user.email),
            Text(user.address)
          ])
      ],
    );
  }
}