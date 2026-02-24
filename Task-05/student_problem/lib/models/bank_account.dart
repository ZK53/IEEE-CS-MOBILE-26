import 'package:question2/models/enums/enums.dart';

class BankAccount {
  final String _accountNumber;
  double _balance;
  final AccountType _type;
  final Currency _currency;

  BankAccount({
    required String accountNumber,
    required double balance,
    required AccountType accountType,
    required Currency currency,
  }) : _accountNumber = accountNumber,
       _balance = balance,
       _type = accountType,
       _currency = currency;

  String get accountNumber => _accountNumber;
  double get balance => _balance;

  void withdraw(double amount) {
    if (amount > 0) {
      if (balance - amount < 0) {
        print("Insufficient funds");
      } else {
        _balance -= amount;
        print("Withdrawn $amount successfully");
      }
    } else {
      print("Invalid Input");
    }
  }

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print("Deposited $amount successfully");
    } else {
      print("Invalid Input");
    }
  }

  @override
  String toString() {
    return """\n
Account Number: $accountNumber
Account Type: ${_type.name}
Balance: $_balance ${_currency.name}\n
""";
  }
}
