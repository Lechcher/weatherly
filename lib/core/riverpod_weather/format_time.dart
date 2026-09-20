String formatTime(String timeIso, int index) {
  if (index == 0) return "Now";
  try {
    final dateTime = DateTime.parse(timeIso);
    final hour = dateTime.hour.toString().padLeft(2, "0");
    final minute = dateTime.minute.toString().padLeft(2, "0");
    return "$hour:$minute";
  } catch (_) {
    return timeIso;
  }
}
