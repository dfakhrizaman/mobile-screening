import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test/pages/home_page_vm.dart';
import 'package:suitmedia_test/pages/second_page.dart';
import 'package:suitmedia_test/widgets/button.dart';
import 'package:suitmedia_test/widgets/text_input.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homePageViewModel = Provider.of<HomePageViewModel>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage(
                  "assets/btn_add_photo.png",
                ),
                height: 116,
              ),
              const SizedBox(height: 50),
              const TextInput(
                hintText: 'Name',
                usage: 'name',
              ),
              const SizedBox(height: 20),
              const TextInput(
                hintText: 'Palindrome',
                usage: 'palindrome',
              ),
              const SizedBox(height: 50),
              Button(
                buttonText: 'CHECK',
                onPressed: () {
                  // print(homePageViewModel.checkPalindrome());
                  palindromeDialog(context, homePageViewModel);
                },
              ),
              const SizedBox(height: 20),
              Button(
                buttonText: 'NEXT',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecondPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> palindromeDialog(
      BuildContext context, HomePageViewModel homePageViewModel) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Is it a palindrome?'),
          content: SingleChildScrollView(
              child: Text(homePageViewModel.checkPalindrome())),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
