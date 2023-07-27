# YouCan Pay Dart SDK

This is Dart/Flutter SDK for [YouCan Pay APIs](https://youcanpay.com/docs), which helps you to integrate YouCan Pay into your Dart/Flutter project easily, and make your life more easier.

## Key features

- Easy to use methods that reflects the API endpoints based on it's documentation.
- Developer friendly, you will feel at home working with this package.
- Supports all the API endpoints.
- Configure once, use everywhere.


### Code progress (100%)

- [x] [Payment](https://youcanpay.com/docs/api#payment)
- [x] [Account](https://youcanpay.com/docs/api#account)
- [x] [Currencies](https://youcanpay.com/docs/api#currencies)
- [x] [Transfers](https://youcanpay.com/docs/api#transfers)
- [x] [Invoices](https://youcanpay.com/docs/api#invoices)
- [x] [Balance History](https://youcanpay.com/docs/api#balance_history)
- [x] [Withdrawals](https://youcanpay.com/docs/api#withdrawals)
- [x] [Deposit](https://youcanpay.com/docs/api#deposit)


### Test progress (0%)

- [-] [Account](https://youcanpay.com/docs/api#account)
- [-] [Payment](https://youcanpay.com/docs/api#payment)
- [-] [Currencies](https://youcanpay.com/docs/api#currencies)
- [-] [Transfers](https://youcanpay.com/docs/api#transfers)
- [-] [Invoices](https://youcanpay.com/docs/api#invoices)
- [-] [Balance History](https://youcanpay.com/docs/api#balance_history)
- [-] [Withdrawals](https://youcanpay.com/docs/api#withdrawals)
- [-] [Deposit](https://youcanpay.com/docs/api#deposit)

## Usage

### Quick Overview

This package provides access to each module of the SDK via the one & only singleton of it, `YouCanPay.instance`.

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

Each module contains a set Of methods that relates to it, as example to access the account's register API, you can use the following code:

```dart
RegisterResponse registerResponse = await YouCanPay.instance.account.register(
   email: "john@example.com",
   firstName: "John",
   lastName: "Doe",
   password: "123456789",
   phone: "+212611223344",
);
```

### Error handling

All methods of this package will throw an exception if something went wrong, you can catch it and handle it as you want.

##### Example 1: 

You can catch the exception and get the error message from it like this:

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

##### Example 2

The APIs exposes some error codes that you can expect to happen, with this package you have the option to catch them and handle them like this:

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

it is up to your case to handle the error as you want, you can also use the `statusCode` to handle the error.

### Documentation

#### Payment

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

This will process a payment using a sale operation. currently, the package supports only direct payments that are authorized and don't required 3ds authorization.

```dart
    final res = await YouCanPay.instance.payments.pay(
      pubKey: "YOUR_PUBLIC_KEY",
      tokenId: "PAYMENT_TOKEN",
      cardHolderName: "Anas FIKHI",
      creditCard: 4242424242424242,
      cvv: 112,
      expireDate: YouCanPayExpireDate(month: 10, year: 24),
    );

    print(res.message); // ...
    print(res.transactionId); // ...
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

    print(res.message); // ...
    print(res.transactionId); // ...
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
     token: token,
     firstName: "anas fikhi",
     adress: "...",
   );
   
   print(res.message);
```

#### Update Account Password

In order to update a user's password, you can use the `updatePassword` method:

```dart

   final res = await YouCanPay.instance.account.updatePassword(
     token: token,
     password: "newPassword",
   );
   
   print(res.message);
```

#### Account Stats

In order to get a user's account stats, you can use the `stats` method:

```dart
   final res = await YouCanPay.instance.account.stats(
     token: token,
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
     token: token,
   );
   
   print(res.token); // The new token
```

#### Logout

To logout a user, you can use the `logout` method. This methpd will invalidate the current user's token, so he will not be able to use it anymore until he authenticates again.

```dart
   final res = await YouCanPay.instance.account.logout(
     token: token,
   );
   
   print(res.message);
```

### Currencies

#### Conversion rates

You can get the convertion rates of a currency by using the `convertionRates` method:

```dart
   final res = await YouCanPay.instance.currencies.conversionRates(
     token: token,
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
     token: token,
     amount: 1000,
     identifier: "work@gwhyyy.com",
   );

    print(res.id); // The transfer's id
```

#### List transfers

To list all the transfers of a user, you can use the `transfers` method:

```dart
   final res = await YouCanPay.instance.transfers.transfers(
     token: token,
   );

    print(res.data.map((e) => e.id).toList()); // The list of transfers ids
```

#### Recent Recipients

To get the recent recipients, you can use the `recentRecipients` method:

```dart
   final res = await YouCanPay.instance.transfers.recentRecipients(
     token: token,
   );

    print(res.data.map((e) => e.id).toList()); // The list of transfers ids
```
