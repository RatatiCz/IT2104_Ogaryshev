import 'Resources.dart';
import 'ICoffee.dart';

class CoffeeMachine {
  Resources _resources;

  CoffeeMachine(this._resources);

  Resources getResources() {
    return _resources;
  }

  void fillResources(int coffeeBeans, int milk, int water, int cash) {
    _resources.setResources(coffeeBeans, milk, water, cash);
  }

  void addResources(int coffeeBeans, int milk, int water, int cash) {
    _resources.getResource(coffeeBeans, milk, water, cash);
  }

  Resources makeCoffeeByType(ICoffee coffee) {
    Resources requiredResources = coffee.getResources();
    if (isAvailableResources(requiredResources)) {
      _resources.coffeeBeans -= requiredResources.coffeeBeans;
      _resources.milk -= requiredResources.milk;
      _resources.water -= requiredResources.water;
      _resources.cash -= requiredResources.cash;
      return requiredResources;
    } else {
      throw Exception('Недостаточно ресурсов для приготовления кофе');
    }
  }

  bool isAvailableResources(Resources requiredResources) {
    return _resources.coffeeBeans >= requiredResources.coffeeBeans &&
        _resources.milk >= requiredResources.milk &&
        _resources.water >= requiredResources.water;
  }

  Resources makeCoffee() {
    if (_resources.coffeeBeans >= 50 && _resources.water >= 100) {
      _resources.coffeeBeans -= 50;
      _resources.water -= 100;
      return Resources(50, 0, 100, 2);
    } else {
      throw Exception('Недостаточно ресурсов для приготовления кофе');
    }
  }
}