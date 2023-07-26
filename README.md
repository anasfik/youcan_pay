# YouCan Pay Dart SDK

This is Dart/Flutter SDK for [YouCan Pay APIs](https://youcanpay.com/docs), which helps you to integrate YouCan Pay into your Dart/Flutter project easily, and make your life more easier.

### Key features

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

- [] [Account](https://youcanpay.com/docs/api#account)
- [] [Payment](https://youcanpay.com/docs/api#payment)
- [] [Currencies](https://youcanpay.com/docs/api#currencies)
- [] [Transfers](https://youcanpay.com/docs/api#transfers)
- [] [Invoices](https://youcanpay.com/docs/api#invoices)
- [] [Balance History](https://youcanpay.com/docs/api#balance_history)
- [] [Withdrawals](https://youcanpay.com/docs/api#withdrawals)
- [] [Deposit](https://youcanpay.com/docs/api#deposit)

## Usage

#### Quick Overview

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

