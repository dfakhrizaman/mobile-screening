import 'package:flutter/material.dart';

class HomePageViewModel with ChangeNotifier {
  String _name = '';
  String _palindromeText = '';

  String get name => _name;
  String get palindrome => _palindromeText;

  void updateName(newValue) {
    _name = newValue;
  }

  void updatePalindromeText(newValue) {
    _palindromeText = newValue;
  }

  String checkPalindrome() {
    String reversed = _palindromeText.split('').reversed.join('');

    String isPalindrome;

    reversed == _palindromeText
        ? isPalindrome = 'It is a Palindrome'
        : isPalindrome = 'Not a Palindrome';

    return isPalindrome;
  }
}
