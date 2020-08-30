import 'package:flutter/material.dart';
import 'package:flutter_turtle/flutter_turtle.dart';
import 'dart:math' as math;
import 'dart:core';

const cScale = [
  60, // C
  62, // D
  64, // E
  65, // F
  67, // G
  69, // A
  71, // B
  72, // C
  74, // D
  76, // E
  77, // F
  79, // G
  81, // A
  83, // B
  84, // C
  86, // D
  88, // E
  89, // F
  91, // G
  93, // A
  95, // B
  96, // C
];

enum Durations {
  Whole,
  Half,
  Quarter,
  Eigth,
  Sixteenth,
  DottedQuarter,
  DottedHalf,
}

const Map<Durations, int> durationValues = {
  Durations.Whole: 2000,
  Durations.Half: 1000,
  Durations.Quarter: 500,
  Durations.Eigth: 250,
  Durations.Sixteenth: 125,
  Durations.DottedQuarter: 750,
  Durations.DottedHalf: 1500,
};

class Note {
  final int midiPitch;
  final int duration;

  const Note({
    this.duration,
    this.midiPitch,
  });
}

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
  List<Note> midiNotes = [];
  Note currentNote = Note(
    duration: durationValues[Durations.Quarter],
    midiPitch: 60,
  );
  Note lastNote = Note(
    duration: durationValues[Durations.Whole] * 4,
    midiPitch: 96,
  );
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
    //parseFractalPlant3();
    //parseFractalCarpet();
    //parsePeanoCurve();
    //parseFractalPlant();
    parseDragonCurve();
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

  void parseFractalPlant3() {
    for (int i = 0; i < sentence.length; i++) {
      String character = sentence[i];
      if (character == 'F') {
        turtleCommands.add(Forward((_) => 20.0));
        //midiNotes.add(currentNote);
      }
      if (character == '-') {
        turtleCommands.add(Right((_) => 18));
        //currentNote = cScale.elementAt(math.Random().nextInt(cScale.length));
        //midiNotes.add(currentNote);
      }
      if (character == '+') {
        turtleCommands.add(Left((_) => 18));
        //currentNote = cScale.elementAt(math.Random().nextInt(cScale.length));
        //midiNotes.add(currentNote);
      }
      if (character == '[') {
        turtleCommands.add(SaveState());
      }
      if (character == ']') {
        turtleCommands.add(PopState());
      }
    }
  }

  void parseFractalPlant2() {
    for (int i = 0; i < sentence.length; i++) {
      String character = sentence[i];
      if (character == 'F') turtleCommands.add(Forward((_) => 3.0));
      if (character == '-') turtleCommands.add(Right((_) => 25.7));
      if (character == '+') turtleCommands.add(Left((_) => 25.7));
      if (character == '[') turtleCommands.add(SaveState());
      if (character == ']') turtleCommands.add(PopState());
    }
  }

  void parseFractalCarpet() {
    for (int i = 0; i < sentence.length; i++) {
      String character = sentence[i];
      if (character == 'F') turtleCommands.add(Forward((_) => 2));
      if (character == '+') turtleCommands.add(Right((_) => 90.0));
    }
  }

  void parsePeanoCurve() {
    for (int i = 0; i < sentence.length; i++) {
      String character = sentence[i];
      if (character == 'F') turtleCommands.add(Forward((_) => 10));
      if (character == '-') turtleCommands.add(Left((_) => 90.0));
      if (character == '+') turtleCommands.add(Right((_) => 90.0));
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
      if (character == 'F') {
        turtleCommands.add(Forward((_) => 5.0));
        midiNotes.add(currentNote);
      }
      if (character == '-') {
        turtleCommands.add(Left((_) => 90.0));

        currentNote = chooseNote();
      }
      if (character == '+') {
        turtleCommands.add(Right((_) => 90.0));
        currentNote = chooseNote();
      }
    }
    midiNotes.add(
      lastNote,
    );
    midiNotes.add(
      Note(
        duration: durationValues[Durations.Whole] * 4,
        midiPitch: 48,
      ),
    );
  }

  Note chooseNote() {
    final random = new math.Random();
    int newNote = cScale.elementAt(random.nextInt(cScale.length));
    final pitchDiff = (newNote - currentNote.midiPitch).abs();
    final intervalLargerThanOctave = pitchDiff >= 12;
    final pitchIsEqual = pitchDiff == 0;
    while (intervalLargerThanOctave || pitchIsEqual) {
      newNote = cScale.elementAt(random.nextInt(cScale.length));
    }
    final keys = durationValues.keys.toList();
    Durations newKey = keys.elementAt(random.nextInt(keys.length));

    while (durationValues[newKey] == currentNote.duration) {
      newKey = keys.elementAt(random.nextInt(keys.length));
    }

    return Note(
      duration: durationValues[newKey],
      midiPitch: newNote,
    );
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
