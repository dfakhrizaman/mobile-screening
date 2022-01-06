import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test/pages/home_page_vm.dart';
import 'package:suitmedia_test/pages/second_page_vm.dart';
import 'package:suitmedia_test/pages/third_page.dart';

import 'package:suitmedia_test/widgets/button.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homePageViewModel = Provider.of<HomePageViewModel>(context);
    final secondPageViewModel = Provider.of<SecondPageViewModel>(context);

    return SafeArea(
      child: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text(
            'Second Screen',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        child: SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          homePageViewModel.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    secondPageViewModel.selectedUser == ''
                        ? 'Selected User Name'
                        : secondPageViewModel.selectedUser,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Button(
                    buttonText: 'Choose a User',
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ThirdPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
