String formatDailyDate(String dateIso, int index) {
  if (index == 0) {
    return "Today";
  }

  if (index == 1) {
    return "Tomorrow";
  }

  try {
    final dateTime = DateTime.parse(dateIso);

    const weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

    return weekdays[dateTime.weekday - 1];
  } catch (_) {
    return dateIso;
  }
}
