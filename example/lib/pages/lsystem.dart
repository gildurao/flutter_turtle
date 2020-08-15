import 'package:flutter/material.dart';
import 'package:flutter_turtle_example/l-system/lindenmayer.dart';

import 'package:flutter_turtle/flutter_turtle.dart';

class LSystemPage extends StatefulWidget {
  const LSystemPage({Key key}) : super(key: key);

  @override
  _LSystemPageState createState() => _LSystemPageState();
}

class _LSystemPageState extends State<LSystemPage> {
  LSystem fractalPlant = LSystem(
    'X',
    [
      Rule(
        'X',
        'F+[[X]-X]-F[-FX]+X',
      ),
      Rule(
        'F',
        'FF',
      ),
    ],
  );
  LSystem dragon = LSystem(
    'FX',
    [
      Rule(
        'X',
        'X+YF+',
      ),
      Rule(
        'Y',
        '-FX-Y',
      ),
    ],
  );
  LSystem kochIsland = LSystem(
    'F+F+F+F',
    [
      Rule(
        'F',
        'F+F-F-FF+F+F-F',
      ),
    ],
  );
  LSystem bush = LSystem(
    '++++F',
    [
      Rule(
        'F',
        'FF-[-F+F+F]+[+F-F-F]',
      ),
    ],
  );
  LSystem kochCurve = LSystem(
    'F',
    [
      Rule(
        'F',
        'F+F--F+F',
      ),
    ],
  );
  LSystem fern = LSystem(
    'F',
    [
      Rule(
        'F',
        'F[-F]F[+F][F]',
      ),
    ],
  );
  LSystem sierpinskiTriangle = LSystem(
    'F-G-G',
    [
      Rule(
        'F',
        'F-G+F+G-F',
      ),
      Rule(
        'G',
        'GG',
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    fractalPlant.generate(8);
    return Scaffold(
      body: InteractiveViewer(
        child: Column(
          children: [
            SizedBox(
              height: 500,
            ),
            Expanded(
              child: AnimatedTurtleView(
                animationDuration: Duration(seconds: 5),
                child: Container(
                  width: double.infinity,
                  height: 600,
                ),
                commands: fractalPlant.turtleCommands,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
