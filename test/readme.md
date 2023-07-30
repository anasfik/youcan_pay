# Tests

Test made for this package includes internal tooling unit tests, as well as integration that connects to Youcan pay ends unit tests, I don't have any responsibility about the source Youcan Pay APIs ends.

Every time a new release is up to be deployed for production use, the tests will be run to ensure the package is working as expected.

if you want yourself to just test and ensure the package is working as expected, you don't have to change the public or private keys, they are of an account of mine that I created for testing purpose.

However, if you still need to set your own keys, then inside the `test/` folder, open the `vars.dart` file, then change the keys to your own.

To run tests, open your terminal and run the following command:

```bash
dart test
```
