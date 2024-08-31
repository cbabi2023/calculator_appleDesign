import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String displayText = '0'; // Initial display text
  String operation = ''; // Holds the current operation
  double firstNumber = 0; // First number for operation
  double secondNumber = 0; // Second number for operation
  String lastOperation =
      ''; // Last operation to determine if calculation is needed

  // Method to handle button presses
  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'AC') {
        displayText = '0';
        operation = '';
        firstNumber = 0;
        secondNumber = 0;
        lastOperation = '';
      } else if (buttonText == '+/-') {
        displayText = (double.parse(displayText) * -1).toString();
      } else if (buttonText == '%' || buttonText == '/') {
        firstNumber = double.parse(displayText);
        lastOperation = buttonText;
        displayText = '0';
        operation = '$firstNumber $lastOperation';
      } else if (buttonText == 'x' || buttonText == '-' || buttonText == '+') {
        firstNumber = double.parse(displayText);
        lastOperation = buttonText;
        displayText = '0';
        operation = '$firstNumber $lastOperation';
      } else if (buttonText == '=') {
        secondNumber = double.parse(displayText);
        if (lastOperation == '+') {
          displayText = (firstNumber + secondNumber).toString();
        } else if (lastOperation == '-') {
          displayText = (firstNumber - secondNumber).toString();
        } else if (lastOperation == 'x') {
          displayText = (firstNumber * secondNumber).toString();
        } else if (lastOperation == '/') {
          displayText = (firstNumber / secondNumber).toString();
        }
        lastOperation = '';
        operation = '';
      } else {
        if (displayText == '0') {
          displayText = buttonText;
        } else {
          displayText += buttonText;
        }
      }
    });
  }

  Widget calcbutton(String btntxt, Color btncolor, Color txtcolor) {
    return GestureDetector(
      onTap: () {
        buttonPressed(btntxt);
      },
      child: CircleAvatar(
        radius: 35,
        backgroundColor: btncolor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            btntxt,
            style: TextStyle(
              fontSize: 30,
              color: txtcolor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Calculator',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Calculator Display
            _operationDisplay(),

            _displayTextOperation(),

            _firstRow(),

            const SizedBox(height: 10),

            _secondRow(),

            const SizedBox(height: 10),

            _thirdRow(),

            const SizedBox(height: 10),

            _fourthRow(),

            const SizedBox(height: 10),

            // Last Row
            _lastRow(),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Row _lastRow() {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  buttonPressed('0');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[900],
                ),
                child: const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10, right: 90),
                  child: Text(
                    '0',
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              calcbutton('.', Colors.grey.shade900, Colors.white),
              calcbutton('=', Colors.amber.shade800, Colors.white),
            ],
          );
  }

  Row _fourthRow() {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcbutton('1', Colors.grey.shade900, Colors.white),
              calcbutton('2', Colors.grey.shade900, Colors.white),
              calcbutton('3', Colors.grey.shade900, Colors.white),
              calcbutton('+', Colors.amber.shade800, Colors.white),
            ],
          );
  }

  Row _thirdRow() {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcbutton('4', Colors.grey.shade900, Colors.white),
              calcbutton('5', Colors.grey.shade900, Colors.white),
              calcbutton('6', Colors.grey.shade900, Colors.white),
              calcbutton('-', Colors.amber.shade800, Colors.white),
            ],
          );
  }

  Row _secondRow() {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcbutton('7', Colors.grey.shade900, Colors.white),
              calcbutton('8', Colors.grey.shade900, Colors.white),
              calcbutton('9', Colors.grey.shade900, Colors.white),
              calcbutton('x', Colors.amber.shade800, Colors.white),
            ],
          );
  }

  Row _firstRow() {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcbutton('AC', Colors.grey, Colors.black),
              calcbutton('+/-', Colors.grey, Colors.black),
              calcbutton('%', Colors.grey, Colors.black),
              calcbutton('/', Colors.amber.shade800, Colors.white),
            ],
          );
  }

  Row _displayTextOperation() {
    return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  displayText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 100,
                  ),
                ),
              ),
            ],
          );
  }

  Row _operationDisplay() {
    return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  operation,
                  style: const TextStyle(
                    color: Color.fromARGB(134, 255, 255, 255),
                    fontSize: 40,
                  ),
                ),
              ),
            ],
          );
  }
}
