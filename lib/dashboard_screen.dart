import 'package:flutter/material.dart';
import 'package:flutter_course/screens/change_notifier_screen.dart';
import 'package:flutter_course/screens/inherited_widget_screen.dart';
import 'package:flutter_course/screens/parent_child_screen.dart';
import 'package:flutter_course/screens/set_state_screen.dart';
import 'package:flutter_course/screens/stream_builder_screen.dart';
import 'package:flutter_course/screens/value_notifier_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Menu")),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: Screens.values.length,
        itemBuilder: (context, index) {
          final item = Screens.values[index];
          return FilledButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => item.screen));
            },
            child: Text(item.label),
          );
        },
      ),
    );
  }
}

// 1. SetState + StatefulWidget → baseline, rebuild a widget with new state.
//
// 2. ValueNotifier + ValueListenableBuilder (or AnimatedBuilder) →  lightweight observable for a single value.
//
// 3. ChangeNotifier + AnimatedBuilder →  a simple observer pattern with notifyListeners().
//
// 4. Stream + StreamBuilder → sync/reactive updates.
//
// 5. Future + FutureBuilder → one-time async results

//InheritedWidget → propagate state down the tree efficiently.

enum Screens {
  setState("Set State Example", SetStateScreen()),
  parentChildState("Parent Child State Example", ParentChildScreen()),
  valueNotifier("Value Notifier Example", ValueNotifierScreen()),
  changeNotifier("Change Notifier Example", ChangeNotifierScreen()),
  streamBuilder("Stream Builder Example", StreamBuilderScreen()),
  inheritedWidget("Inherited Widget Example", InheritedWidgetScreen());

  final String label;
  final Widget screen;

  const Screens(this.label, this.screen);
}

//Library	Underlying Mechanism
// Provider	- InheritedWidget + ChangeNotifier
// Riverpod	- Custom container, but based on ValueNotifier/Stream
// BLoC	- Stream + StreamController
// Cubit	- ValueNotifier-style reactive wrapper
// GetX -	Custom ValueNotifier + global dependency injection
