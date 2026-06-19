import 'package:flutter/material.dart';
import 'package:flutter_course/modules/home/home_screen.dart';
import 'package:flutter_course/screens/card_screen.dart';
import 'package:flutter_course/screens/column_row_screen.dart';
import 'package:flutter_course/screens/columns_screen.dart';
import 'package:flutter_course/screens/container_screen.dart';
import 'package:flutter_course/modules/home/custom_screen.dart';
import 'package:flutter_course/screens/horizontal_grid_screen.dart';
import 'package:flutter_course/screens/horizontal_list_screen.dart';
import 'package:flutter_course/screens/row_column_screen.dart';
import 'package:flutter_course/screens/rows_screen.dart';
import 'package:flutter_course/modules/splash/splash_screen.dart';
import 'package:flutter_course/screens/stack_row_column_screen.dart';
import 'package:flutter_course/screens/stack_screen.dart';
import 'package:flutter_course/screens/vertical_grid_screen.dart';
import 'package:flutter_course/screens/vertical_list_screen.dart';

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

enum Screens {
  custom("Custom", HomeScreen()),
  container("Containers", ContainerScreen()),
  card("Cards", CardScreen()),
  column("Columns", ColumnsScreen()),
  row("Rows", RowsScreen()),
  stack("Stack", StackScreen()),
  rowColumn("Row Column", RowColumnScreen()),
  columnRow("Column Row", ColumnRowScreen()),
  stackRowColumn("Stack Row Column", StackRowColumnScreen()),
  verticalList("Vertical List", VerticalListScreen()),
  horizontalList("Horizontal List", HorizontalListScreen()),
  verticalGrid("Vertical Grid", VerticalGridScreen()),
  horizontalGrid("Horizontal Grid", HorizontalGridScreen());

  final String label;
  final Widget screen;

  const Screens(this.label, this.screen);
}
