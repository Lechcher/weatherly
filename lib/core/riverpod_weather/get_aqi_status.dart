String getAqiStatus(int api) {
  switch (api) {
    case >= 0 && < 50:
      return "Good";
    case >= 50 && < 100:
      return "Moderate";
    case >= 100 && < 150:
      return "Unhealthy for Sensitive Groups";
    case >= 150 && < 200:
      return "Unhealthy";
    case >= 200 && < 300:
      return "Very Unhealthy";
    case >= 300 && < 500:
      return "Hazardous";
    default:
      return "Unknown";
  }
}
