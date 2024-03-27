import 'package:flutter/material.dart';
import 'classes/CoffeeMachine.dart';
import 'Enums.dart';
import 'classes/Resources.dart';
import 'classes/ICoffee.dart';
import 'classes/Coffee.dart';

void main() {
  CoffeeMachine coffeeMachine = CoffeeMachine(Resources(1000, 1000, 1000, 0));

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
                  title: Text('Выберите вид кофе'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          try {
                            ICoffee coffee = getCoffeeByType(CoffeeType.Espresso);
                            Resources resources = widget.coffeeMachine.makeCoffeeByType(coffee);
                            _message = 'Ваш эспрессо готов!';
                            setState(() {});
                          } catch (e) {
                            _message = e.toString();
                          }
                          Navigator.pop(context);
                        },
                        child: Text('Эспрессо'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          try {
                            ICoffee coffee = getCoffeeByType(CoffeeType.Cappuccino);
                            Resources resources = widget.coffeeMachine.makeCoffeeByType(coffee);
                            _message = 'Ваш капучино готов!';
                            setState(() {});
                          } catch (e) {
                            _message = e.toString();
                          }
                          Navigator.pop(context);
                        },
                        child: Text('Капучино'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          try {
                            ICoffee coffee = getCoffeeByType(CoffeeType.Latte);
                            Resources resources = widget.coffeeMachine.makeCoffeeByType(coffee);
                            _message = 'Ваш латте готов!';
                            setState(() {});
                          } catch (e) {
                            _message = e.toString();
                          }
                          Navigator.pop(context);
                        },
                        child: Text('Латте'),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: Text('Приготовить кофе'),
          ),
          Text(_message),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text('Добавить ресурсы'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          widget.coffeeMachine.addResources(100, 0, 0, 0); // Добавить 100 гр. кофейных зерен
                          Navigator.pop(context);
                        },
                        child: Text('Добавить кофейные зерна'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          widget.coffeeMachine.addResources(0, 100, 0, 0); // Добавить 100 мл молока
                          Navigator.pop(context);
                        },
                        child: Text('Добавить молоко'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          widget.coffeeMachine.addResources(0, 0, 100, 0); // Добавить 100 мл воды
                          Navigator.pop(context);
                        },
                        child: Text('Добавить воду'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          widget.coffeeMachine.addResources(0, 0, 0, 10); // Добавить 10 денег
                          Navigator.pop(context);
                        },
                        child: Text('Добавить деньги'),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: Text('Добавить ресурсы'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Выход из приложения
            },
            child: Text('Выход'),
          ),
        ],
      ),
    );
  }

  ICoffee getCoffeeByType(CoffeeType type) {
    switch (type) {
      case CoffeeType.Espresso:
        return Espresso();
      case CoffeeType.Cappuccino:
        return Cappuccino();
      case CoffeeType.Latte:
        return Latte();
      default:
        throw Exception('Неподдерживаемый тип кофе');
    }
  }
}