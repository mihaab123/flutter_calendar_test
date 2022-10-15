import 'package:flutter_calendar_test/models/day_model.dart';
import 'package:flutter_calendar_test/models/task_model.dart';
import 'package:flutter_calendar_test/services/date_service.dart';
import 'package:flutter_calendar_test/services/repository.dart';
import 'package:get/state_manager.dart';

class CalendarController extends GetxController {
  Rx<DateTime> currentMonthStart = Rx<DateTime>(DateTime.now());
  Rx<DateTime> currentMonthEnd = Rx<DateTime>(DateTime.now());
  RxList<DayModel> daysOfMonth = RxList<DayModel>([]);
  final Repository _repository = Repository();

  @override
  void onInit() {
    super.onInit();
    currentMonthStart.value = DateTime(
        currentMonthStart.value.year, currentMonthStart.value.month, 1);
    currentMonthEnd.value = DateTime(
        currentMonthStart.value.year, currentMonthStart.value.month + 1, 0);
    getData();
    update();
  }

  setNewDate(int step) {
    currentMonthStart.value = DateTime(
        currentMonthStart.value.year, currentMonthStart.value.month + step, 1);
    currentMonthEnd.value = DateTime(
        currentMonthStart.value.year, currentMonthStart.value.month + 1, 0);
    getData();
    update();
  }

  getData() async {
    getDaysOfMonth();
    await getTasks();
    update();
  }

  getDaysOfMonth() {
    int currentMonthDays = daysInMonth(currentMonthStart.value);
    int monthBeforeDays = daysInMonth(DateTime(
        currentMonthStart.value.year, currentMonthStart.value.month - 1, 1));
    List<DayModel> monthBefore = List.generate(
        (currentMonthStart.value.weekday - 1),
        ((index) => DayModel(
            currentMonth: false,
            day: monthBeforeDays -
                (currentMonthStart.value.weekday - 1) +
                index +
                1,
            tasks: List.generate(
                3,
                (index) => TaskModel(
                    id: index,
                    date: DateTime(currentMonthStart.value.year,
                        currentMonthStart.value.month, index + 1),
                    description: "description $index")))));

    List<DayModel> currentMonth = List.generate(
        currentMonthDays + (7 - currentMonthEnd.value.weekday),
        ((index) => DayModel(
            currentMonth: index >= currentMonthDays ? false : true,
            day: index >= currentMonthDays
                ? index - currentMonthDays + 1
                : index + 1,
            tasks: [])));
    daysOfMonth.value = monthBefore + currentMonth;
  }

  addNewTaskToDatabase(DayModel item, TaskModel task) async {
    await _repository.insertData("tasks", task.toMap());
    int index = daysOfMonth.indexOf(item);
    daysOfMonth[index].tasks.add(task);
    await getData();
    update();
  }

  deleteTaskFromDatabase(int index, TaskModel task) async {
    await _repository.deleteData("tasks", task.id);
    daysOfMonth[index].tasks.remove(task);
    await getData();
    update();
  }

  getTasks() async {
    final List<Map<String, dynamic>> maps = await _repository.readData(
        "tasks", currentMonthStart.value, currentMonthEnd.value);

    List<TaskModel> tasksList = List.generate(maps.length, (i) {
      return TaskModel.fromMap(maps[i]);
    });

    for (TaskModel task in tasksList) {
      int currentDay = task.date.day;
      int index = daysOfMonth.indexWhere(
          (element) => element.currentMonth && element.day == currentDay);
      daysOfMonth[index].tasks.add(task);
    }
    daysOfMonth.refresh();
  }
}
