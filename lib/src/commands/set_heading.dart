import 'dart:ui';

import 'package:meta/meta.dart';

import '../turtle_commands.dart';
import '../turtle_state.dart';
import '_instructions.dart';

/// Sets a new color for drawing lines and texts.
@immutable
class SetHeading implements TurtleCommand {
  /// The new color.
  final double degrees;

  /// Creates a new instance.
  SetHeading(this.degrees);

  @override
  List<Instruction> createInstruction(TurtleState turtle, Map argv) {
    turtle.degrees = this.degrees;
    return [];
  }
}
