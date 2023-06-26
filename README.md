# interpreter_design_pattern_flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 1. Research: Interpreter Design Pattern Flutter

- Keywords:
    - interpreter design pattern flutter
    - interpreter design pattern flutter example
- Video Title: Interpreter Design Pattern in Flutter | Behavioral Design Patterns in Flutter

## 2. Research: Competitors

**Flutter Videos/Articles**

- 74K: https://youtu.be/6CVymSJQuJE?list=PLfZqJwaRZ_4Ns7yoUbD3i-mbASju8mIjW
- https://medium.com/flutter-community/flutter-design-patterns-8-interpreter-8f15e9de3ee9
- https://scottt2.github.io/design-patterns-in-dart/interpreter/
- https://dev.to/blazebrain/design-patterns-flutter-9dh
- http://coursegalaxy.com/design-patterns/interpreter.html
- https://github.com/scottt2/design-patterns-in-dart

**Android/Swift/React Videos**

- 7.2K: https://youtu.be/MKsnfKV5WxM
- 7K: https://youtu.be/JNHXA7vLwB8
- 74K: https://youtu.be/6CVymSJQuJE?list=PLfZqJwaRZ_4Ns7yoUbD3i-mbASju8mIjW
- 2K: https://youtu.be/uRhBjFjf8n8
- 5.8K: https://youtu.be/AYx41EfscRE
- https://www.geeksforgeeks.org/interpreter-design-pattern
- https://www.tutorialspoint.com/design_pattern/interpreter_pattern.htm
- https://www.javatpoint.com/interpreter-pattern
- https://sourcemaking.com/design_patterns/interpreter
- https://dzone.com/articles/using-interpreter-design-pattern-in-java
- https://github.com/kingreza/Swift-Interpreter
- http://coursegalaxy.com/design-patterns/interpreter-swift.html
- https://subscription.packtpub.com/book/application-development/9781785887611/8/ch08lvl1sec38/the-interpreter-pattern

**Great Features**

- Interpreter design pattern provides a flexible and extensible approach for interpreting and
  evaluating sentences or expressions in a language.
- Other great features are following:
    - Encapsulation: encapsulates the grammar of the language in a way that makes it easy to
      understand and change.
    - Abstraction: allows for different implementations of the grammar
    - Extensibility: can be extended to support new grammars.
    - Reusability: can be used to reuse expressions. This can save time and effort when developing
      code.
    - Maintainability: makes it easier to maintain code, as the grammar is encapsulated in a
      separate class.

**Problems from Videos**

- NA

**Problems from Flutter Stackoverflow**

- https://stackoverflow.com/questions/34788396/error-handling-in-interpreter-pattern
- https://stackoverflow.com/questions/7693770/interpreter-pattern-example
- https://stackoverflow.com/questions/74817156/why-is-the-interpreter-design-pattern-not-applicable-when-efficiency-is-a-critic
- https://stackoverflow.com/questions/1020622/is-interpreter-an-anti-pattern

## 3. Video Structure

**Main Points / Purpose Of Lesson**

1. In this video lesson, you will learn how to use interpreter design pattern to provide a way to
   evaluate and interpret sentences or expressions in a language. It allows you to define a grammar
   or language rules using classes and objects, and provides a mechanism to interpret and execute
   these rules.
2. Main points:
    - **Grammar Representation**: provides a way to represent the grammar or language rules in an
      object-oriented manner.
    - **Interpretation of Expressions**: allows you to interpret and execute the language rules or
      expressions.
    - **Separation of Syntax and Semantics**: The Interpreter pattern separates the language
      syntax (grammar) from the interpretation logic (semantics).
3. Main purpose of the Interpreter design pattern is to provide a framework for interpreting and
   executing sentences or expressions in a language. It promotes separation of syntax and semantics,
   extensibility, modifiability, and dynamic interpretation.

**The Structured Main Content**

# Interpreter Design Pattern

## Definition

The Interpreter is a behavioural design pattern.

Given a language, define a representation for its grammar along with an interpreter that uses the
representation to interpret sentences in the language.

The main idea behind this is that a language is a set of valid sentences. Each of those sentences
can be constructed by following a set of grammar rules defining the language. Sometimes the program
which needs to interpret those sentences process a lot of repeated occurrences of similar requests
that are a combination of a set of grammar rules, but all of these requests are composed using the
same grammar rules. For instance, arithmetic expressions could be different and provide different
results (addition, subtraction, multiplication, division), but all of them are constructed of the
same basic rules defining the language of arithmetic expressions.

## Analysis

**AbstractExpression** — declares an abstract interpret() operation that is common to all nodes in
the
abstract syntax tree.
**TerminalExpression** — implement an interpret() operation associated with terminal symbols in the
grammar.
**NonterminalExpression** — implement an interpret() operation for nonterminal symbols in the
grammar.

This operation typically calls itself recursively on the variables representing other expressions (
grammar rules).
**Context** — contains the global information of the interpreter which is shared among the
expression instances.
**Client** — builds an abstract syntax tree representing a particular sentence in the language that
the grammar defines and invokes the interpret() operation.

**Composite vs Interpreter**
The Interpreter itself uses the Composite design pattern to build and represent a sentence in a
simple language as a tree. But that’s all — the Composite pattern is only used to define the static
properties of the system, to define the structure (it is a structural design pattern), but the
Interpreter represents the language itself, defines the behaviour, has some additional logic to
interpret each entity in the tree, shares the same context between them

## Implementation

1. In `main.dart` file, define `Number` class with its default constructor with a integer value.

```dart
class Number {
  int value;

  Number(this.value) {
    print("Starting with $value...");
  }
}
```

2. Create abstract class `Expression` with initializing Number class and making new
   method `interpret()`.

```dart
abstract interface class Expression {
  late Number number;

  void interpret(int value);
}
```

3. Create `Add` and `Subtract` classes which are implementing `Expression` class. So, these classes
   override Number class and interpret method.
    - Add class Adds new value in the value of number class.
    - Subtract class subtracts new value from the value of number class.

```dart
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
```

4. In `main()` function, declare number, adder, and subtracter objects from Number, Add, and
   Subtract classes respectively.
    - adder.interpret(100) will add 100 in the number which is initially 0. It will become 100.
    - subtracter.interpret(60) will subtract 60 from the number which is 100 now. It will become 40.
    - adder.interpret(2) will add 2 in the number which is 40 now. It will become 42.
    - In the end, print that number.

```dart
void main() {
  final number = Number(0);
  final adder = Add(number);
  final subtracter = Subtract(number);

  adder.interpret(100);
  subtracter.interpret(60);
  adder.interpret(2);

  assert(number.value == 42);
  print("And the result is ${number.value}!");
}
```

There's nothing in the interpreter pattern that says it has to be another programming language's
syntax that you're interpreting. If you need to parse a simple mathematical expression, then
interpreter is just the thing.

It is a good choice for applications that need to be able to parse and interpret languages, or
evaluate rules.