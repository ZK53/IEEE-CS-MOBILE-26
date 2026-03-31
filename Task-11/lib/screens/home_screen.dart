import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_11/screens/archive.dart';
import 'package:task_11/screens/done.dart';
import 'package:task_11/screens/tasks.dart';
import 'package:task_11/widgets/add_task_sheet.dart';
import 'package:task_11/widgets/reusable_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NotchBottomBarController _controller = NotchBottomBarController();
  final PageController _pageController = PageController(initialPage: 0);
  List<Widget> get _screens => [
    TasksScreen(tasks: tasks),
    ArchiveScreen(),
    DoneScreen(),
  ];
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();
    createDatabase();
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    _titleController.dispose();
    _timeController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      backgroundColor: Color.fromRGBO(169, 186, 171, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Row(
          spacing: 10,
          children: [
            Icon(Icons.task, color: Colors.white),
            Text(
              "All Tasks",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        color: Colors.grey,
        notchColor: Colors.black,
        notchBottomBarController: _controller,
        bottomBarItems: [
          bottomBarItem(icon: Icons.home, label: "Tasks"),
          bottomBarItem(icon: Icons.archive, label: "Archive"),
          bottomBarItem(icon: Icons.check_box, label: "Done"),
        ],
        onTap: (int value) {
          _pageController.jumpToPage(value);
        },
        removeMargins: false,
        bottomBarWidth: 500,
        showShadow: false,
        kIconSize: 24,
        kBottomRadius: 28,
        showLabel: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (!_isOpen) {
            setState(() => _isOpen = !_isOpen);
            _scaffoldKey.currentState
                ?.showBottomSheet((context) {
                  return AddTaskSheet(formKey: _formKey, titleController: _titleController, timeController: _timeController, dateController: _dateController);
                })
                .closed
                .then((value) {
                  setState(() {
                    _isOpen = false;
                  });
                });
          } else {
            if (_formKey.currentState!.validate()) {
              insertData(
                title: _titleController.text,
                time: _timeController.text,
                date: _dateController.text,
                status: "status",
              );
              setState(() => _isOpen = !_isOpen);
              Navigator.of(context).pop();
              _titleController.clear();
              _timeController.clear();
              _dateController.clear();
            }
          }
        },
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: List.generate(_screens.length, (i) => _screens[i]),
      ),
    );
  }

  late Database db;
  List<Map> tasks = [];

  Future<void> createDatabase() async {
    db = await openDatabase(
      'path.db',
      version: 1,
      onCreate: (db, version) async {
        debugPrint("Database created");
        await db.execute(
          "CREATE TABLE tasks (id INTEGER NOT NULL PRIMARY KEY, title TEXT NOT NULL, time TEXT NOT NULL, date TEXT NOT NULL, status TEXT NOT NULL)",
        );
        debugPrint("Table created");
      },
      onOpen: (db) async {
        tasks = await getData(db);
        setState(() {});
      },
    );
  }

  Future<void> insertData({
    required String title,
    required String time,
    required String date,
    required String status,
  }) async {
  await  db.transaction((txn)async {
      // return txn.rawInsert(
      //   'INSERT INTO tasks(title, time, date, status) VALUES("$title", "$time", "$date", "$status")',
      // );

      await txn.insert("tasks", {
        "title": title,
        "time": time,
        "date": date,
        "status": status,
      });
    });
    tasks = await getData(db);
    setState(() {});
  }

  Future<List<Map>> getData(Database database) async {
    return await database.rawQuery("SELECT * FROM tasks");
  }
}
