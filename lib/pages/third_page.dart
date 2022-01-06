import 'package:flutter/cupertino.dart';
import 'package:suitmedia_test/widgets/user_list.dart';
// import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            'Third Screen',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        child: SafeArea(
          child: UserList(),
        ),
      ),
    );
  }
}
