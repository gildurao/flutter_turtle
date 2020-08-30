import 'package:flutter_turtle_example/l-system/lindenmayer.dart';

LSystem fractalPlant3 = LSystem(
  'SLFFF',
  [
    Rule(
      'S',
      '[+++G][---G]TS',
    ),
    Rule(
      'G',
      '+H[-G]L',
    ),
    Rule(
      'H',
      '-G[+H]L',
    ),
    Rule(
      'T',
      'TL',
    ),
    Rule(
      'L',
      '[-FFF][+FFF]F',
    ),
  ],
);
LSystem fractalPlant2 = LSystem(
  'G',
  [
    Rule(
      'G',
      'GFX[+G][-G]',
    ),
    Rule(
      'X',
      'X[-FFF][+FFF]FX',
    ),
  ],
);
LSystem fractalCarpet = LSystem(
  'F+F+F+F',
  [
    Rule(
      'F',
      'FF+F+F+F+FF',
    ),
  ],
);
LSystem peanoCurve = LSystem(
  'X',
  [
    Rule(
      'X',
      'XFYFX+F+YFXFY-F-XFYFX',
    ),
    Rule(
      'Y',
      'YFXFY-F-XFYFX+F+YFXFY',
    ),
  ],
);
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
