class CoffeeMachine {
  int _coffeeBeans;
  int _milk;
  int _water;
  int _cash;

  CoffeeMachine(this._coffeeBeans, this._milk, this._water, this._cash);

  int get coffeeBeans => _coffeeBeans;
  int get milk => _milk;
  int get water => _water;
  int get cash => _cash;

  set coffeeBeans(int value) => _coffeeBeans = value;
  set milk(int value) => _milk = value;
  set water(int value) => _water = value;
  set cash(int value) => _cash = value;

  bool isAvailable() {
    return _coffeeBeans >= 50 && _water >= 100 && _milk >= 50;
  }

  void subtractResources() {
    _coffeeBeans -= 50;
    _water -= 100;
    _milk -= 50;
  }

  String makingCoffee() {
    if (!isAvailable()) {
      return "Недостаточно ресурсов для приготовления кофе.";
    }
    subtractResources();
    _cash += 50; // Предположим, что цена за кофе - 50 денежных единиц.
    return "Ваш кофе готов!";
  }

  void addResource(String type, int amount) {
    switch (type) {
      case 'coffee':
        _coffeeBeans += amount;
        break;
      case 'milk':
        _milk += amount;
        break;
      case 'water':
        _water += amount;
        break;
    }
  }
}