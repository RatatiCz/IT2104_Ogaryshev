import 'package:flutter/material.dart';
import '../classes/CoffeeMachine.dart';
import '../classes/ICoffee.dart';
import '../classes/Coffee.dart';
import '../Enums.dart';

class CoffeePage extends StatefulWidget {
  final CoffeeMachine coffeeMachine;

  CoffeePage(this.coffeeMachine);

  @override
  _CoffeePageState createState() => _CoffeePageState();
}

class _CoffeePageState extends State<CoffeePage> {
  String _message = '';
  TextEditingController _moneyController = TextEditingController();

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  void _addMoney(int money) {
    setState(() {
      widget.coffeeMachine.addResources(0, 0, 0, money);
    });
    _showSnackbar('Добавлено $money денег');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFF8DC),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildResourceItem('Кофейные зерна', widget.coffeeMachine.getResources().coffeeBeans),
                  _buildResourceItem('Молоко', widget.coffeeMachine.getResources().milk),
                  _buildResourceItem('Вода', widget.coffeeMachine.getResources().water),
                  _buildResourceItem('Деньги', widget.coffeeMachine.getResources().cash),
                ],
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 365,
                  child: ElevatedButton(
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
                                    widget.coffeeMachine.makeCoffeeByType(coffee);
                                    setState(() {});
                                    _showSnackbar('Ваш эспрессо готов!');
                                  } catch (e) {
                                    _showSnackbar(e.toString());
                                  }
                                  Navigator.pop(context);
                                },
                                child: Text('Эспрессо', style: TextStyle(fontSize: 20, color: Colors.white)),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.brown,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  try {
                                    ICoffee coffee = getCoffeeByType(CoffeeType.Cappuccino);
                                    widget.coffeeMachine.makeCoffeeByType(coffee);
                                    setState(() {});
                                    _showSnackbar('Ваш капучино готов!');
                                  } catch (e) {
                                    _showSnackbar(e.toString());
                                  }
                                  Navigator.pop(context);
                                },
                                child: Text('Капучино', style: TextStyle(fontSize: 20, color: Colors.white)),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.brown,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  try {
                                    ICoffee coffee = getCoffeeByType(CoffeeType.Latte);
                                    widget.coffeeMachine.makeCoffeeByType(coffee);
                                    setState(() {});
                                    _showSnackbar('Ваш латте готов!');
                                  } catch (e) {
                                    _showSnackbar(e.toString());
                                  }
                                  Navigator.pop(context);
                                },
                                child: Text('Латте', style: TextStyle(fontSize: 20, color: Colors.white)),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.brown,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Text('Приготовить кофе', style: TextStyle(fontSize: 25, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        minimumSize: Size(365, 65)
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 175,
                  child: TextField(
                    controller: _moneyController,
                    decoration: InputDecoration(
                      hintText: 'Введите сумму',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_moneyController.text.isNotEmpty) {
                      int? money = int.tryParse(_moneyController.text);
                      if (money != null) {
                        _addMoney(money);
                        _moneyController.clear();
                      } else {
                        _showSnackbar('Введите корректную сумму');
                      }
                    } else {
                      _showSnackbar('Введите сумму денег');
                    }
                  },
                  child: Text('Добавить деньги', style: TextStyle(fontSize: 16, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(175, 65),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResourceItem(String label, int value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 20),
        ),
        Text(
          value.toString(),
          style: TextStyle(fontSize: 20),
        ),
      ],
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
