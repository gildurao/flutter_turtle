import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_turtle_example/l-system/examples.dart';

import 'package:flutter_turtle/flutter_turtle.dart';
import 'package:flutter_midi/flutter_midi.dart';

class LSystemPage extends StatefulWidget {
  const LSystemPage({Key key}) : super(key: key);

  @override
  _LSystemPageState createState() => _LSystemPageState();
}

class _LSystemPageState extends State<LSystemPage> {
  final _flutterMidi = FlutterMidi();

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() async {
    _flutterMidi.prepare(
      sf2: await rootBundle.load(
        "assets/Piano.sf2",
      ),
      name: "Piano.sf2",
    );
    _flutterMidi.unmute();
  }

  @override
  Widget build(BuildContext context) {
    fractalPlant3.generate(9);
    return Scaffold(
      body: InteractiveViewer(
        child: Column(
          children: [
            Expanded(
              child: AnimatedTurtleView(
                animationDuration: Duration(seconds: 5),
                child: Container(
                  width: double.infinity,
                  height: 600,
                ),
                commands: fractalPlant3.turtleCommands,
              ),
            ),
            FlatButton(
              onPressed: () {
                for (int note in fractalPlant3.midiNotes) {
                  Future.delayed(
                    Duration(
                      seconds: 1,
                    ),
                  ).then((value) => _flutterMidi.playMidiNote(
                        midi: note,
                      ));
                }
              },
              child: Text(
                'Play Notes',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
