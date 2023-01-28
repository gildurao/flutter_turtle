import 'package:meta/meta.dart';

import '../turtle_commands.dart';
import '../turtle_state.dart';

const repcount = 'repcount';

/// Asks the turtle to run a series of commands repeatedly.
///
/// Please note that the command contained could get how many times the
/// loop has been repeated by the variable `repcount`.
@immutable
class Repeat implements TurtleCommand {
  /// How many times to repeat.
  final int Function(Map) times;

  /// The commands to run.
  final List<TurtleCommand> commands;

  /// Creates a new instance.
  Repeat(this.times, this.commands);

  @override
  List<Instruction> createInstruction(TurtleState turtle, Map argv) {
    if (commands.isEmpty) return [];

    var instructions = <Instruction>[];
    for (var i = 0; i < times(Map.from(argv)); i++) {
      var copy = Map.from(argv);
      copy[repcount] = i + 1;
      var list = List<Instruction>.of(commands
          .map((command) => command.createInstruction(turtle, copy))
          .expand((x) => x));
      instructions.addAll(list);
    }
    return instructions;
  }
}
