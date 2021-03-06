import 'package:flutter/material.dart';
import 'package:todo2/widget/TodoList.dart';
import 'package:todo2/widget/completed_list_widget.dart';
import '../widget/addDialog.dart';
import '../main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      TodoList(),
      CompletedListWidget(),
    ];
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white.withOpacity(0.7),
          selectedItemColor: Colors.white,
          currentIndex: selectedIndex,
          onTap: (index) => setState(() {
            selectedIndex = index;
          }),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.fact_check_outlined), label: 'Tasks'),
            BottomNavigationBarItem(
                icon: Icon(Icons.done, size: 28), label: 'Completed'),
          ],
        ),
        body: tabs[selectedIndex],
        floatingActionButton: FloatingActionButton(
          onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) {
              return AddTodoDialogWidget();
            },
            barrierDismissible: true,
          ),
          child: Icon(Icons.add),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.green[400],
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            MyApp.title,
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[50]),
          ),
        ));

    ;
  }
}
