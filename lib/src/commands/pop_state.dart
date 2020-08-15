import 'package:meta/meta.dart';

import '../turtle_commands.dart';
import '../turtle_state.dart';

/// Puts the turtle back into a recorded position
@immutable
class PopState implements TurtleCommand {
  @override
  List<Instruction> createInstruction(TurtleState turtle, Map argv) {
    if (turtle.turtleStack.isNotEmpty) {
      TurtleData lastState = turtle.turtleStack.removeLast();
      turtle.position = lastState.position;
      turtle.degrees = lastState.degrees;
    }
    return [];
  }
}
