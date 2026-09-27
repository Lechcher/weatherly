enum formatWidgetType { hourly_forecast_card_widget, sun_cycle_card_widget }

String formatTime(String timeIso, formatWidgetType widgetType, [int? index]) {
  if (widgetType == formatWidgetType.hourly_forecast_card_widget) {
    if (timeIso.isEmpty) return '';
    if (index == 0) return 'Now';

    try {
      final dt = DateTime.parse(timeIso);
      final hour = dt.hour.toString().padLeft(2, '0');
      final minute = dt.minute.toString().padLeft(2, '0');
      return '$hour:$minute';
    } catch (_) {
      return timeIso;
    }
  }
  if (widgetType == formatWidgetType.sun_cycle_card_widget) {
    if (timeIso.isEmpty) return '--:--';

    try {
      final dt = DateTime.parse(timeIso);
      final hour = dt.hour.toString().padLeft(2, '0');
      final minute = dt.minute.toString().padLeft(2, '0');
      return '$hour:$minute';
    } catch (_) {
      return timeIso;
    }
  }
  return timeIso;
}
