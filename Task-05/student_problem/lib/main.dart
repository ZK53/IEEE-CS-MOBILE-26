import 'package:question2/models/bank_account.dart';
import 'package:question2/models/client.dart';
import 'package:question2/models/enums/enums.dart';

void main(List<String> args) {
  BankAccount account1 = BankAccount(
    accountNumber: "73740192",
    balance: 25000,
    accountType: AccountType.current,
    currency: Currency.EGP,
  );

  BankAccount account2 = BankAccount(
    accountNumber: "73700438",
    balance: 1800,
    accountType: AccountType.saving,
    currency: Currency.USD,
  );

  Client client = Client(name: "Mohamed Zakaria", clientNumber: "9348574");
  client.addAccount(account1);
  client.addAccount(account2);
  client.showInfo();

  print("Making a deposit to account 1");
  account1.deposit(1500);
  print("Making a 5000 withdraw to account 2");
  account2.withdraw(5000);
  print("Making a 300 withdraw to account 2");
}
