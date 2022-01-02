import 'dart:ui';

import 'package:meta/meta.dart';

import '../turtle_commands.dart';
import '../turtle_state.dart';

/// Moves the turtle to center.
@immutable
class ResetPosition implements TurtleCommand {
  @override
  List<Instruction> createInstruction(TurtleState turtle, Map argv) {
    turtle.position = const Offset(0.0, 0.0);
    return [];
  }
}
