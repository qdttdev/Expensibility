import 'package:flutter/foundation.dart'; // for @required

class Transaction
{
  // Attributes
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  // Constructors
   Transaction
   ({
      @required this.id,
      @required this.title,
      @required this.amount,
      @required this.date
   });

}