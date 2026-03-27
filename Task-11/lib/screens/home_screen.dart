import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_11/screens/archive.dart';
import 'package:task_11/screens/done.dart';
import 'package:task_11/screens/tasks.dart';
import 'package:task_11/widgets/reusable_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NotchBottomBarController _controller = NotchBottomBarController();
  final PageController _pageController = PageController(initialPage: 0);
  final List<Widget> _screens = [TasksScreen(), ArchiveScreen(), DoneScreen()];
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  bool _isOpen = false;

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
            _scaffoldKey.currentState?.showBottomSheet((context) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      spacing: 10,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        taskField(
                          controller: _titleController,
                          readOnly: false,
                          label: "Task Name",
                          icon: Icons.title,
                          onTap: () {},
                        ),
                        taskField(
                          controller: _timeController,
                          readOnly: true,
                          label: "Task Time",
                          icon: Icons.watch_later_outlined,
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then((value) {
                              if (value != null) {
                                _timeController.text = value.format(context);
                              }
                            });
                          },
                        ),
                        taskField(
                          controller: _dateController,
                          readOnly: true,
                          label: "Task Date",
                          icon: Icons.date_range_outlined,
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate: DateTime.parse("2049-12-31"),
                            ).then((value) {
                              if (value != null) {
                                _dateController.text = DateFormat.yMMMd()
                                    .format(value);
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
          } else {
            if (_formKey.currentState!.validate()) {
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
}
