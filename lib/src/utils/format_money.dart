import 'package:intl/intl.dart';

class Transaction {
  final double value;
  Transaction(
    this.value,
  );

  String getCurrency() {
    NumberFormat formatter = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return formatter.format(value);
  }
}
