import 'dart:async';

class CoffeeMachine {
  Future<void> _delay(int seconds) async {
    await Future.delayed(Duration(seconds: seconds));
  }

  Future<void> _heatWater() async {
    print('start_process: water');
    await _delay(3);
    print('done_process: water');
  }

  Future<void> _brewCoffee(bool withMilk) async {
    if (withMilk) {
      await _heatWater();
      print('_then_');
      print('start_process: espresso');
      await _delay(5);
      print('done_process: coffee with milk');
      print('_end_');
    } else {
      await _heatWater();
      print('_then_');
      print('start_process: espresso');
      await _delay(5);
      print('done_process: coffee with water');
      print('_end_');
    }
  }

  Future<void> _frothMilk() async {
    print('start_process: milk');
    await _delay(5);
    print('done_process: milk');
  }

  Future<void> _mixCoffeeAndMilk() async {
    print('start_process: mixing coffee with milk');
    await _delay(3);
    print('done_process: coffee with milk');
  }

  CoffeeMachine(bool withMilk) {
    print('_start_');
    if (withMilk) {
      _brewCoffee(true);
      _frothMilk();
      _mixCoffeeAndMilk();
    } else {
      _brewCoffee(false);
    }
  }
}

void main() {
  CoffeeMachine(false); // Приготовление кофе без молока
  CoffeeMachine(true); // Приготовление кофе с молоком
}