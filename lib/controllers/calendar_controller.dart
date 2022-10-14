import 'package:flutter_calendar_test/models/day_model.dart';
import 'package:flutter_calendar_test/models/task_model.dart';
import 'package:flutter_calendar_test/services/date_service.dart';
import 'package:get/state_manager.dart';

class CalendarController extends GetxController {
  Rx<DateTime> currentMonthStart = Rx<DateTime>(DateTime.now());
  Rx<DateTime> currentMonthEnd = Rx<DateTime>(DateTime.now());
  RxList<DayModel> daysOfMonth = RxList<DayModel>([]);

  @override
  void onInit() {
    super.onInit();
    currentMonthStart.value = DateTime(
        currentMonthStart.value.year, currentMonthStart.value.month, 1);
    currentMonthEnd.value = DateTime(
        currentMonthStart.value.year, currentMonthStart.value.month + 1, 0);
    getDaysOfMonth();
  }

  setNewDate(DateTime newDate) {
    currentMonthStart.value = newDate;
    getDaysOfMonth();
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
            tasks: List.generate(
                3,
                (index) => TaskModel(
                    date: DateTime(currentMonthStart.value.year,
                        currentMonthStart.value.month, index + 1),
                    description: "description $index")))));
    daysOfMonth.value = monthBefore + currentMonth;
  }

  setItemList(int index, DayModel item) {
    daysOfMonth[index] = item;
    update();
  }
}
