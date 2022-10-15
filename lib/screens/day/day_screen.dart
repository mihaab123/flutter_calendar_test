import 'package:flutter/material.dart';
import 'package:flutter_calendar_test/controllers/calendar_controller.dart';
import 'package:flutter_calendar_test/models/day_model.dart';
import 'package:flutter_calendar_test/models/task_model.dart';
import 'package:flutter_calendar_test/screens/day/widgets/task_list_item.dart';
import 'package:flutter_calendar_test/services/date_service.dart';
import 'package:get/get.dart';

class DayScreen extends StatefulWidget {
  final DayModel item;

  DayScreen({Key? key, required this.item}) : super(key: key);

  @override
  State<DayScreen> createState() => _DayScreenState();
}

class _DayScreenState extends State<DayScreen> {
  final CalendarController _calendarController = Get.find<CalendarController>();

  final TextEditingController _editingController = TextEditingController();
  final List<String> _timePicker = List.generate(48, (index) {
    int hours = index ~/ 2;
    int minutes = index % 2 == 0 ? 0 : 30;
    return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}";
  });
  String currentTime = "00:00";

  @override
  Widget build(BuildContext context) {
    DateTime itemDate = DateTime(
        _calendarController.currentMonthStart.value.year,
        _calendarController.currentMonthStart.value.month,
        widget.item.day);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(getDateToString(itemDate)),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - 20),
          child: Column(
            children: [
              Hero(
                tag: widget.item,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.item.tasks.length,
                  itemBuilder: ((context, index) {
                    return TaskListItem(
                      task: widget.item.tasks[index],
                      itemIndex: index,
                    );
                  }),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        DropdownButton<String>(
                          value: currentTime,
                          elevation: 16,
                          style: const TextStyle(color: Colors.blue),
                          underline: Container(
                            height: 2,
                            color: Colors.blueAccent,
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              currentTime = value!;
                            });
                          },
                          items: _timePicker
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        TextField(
                            onChanged: (value) => setState(() {}),
                            controller: _editingController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'New description',
                            )),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: _editingController.text.isEmpty
                          ? null
                          : (() =>
                              addNewTask(_editingController.text, currentTime)),
                      child: const Text("Add"))
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

  addNewTask(String text, String currentTime) {
    List<String> timeList = currentTime.split(":");
    _calendarController.addNewTaskToDatabase(
        widget.item,
        TaskModel(
            id: null,
            date: DateTime(
                _calendarController.currentMonthStart.value.year,
                _calendarController.currentMonthStart.value.month,
                widget.item.day,
                int.parse(timeList[0]),
                int.parse(timeList[1])),
            description: text));

    setState(() {
      _editingController.text = "";
    });
  }
}
