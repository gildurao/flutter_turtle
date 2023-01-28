import 'package:meta/meta.dart';

import '../turtle_commands.dart';
import '../turtle_state.dart';

/// Represents if..else flow control.
@immutable
class IfElse implements TurtleCommand {
  /// The condition.
  final bool Function(Map) condition;

  /// The commands to run when the [condition] is true.
  final List<TurtleCommand> truePath;

  /// The commands to run when the [condition] is false.
  final List<TurtleCommand> falsePath;

  /// Creates a new instance.
  IfElse(this.condition, this.truePath, this.falsePath);

  @override
  List<Instruction> createInstruction(TurtleState turtle, Map argv) {
    final copy = Map.of(argv);
    final commands = (condition(copy) ? truePath : falsePath);
    return List<Instruction>.of(commands
        .map((command) => command.createInstruction(turtle, copy))
        .expand((x) => x));
  }
}
