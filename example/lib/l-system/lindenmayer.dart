import 'package:flutter/material.dart';
import 'package:flutter_turtle/flutter_turtle.dart';
import 'dart:math' as math;

class Rule {
  String a;
  String b;

  Rule(
    String a,
    String b,
  ) {
    this.a = a;
    this.b = b;
  }
}

class LSystem {
  String sentence;
  List<Rule> ruleSet;
  List<TurtleCommand> turtleCommands = [];
  int generation;

  LSystem(
    String axiom,
    List<Rule> ruleSet,
  ) {
    this.sentence = axiom;
    this.ruleSet = ruleSet;

    turtleCommands.add(
      PenDown(),
    );
    turtleCommands.add(
      SetColor(
        (_) => Colors.lightGreen,
      ),
    );
    turtleCommands.add(
      SetStrokeWidth(
        (_) => 2,
      ),
    );
    //parseSierpinskiTriangle();
    //parseToCommands();
    //parseToKochCurve();

    generation = 0;
  }

  void resetTurtle() {
    turtleCommands.clear();
    turtleCommands.add(
      PenDown(),
    );
    turtleCommands.add(
      SetColor(
        (_) => Colors.green,
      ),
    );
    turtleCommands.add(
      SetStrokeWidth(
        (_) => 2,
      ),
    );
  }

  void generate(int iterations) {
    while (iterations != 0) {
      StringBuffer nextGeneration = StringBuffer();

      for (int i = 0; i < sentence.length; i++) {
        String current = sentence[i];
        String replace = "" + current;
        for (int j = 0; j < ruleSet.length; j++) {
          String a = ruleSet.elementAt(j).a;
          if (a == current) {
            replace = ruleSet.elementAt(j).b;
            break;
          }
        }
        nextGeneration.write(replace);
      }
      sentence = nextGeneration.toString();
      iterations--;
      generation++;
    }
    parseFractalPlant();
    //parseDragonCurve();
    //parseToCommands();
    //parseToKochCurve();
    //parseToCommands();
    //parseSierpinskiTriangle();
  }

  void parseToCommands() {
    for (int i = 0; i < sentence.length; i++) {
      String character = sentence[i];
      if (character == 'F') turtleCommands.add(Forward((_) => 10.0));
      if (character == 'G') turtleCommands.add(Forward((_) => 10.0));
      if (character == '-') turtleCommands.add(Right((_) => 25.0));
      if (character == '+') turtleCommands.add(Left((_) => 25.0));
      if (character == '[') turtleCommands.add(SaveState());
      if (character == ']') turtleCommands.add(PopState());
    }
  }

  void parseFractalPlant() {
    for (int i = 0; i < sentence.length; i++) {
      String character = sentence[i];
      if (character == 'F') turtleCommands.add(Forward((_) => 1));
      if (character == '-') turtleCommands.add(Left((_) => 35.0));
      if (character == '+') turtleCommands.add(Right((_) => 25.0));
      if (character == '[') turtleCommands.add(SaveState());
      if (character == ']') turtleCommands.add(PopState());
    }
  }

  void parseDragonCurve() {
    for (int i = 0; i < sentence.length; i++) {
      String character = sentence[i];
      if (character == 'F') turtleCommands.add(Forward((_) => 2.0));
      if (character == '-') turtleCommands.add(Left((_) => 90.0));
      if (character == '+') turtleCommands.add(Right((_) => 90.0));
    }
  }

  void parseSierpinskiTriangle() {
    for (int i = 0; i < sentence.length; i++) {
      String character = sentence[i];
      if (character == 'F') turtleCommands.add(Forward((_) => 10.0));
      if (character == 'G') turtleCommands.add(Forward((_) => 10.0));
      if (character == '-') turtleCommands.add(Right((_) => 120.0));
      if (character == '+') turtleCommands.add(Left((_) => 120.0));
    }
  }

  void parseToKochCurve() {
    for (int i = 0; i < sentence.length; i++) {
      String character = sentence[i];
      if (character == 'F') turtleCommands.add(Forward((_) => 15.0));
      if (character == '+') turtleCommands.add(Left((_) => 60.0));
      if (character == '-') turtleCommands.add(Right((_) => 60.0));
    }
  }
}
