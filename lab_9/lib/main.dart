import 'package:flutter/material.dart';
import 'classes/CoffeeMachine.dart';

void main() {
  CoffeeMachine coffeeMachine = CoffeeMachine(1000, 1000, 1000, 0);

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Кофемашина')),
      body: CoffeeMachineApp(coffeeMachine),
    ),
  ));
}

class CoffeeMachineApp extends StatefulWidget {
  final CoffeeMachine coffeeMachine;

  CoffeeMachineApp(this.coffeeMachine);

  @override
  _CoffeeMachineAppState createState() => _CoffeeMachineAppState();
}

class _CoffeeMachineAppState extends State<CoffeeMachineApp> {
  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text('Добавить ресурс'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          widget.coffeeMachine.addResource('coffee', 100);
                          Navigator.pop(context);
                        },
                        child: Text('Добавить кофейные зерна (+100)'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          widget.coffeeMachine.addResource('milk', 100);
                          Navigator.pop(context);
                        },
                        child: Text('Добавить молоко (+100 мл)'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          widget.coffeeMachine.addResource('water', 100);
                          Navigator.pop(context);
                        },
                        child: Text('Добавить воду (+100 мл)'),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: Text('Добавить ресурс'),
          ),
          ElevatedButton(
            onPressed: () {
              _message = widget.coffeeMachine.makingCoffee();
              setState(() {});
            },
            child: Text('Приготовить кофе'),
          ),
          Text(_message),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Выход'),
          ),
        ],
      ),
    );
  }
}
