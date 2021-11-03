import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MoneyConversion()));
}

class MoneyConversion extends StatefulWidget {
  @override
  _MoneyConversionState? createState() => State <MoneyConversionState>();
}

class _MoneyConversionState extends State<MoneyConversion> {
  late String selectCurrency;

  //create a text controller
  TextEditingController textController = TextEditingController();

  // List of currencies
  var currencies = [
    'Dollar',
    'Renmimbi',
    'Ruble',
    'Yen',
    'Euro',
    'Real',
    'Rupees',
    'Pesos',
    'Canadian Dollar'
  ];

  var factordollar = [1,6.40,71.5,114.13,0.86,5.68,74.86,20.84,1.24];
  var factorrenminbi = [0.16,1,11.19,17.84,0.13,0.89,11.70,3.26,0.19];

  //current selected item
  late String selectItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Money Conversion')),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                autofocus: true,
                controller: textController,
                onSubmitted: (a) {
                  setState(() {
                    selectCurrency = textController.text;
                  });
                },
              ),
              DropdownButton<String>(
                items: currencies.map((String item) {
                return DropdownMenuItem(value: item, child: Text(item));
              }) .toList(),
              onChanged: (String userselectItem){
                setState(() {
                  selectItem = userselectItem;
                  });
                },
                value: selectItem,
              ),
              Text('Currency From: $selectCurrency and Currency to $selectItem'),
              if (selectItem.toUpperCase() == 'DOLLAR')
                print('It is dollar');
            ],
          ),
        ));
  }
}
