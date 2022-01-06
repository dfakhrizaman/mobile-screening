import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test/pages/home_page_vm.dart';

class TextInput extends StatelessWidget {
  final String hintText;
  final String usage;

  const TextInput({
    Key? key,
    required this.hintText,
    required this.usage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homePageViewModel = Provider.of<HomePageViewModel>(context);

    return TextField(
      onChanged: (value) {
        switch (usage) {
          case 'name':
            homePageViewModel.updateName(value);
            break;

          case 'palindrome':
            homePageViewModel.updatePalindromeText(value);
            break;

          default:
        }
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        hintStyle: TextStyle(color: Colors.grey[800]),
        hintText: hintText,
        fillColor: Colors.white70,
      ),
    );
  }
}
