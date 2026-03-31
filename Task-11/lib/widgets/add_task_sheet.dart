import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_11/widgets/reusable_widgets.dart';

class AddTaskSheet extends StatelessWidget {
  const AddTaskSheet({
    super.key,
    required this.formKey,
    required this.titleController,
    required this.timeController,
    required this.dateController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController timeController;
  final TextEditingController dateController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              spacing: 10,
              mainAxisSize: MainAxisSize.min,
              children: [
                taskField(
                  controller: titleController,
                  readOnly: false,
                  label: "Task Name",
                  icon: Icons.title,
                  onTap: () {},
                ),
                taskField(
                  controller: timeController,
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
                        timeController.text = value.format(context);
                      }
                    });
                  },
                ),
                taskField(
                  controller: dateController,
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
                        dateController.text = DateFormat.yMMMd().format(value);
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
