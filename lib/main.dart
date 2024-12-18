import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TipCalculatorScreen(),
    );
  }
}

class TipCalculatorScreen extends StatefulWidget {
  const TipCalculatorScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TipCalculatorScreenState createState() => _TipCalculatorScreenState();
}

class _TipCalculatorScreenState extends State<TipCalculatorScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController tipController = TextEditingController();
  double tipAmount = 0.0;
  double totalAmount = 0.0;

  void calculateTip() {
    double amount = double.tryParse(amountController.text) ?? 0.0;
    double tipPercentage = double.tryParse(tipController.text) ?? 0.0;

   setState(() {
   tipAmount = amount * (tipPercentage / 100);
   totalAmount = amount + tipAmount;
  });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip Calculator'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 200),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Amount..',
                  border: OutlineInputBorder(),
                  hintText: 'e.g. 100.00',
                ),
              ),
              SizedBox(height: 40),
              TextField(
                controller: tipController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Tip Percentage..',
                  border: OutlineInputBorder(),
                  hintText: 'e.g. 15',
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: calculateTip,
                style:ElevatedButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
                child: Text('CALCULATE'),
              ),
              SizedBox(height: 30),
              Text(
                'Tip: \$${tipAmount.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Total Amount: \$${totalAmount.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}