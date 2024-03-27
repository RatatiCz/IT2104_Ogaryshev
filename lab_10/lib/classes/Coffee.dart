import 'Resources.dart';
import 'ICoffee.dart';

class Espresso implements ICoffee {
  @override
  Resources getResources() {
    return Resources(50, 0, 100, 2); // Цена за эспрессо: 2
  }
}

class Cappuccino implements ICoffee {
  @override
  Resources getResources() {
    return Resources(50, 50, 100, 3); // Цена за капучино: 3
  }
}

class Latte implements ICoffee {
  @override
  Resources getResources() {
    return Resources(50, 100, 100, 4); // Цена за латте: 4
  }
}