class Number {
  int value;

  Number(this.value) {
    print("Starting with $value...");
  }
}

abstract interface class Expression {
  late Number number;

  void interpret(int value);
}

class Add implements Expression {
  @override
  Number number;

  Add(this.number);

  @override
  void interpret(int value) {
    print("Adding $value...");
    number.value += value;
  }
}

class Subtract implements Expression {
  @override
  Number number;

  Subtract(this.number);

  @override
  void interpret(int value) {
    print("Subtracting $value...");
    number.value -= value;
  }
}

void main() {
  final number = Number(0);
  final adder = Add(number);
  final subtracter = Subtract(number);

  adder.interpret(100);
  subtracter.interpret(60);
  adder.interpret(2);

  print("And the result is ${number.value}!");
}
