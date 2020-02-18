# Dropsuite
This ruby application is to count on how many files inside a path with the same content. It can have the same name or not.

The application is able to scan any folder that you like, without changing anything on the code. It simply needs your input for the wanted target folder destination

## Depedencies
ruby 2.6.3
## Usage

Use the `main.rb` file to run the program with `ruby` syntax.

```bash
ruby main.rb
```
while the program is running there will be a prompt that only needs your input for the wanted target folder destination

```bash
What is the folder name or its path :
DropsuiteTest
Results :
abcdef 4
```

## Testing

Use the `converter_test.rb` file to run the unit testing with `ruby` syntax.

```bash
ruby converter_test.rb.rb
```
Here is the example of the result of the unit testing.
``` bash
Loaded suite converter_test
Started
........
Finished in 0.0233976 seconds.
------------------------------------------------------------------------------------------------------------------------
8 tests, 10 assertions, 0 failures, 0 errors, 0 pendings, 0 omissions, 0 notifications
100% passed
------------------------------------------------------------------------------------------------------------------------
341.92 tests/s, 427.39 assertions/s
```
## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.
