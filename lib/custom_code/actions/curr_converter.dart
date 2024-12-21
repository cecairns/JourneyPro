// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<double> currConverter(
  double amount,
  String fromCurrency,
  String toCurrency,
) async {
  // Define hardcoded exchange rates relative to USD
  final rates = {
    "USD (US Dollar)": 1.0, // US Dollar
    "EUR (Euro)": 0.917, // Euro
    "JPY (Yen)": 151.97, // Japanese Yen
    "GBP (British Pound)": 0.77, // British Pound
    "CAD (Canadian Dollar)": 1.3888, // Canadian Dollar
    "AUD (Australian Dollar)": 1.514, // Australian Dollar
    "INR (Indian Rupee)": 74.0, // Indian Rupee
    "CNY (Chinese Yuan)": 7.098, // Chinese Yuan
    "BRL (Brazilian Real)": 5.76 // Brazilian Real
    // Add more currencies as needed
  };

  // Convert amount to USD first, then to the target currency
  double amountInUSD = amount / rates[fromCurrency]!;
  double convertedAmount = amountInUSD * rates[toCurrency]!;

  // Round to 2 decimal places using multiplication and division
  convertedAmount = (convertedAmount * 100).round() / 100;

  return convertedAmount;

  // Add your function code here!
}
