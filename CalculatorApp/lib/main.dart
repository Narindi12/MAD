import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CalculatorApp',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String _displayText = '0';
  double _firstOperand = 0;
  double _secondOperand = 0;
  String _operator = '';
  bool _isDecimalInput = false;
  int _decimalCount = 0;

  // Function to update the display
  void _updateDisplay(String value) {
    setState(() {
      if (_displayText == '0' && value != '.') {
        _displayText = value;
      } else if (value == '.' && !_isDecimalInput) {
        _isDecimalInput = true;
        _decimalCount = 0;
        _displayText += value;
      } else if (value != '.') {
        if (_isDecimalInput) {
          if (_decimalCount < 2) { // Restrict to 2 decimal places
            _decimalCount++;
            _displayText += value;
          }
        } else {
          _displayText += value;
        }
      }
    });
  }

  // Function to handle arithmetic operations
  void _setOperator(String op) {
    setState(() {
      _firstOperand = double.parse(_displayText);
      _operator = op;
      _displayText = '0';
      _isDecimalInput = false;
      _decimalCount = 0;
    });
  }

  // Function to calculate the result
  void _calculateResult() {
    setState(() {
      _secondOperand = double.parse(_displayText);
      double result;
      switch (_operator) {
        case '+':
          result = _firstOperand + _secondOperand;
          break;
        case '-':
          result = _firstOperand - _secondOperand;
          break;
        case '*':
          result = _firstOperand * _secondOperand;
          break;
        case '/':
          if (_secondOperand != 0) {
            result = _firstOperand / _secondOperand;
          } else {
            // Handle division by zero
            _displayText = 'Error';
            _operator = '';
            _isDecimalInput = false;
            _decimalCount = 0;
            return;
          }
          break;
        default:
          result = 0;
      }
      _displayText = result.toStringAsFixed(2);
      // Remove trailing zeros and decimal point if not needed
      if (_displayText.endsWith('.00')) {
        _displayText = result.toInt().toString();
      } else if (_displayText.endsWith('0')) {
        _displayText = result.toStringAsFixed(1);
      }
      _operator = '';
      _isDecimalInput = false;
      _decimalCount = 0;
    });
  }

  // Function to clear the display
  void _clearDisplay() {
    setState(() {
      _displayText = '0';
      _firstOperand = 0;
      _secondOperand = 0;
      _operator = '';
      _isDecimalInput = false;
      _decimalCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CalculatorApp'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Display area
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Text(
              _displayText,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          // Button rows
          Column(
            children: [
              _buildButtonRow(['7', '8', '9', '/']),
              _buildButtonRow(['4', '5', '6', '*']),
              _buildButtonRow(['1', '2', '3', '-']),
              _buildButtonRow(['0', '.', 'C', '+']),
              _buildButtonRow(['=']),
            ],
          ),
        ],
      ),
    );
  }

  // Widget to build a row of buttons
  Widget _buildButtonRow(List<String> buttons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttons.map<Widget>((String buttonText) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20),
                backgroundColor: _getButtonColor(buttonText),
                foregroundColor: Colors.white, // Replaced 'primary' with 'foregroundColor'
                textStyle: TextStyle(fontSize: 24),
              ),
              onPressed: () {
                if (buttonText == 'C') {
                  _clearDisplay();
                } else if (buttonText == '=') {
                  _calculateResult();
                } else if (['+', '-', '*', '/'].contains(buttonText)) {
                  _setOperator(buttonText);
                } else {
                  _updateDisplay(buttonText);
                }
              },
              child: Text(buttonText),
            ),
          ),
        );
      }).toList(),
    );
  }

  // Helper function to set different colors for operators and other buttons
  Color _getButtonColor(String buttonText) {
    if (buttonText == '=') {
      return Colors.orange;
    } else if (['+', '-', '*', '/'].contains(buttonText)) {
      return Colors.blue;
    } else if (buttonText == 'C') {
      return Colors.red;
    } else {
      return Colors.grey.shade800;
    }
  }
}
