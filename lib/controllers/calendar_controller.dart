import 'package:flutter_calendar_test/models/day_model.dart';
import 'package:flutter_calendar_test/models/task_model.dart';
import 'package:flutter_calendar_test/services/date_service.dart';
import 'package:get/state_manager.dart';

class CalendarController extends GetxController {
  Rx<DateTime> currentDate = Rx<DateTime>(DateTime.now());
  RxList<DayModel> daysOfMonth = RxList<DayModel>([]);

  @override
  void onInit() {
    super.onInit();
    currentDate.value =
        DateTime(currentDate.value.year, currentDate.value.month, 1);
    getDaysOfMonth();
  }

  setNewDate(DateTime newDate) {
    currentDate.value = newDate;
    getDaysOfMonth();
    update();
  }

  getDaysOfMonth() {
    daysOfMonth.value = List.generate(
        daysInMonth(currentDate.value),
        ((index) => DayModel(
            day: index + 1,
            tasks: List.generate(
                3,
                (index) => TaskModel(
                    date: DateTime(currentDate.value.year,
                        currentDate.value.month, index + 1),
                    description: "description $index")))));
  }

  setItemList(int index, DayModel item) {
    daysOfMonth[index] = item;
    update();
  }
}
