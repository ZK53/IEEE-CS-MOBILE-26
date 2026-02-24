import 'package:question2/models/bank_account.dart';

class Client {
  final String _name;
  final String _clientNumber;
  final List<BankAccount> _accounts = [];

  Client({required String name, required String clientNumber})
    : _name = name,
      _clientNumber = clientNumber;

  void addAccount(BankAccount account) {
    _accounts.add(account);
  }

  void showInfo() {
    print("""
Client Number: $_clientNumber
Client Name: $_name
Account Details:

""");
    for (BankAccount account in _accounts) {
      print(account);
    }
  }
}
