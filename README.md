# YouCan Pay Dart SDK

This is Dart/Flutter SDK for [YouCan Pay APIs](https://youcanpay.com/docs/api), which helps you to communicate with YouCan Pay in your Dart/Flutter project easily, and make your life more easier.

## Key features

- Easy to use methods that reflects the API endpoints based on it's documentation.
- Developer friendly, you will feel at home working with this package.
- Supports all the API endpoints.
- Configure once, use everywhere.

### Code progress (100)

- [x] [Payment](#payment)
- [x] [Account](#account)
- [x] [Currencies](#currencies)
- [x] [Transfers](#transfers)
- [x] [Invoices](#invoices)
- [x] [Balance History](#balance-history)
- [x] [Withdrawals](#withdrawals)
- [x] [Deposit](#deposit)
- [x] Fully standalone Flutter integration

### Test progress (100%)

- [x] [Payment](#payment)
- [x] [Account](#account)
- [x] [Currencies](#currencies)
- [x] [Transfers](#transfers)
- [x] [Invoices](#invoices)
- [x] [Balance History](#balance-history)
- [x] [Withdrawals](#withdrawals)
- [x] [Deposit](#deposit)

## Usage

### Quick Overview

#### Youcan Pay APIs 

This package provides access to APIs via modules reflecting the base APIs documentation, each module of the SDK can be accessed via the one & only singleton of it, which is `YouCanPay.instance`, these are wat you can access via this singleton:

```dart
  YouCanPay.instance.account;
  
  YouCanPay.instance.balanceHistory; 
  
  YouCanPay.instance.currencies; 
  
  YouCanPay.instance.deposits; 
  
  YouCanPay.instance.invoices; 
  
  YouCanPay.instance.payments; 
  
  YouCanPay.instance.transfers;
  
  YouCanPay.instance.withdrawals; 
```

And each module will contain a set of methods that relates to it, as example to access the account's register API, you can use the following code:

```dart
RegisterResponse registerResponse = await YouCanPay.instance.account.register(
   email: "john@example.com",
   firstName: "John",
   lastName: "Doe",
   password: "123456789",
   phone: "+212611223344",
);
```

#### Flutter Payment integration

`YouCanPay.instance` offers now access to a `flutter` module via:

```dart
  YouCanPay.instance.flutter;
```

Which provides an opinionated standalone payment integration for flutter, which is fully configurable and ready to use, this is an example of processing a payment:

```dart
 YouCanPay.instance.flutter.processPay(
     context,
     paymentToken: "THE_TOKEN_OF_PAYMENT",
     pubKey: "YOUR_PUBLIC_KEY",
     card: YouCanPayCard(
       cardHolderName: "Anas Fikhi",
       creditCard: 4242424242424242,
       cvv: 112,
       expireDate: YouCanPayExpireDate(month: 12, year: 2024),
     ),
     on3dsVerificationFailed: (context, res) {
       _snackBar(res.message);
     },
     onPaymentFailed: (exception, stacktrace) {
       _snackBar(exception.message);
     },
     onPaymentSuccessWithout3dsVerification: (res) {
       _snackBar(res.message);
     },
     onPaymentSuccessWith3dsVerification: (context, res) {
       _snackBar(res.transactionId);
     },
  );
```

- `onPaymentSuccessWithout3dsVerification` will hbe called if a payment was processed successfully with ease directly after calling `processPay`. accurately, when the card don't require any 3ds verification.

_ `onPaymentSuccessWith3dsVerification` will be called if a payment was processed successfully after the user verifies/authorize it in the 3ds verification web view.

- `on3dsVerificationFailed` will be called if the user was prompted to verify/authorize the payment in the web view, but the operation failed. as example, if the user chooses to cancel the payment manually..

- `onPaymentFailed` will be called if the payment had directly failed after calling `processPay`. as example, due to an invalid card information, invalid token, insufficient funds, bank rejection...

<br>

While testing/developing, you may be willing to use [test cards](https://youcanpay.com/docs#testing_and_test_cards), right? you can access/use those card via `YouCanPayCard` factories:

```dart
  YouCanPayCard.testingNo3dsSuccessCard();
  
  YouCanPayCard.testing3dsSuccessCard();
  
  YouCanPayCard.testing3dsRejectedCard();
  
  YouCanPayCard.testingNo3dsNoFundsCard();
```

### Error handling

All methods of this package will throw an exception if something went wrong from Youcan Pay ends, you can catch and handle them as you want.

#### Way 1

You can trigger the `YouCanPayException` exception & catch it, then you will be able to use it's message.. like this:

```dart
try {  
    RegisterResponse registerResponse = await YouCanPay.instance.account.register(...);
    print(registerResponse.message);
  } on YouCanPayException catch (e) {
    print(e.message); // This will print the error message from the APIs.
    print(e.statusCode); // This will print the status code of the response.
  } catch(e) {
    print(e);
  }
```

#### Way 2

The APIs exposes some [pre-defined error](https://youcanpay.com/docs/api#errors) codes that you can expect to happen while developing, with this package you have the option to execute an action based on each one, like this:

```dart
try {  
    RegisterResponse registerResponse = await YouCanPay.instance.account.register(...);
    print(registerResponse.message);
  } on YouCanPayException catch (e) {
    switch (e) {
      case YouCanPayNotFoundException():
        print("Not found");
        break;

      case YouCanPayBadRequestException():
        print("Bad request");
        break;

      case YouCanPayServerErrorException():
        print("Server error");
        break;

      case YouCanPayUnAuthorizedException():
        print("UnAuthorized");
        break;

      case YouCanPayUnprocessableEntityException():
        print("UnprocessableEntity");
        break;

      default:
        print("Unknown error");
    }

    print(e.message);
    print(e.statusCode);    
  
    } catch(e) {
    print(e);
  }

```

It is up to your case to handle the error as you want. as a bonus, you can also use the `statusCode` to handle the error.

## Documentation

### Payment

#### Tokenize Payment

You can tokenize a new payment by using the `tokenize` method.

```dart
  TokenizeResponse response = await YouCanPay.instance.payments.tokenize(
      amount: 150000,
      priKey: "pri_sandbox_9f410153-b941-47f5-9154-c1981",
      currency: "MAD",
      orderId: "orderId",
    );
    
    print(response.token); // ...
```

#### CashPlus Gateway

This will process the payment using CashPlus Gateway

```dart
    final res = await YouCanPay.instance.payments.cashPlusInit(
    pubKey: "YOUR_PUBLIC_KEY",
     tokenId: "PAYMENT_TOKEN",
    );

    print(res.tokenId);
    print(res.transactionId);
```

#### Card Gateway Sale

This will process the payment. However, based on the status of the payment, the response will be different and so you will o check & handle each case:

- if the payment is successful, you will get a `SuccessfulPayResponse` object.
- if the payment requires a 3ds verification, you will get a `Verification3dsPayResponse` object.
- if the payment is unsuccessful (as example if the card has no funds), an `YouCanPayUnprocessableEntityException` exception will be throws, check [Error handling](#error-handling) for more details.
- if in any case the response is not expected, you will get an `UnknownPayResponse` object with the decoed json response.

```dart
    final res = await YouCanPay.instance.payments.pay(
      pubKey: "YOUR_PUBLIC_KEY",
      tokenId: "PAYMENT_TOKEN",
      cardHolderName: "Anas FIKHI",
      creditCard: 4242424242424242,
      cvv: 112,
      expireDate: YouCanPayExpireDate(month: 10, year: 24),
    );

    if (payResponse is SuccessfulPayResponse) {
      print("success payment");
      print(payResponse.transactionId);
      print(payResponse.message);
      print(payResponse.orderId);
    } else if (payResponse is Verification3dsPayResponse) {
      print("3ds verification payment");
      print(payResponse.redirectUrl);
      print(payResponse.returnUrl);
      print(payResponse.transactionId);
    } else if (payResponse is UnknownPayResponse) {
      print("unknown payment");
      print(payResponse.decodedJsonResponse);
    }
```

#### Card Gateway Authorization

This will process a payment using a authorization operation. This is faster than the sale operation as it only authorizes the payment. The capture is then done asynchronously within 30 seconds of the authorization.

```dart
    final res = await YouCanPay.instance.payments.authorize(
      pubKey: "YOUR_PUBLIC_KEY",
      tokenId: "PAYMENT_TOKEN",
      cardHolderName: "Anas FIKHI",
      creditCard: 4242424242424242,
      cvv: 112,
      expireDate: YouCanPayExpireDate(month: 10, year: 24),
    );

    if (payResponse is SuccessfulPayResponse) {
      print("success payment");
      print(payResponse.transactionId);
      print(payResponse.message);
      print(payResponse.orderId);
    } else if (payResponse is Verification3dsPayResponse) {
      print("3ds verification payment");
      print(payResponse.redirectUrl);
      print(payResponse.returnUrl);
      print(payResponse.transactionId);
    } else if (payResponse is UnknownPayResponse) {
      print("unknown payment");
      print(payResponse.decodedJsonResponse);
    }
```

### Account

#### Register for an account

You can create a new account by using the `register` method.

```dart
   final res = await YouCanPay.instance.account.register(
     email: "john@example.com",
     firstName: "John",
     lastName: "Doe",
     password: "123456789",
     phone: "+212611223344", 
   );

    print(res.message);
  
```

#### Authentication

You can authenticate a user by using the `authenticate` method, it will return a `AuthenticateResponse` object that contains the user's token that you can use in the next requests.

```dart
   final res = await YouCanPay.instance.account.login(
     emailOrPhone: email,
     password: password,
   );
   
   print(res.token);
```

#### Account Information

You can get a user related informations by using the `me` method that requires only the user's token.

```dart
   final res = await YouCanPay.instance.account.me(
     token: "THE_USER_TOKEN",
   );
   
   print(res.email);
   print(res.address);
   print(res.phone);
```

#### Update Account Information

In order to update a user's account informations, you can use the `updateAccount` method:

```dart

   final res = await YouCanPay.instance.account.updateAccount(
     token: "TOKEN_OF_THE_USER",
     firstName: "anas fikhi",
     adress: "...",
   );
   
   print(res.message);
```

#### Update Account Password

In order to update a user's password, you can use the `updatePassword` method:

```dart

   final res = await YouCanPay.instance.account.updatePassword(
     token: "TOKEN_OF_THE_USER",
     password: "newPassword",
   );
   
   print(res.message);
```

#### Account Stats

In order to get a user's account stats, you can use the `stats` method:

```dart
   final res = await YouCanPay.instance.account.stats(
     token: "TOKEN_OF_THE_USER",
     fromDate: DateTime.now().subtract(Duration(days: 5)),
     toDate: DateTime.now(),
     interval: YouCanPayStatsInterval.thisWeek,
    );
   
   print(res.totalRevenue);
   print(res.paidTransactionsByDates);
```

#### Refresh Auth Token

To refresh a user's auth token, you can use the `refreshToken` method:

```dart
   final res = await YouCanPay.instance.account.refreshToken(
     token: "TOKEN_OF_THE_USER",
   );
   
   print(res.token); // The new token
```

#### Logout

To logout a user, you can use the `logout` method. This methpd will invalidate the current user's token, so he will not be able to use it anymore until he authenticates again.

```dart
   final res = await YouCanPay.instance.account.logout(
     token: "TOKEN_OF_THE_USER",
   );
   
   print(res.message);
```

### Currencies

#### Conversion rates

You can get the convertion rates of a currency by using the `convertionRates` method:

```dart
   final res = await YouCanPay.instance.currencies.conversionRates(
     token: "TOKEN_OF_THE_USER",
   );
   
   print(res.baseCurrency);
   print(res.conversionRates["MAD"]);
   print(res.conversionRates["USD"]);

```

### Transfers

#### Create a transfer

You can create a new transfer by using the `create` method:

```dart
   final res = await YouCanPay.instance.transfers.create(
     token: "TOKEN_OF_THE_USER",
     amount: 1000,
     identifier: "work@gwhyyy.com",
   );

    print(res.id); // The transfer's id
```

#### List transfers

To list all the transfers of a user, you can use the `transfers` method:

```dart
   final res = await YouCanPay.instance.transfers.transfers(
     token: "TOKEN_OF_THE_USER",
   );

    print(res.data.map((e) => e.id).toList()); // The list of transfers ids
```

#### Recent Recipients

To get the recent recipients, you can use the `recentRecipients` method:

```dart
   final res = await YouCanPay.instance.transfers.recentRecipients(
     token: "TOKEN_OF_THE_USER",
   );

    print(res.data.map((e) => e.id).toList()); // The list of recent recipients ids
```

### Invoices

#### Create an invoice

You can create a new invoice by using the `create` method:

```dart
  final res = await YouCanPay.instance.invoices.create(
    token: "TOKEN_OF_THE_USER",
    amount: 4000,
    contactOption: 1,
    name: "anas fikhi",
    currency: "MAD",
  );

  print(res.id);
  print(res.alias);
  print(res.displayAmount);
```

#### List invoices

To list all the invoices of a user, you can use the `invoices` method:

```dart
  final res = await YouCanPay.instance.invoices.invoices(
    token: "TOKEN_OF_THE_USER",
  );

  print(res.data.map((e) => e.id).toList()); // The list of invoices ids
```

#### Tokenize an invoice

You can tokenize an invoice by using the `tokenize` method:

```dart
  final res = await YouCanPay.instance.invoices.tokenize(
    token: "TOKEN_OF_THE_USER",
    invoiceId: "INVOICE_ID",
  );

  print(res.tokenID);
```

### Balance History

#### List balance history

To list all the balance history of a user, you can use the `balanceHistory` method:

```dart
  final res = await YouCanPay.instance.balanceHistory.history(
    token: "TOKEN_OF_THE_USER",
  );

  print(res.data.map((e) => e.id).toList()); // The list of balance history items ids
```

### Withdrawals

#### Create a withdrawal

You can create a new withdrawal by using the `create` method:

```dart
    final res = await YouCanPay.instance.withdrawals.create(
      token: "TOKEN_OF_THE_USER",
      paymentMethod: YouCanPayPaymentsMethod.bank_account,
      amount: 500,
    );

    print(res.message);

```

#### List withdrawals

To get a list of withdrawals, you can use the `withdrawals` method:

```dart
    final res = await YouCanPay.instance.withdrawals.withdrawals(
      token: "TOKEN_OF_THE_USER",
    );

    print(res.data.map((e) => e.id).toList()); // The list of withdrawals ids
```

### Deposit

#### Tokenize

In order to tokenize a deposit, you can use hte `tokenize` method:

```dart

    final res = await YouCanPay.instance.deposits.tokenize(
      token: "TOKEN_OF_THE_USER",
      amount: 1000,
      currency: 'MAD',
    );

    print(res.tokenId);
```

## Want to contribute?

You are welcome to contribute to this project, just fork it and make a pull request, we will be happy to review it and merge it, these are some tasks that you can work on:

- [] Find and correct mistakes in the documentation.
- [] Handle unexpected behaviors if they happen.
- [] Refactor, or add new funcionalities to the package.
- [] Make the package more developer friendly.

## Issues

If you find any issue, please report it [here](https://github.com/anasfik/youcan_pay/issues)

