class Resources {
  int coffeeBeans;
  int milk;
  int water;
  int cash;

  Resources(this.coffeeBeans, this.milk, this.water, this.cash);

  void setResources(int coffeeBeans, int milk, int water, int cash) {
    this.coffeeBeans = coffeeBeans;
    this.milk = milk;
    this.water = water;
    this.cash = cash;
  }

  void getResource(int coffeeBeans, int milk, int water, int cash) {
    this.coffeeBeans += coffeeBeans;
    this.milk += milk;
    this.water += water;
    this.cash += cash;
  }
}
