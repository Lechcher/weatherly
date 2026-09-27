String getAqiAdvice(int aqi) {
  switch (aqi) {
    case >= 0 && < 50:
      return "Air quality is considered satisfactory, and air pollution poses little or no risk.";
    case >= 50 && < 100:
      return "Air quality is acceptable. However, unusually sensitive people should consider reducing outdoor activities.";
    case >= 100 && < 150:
      return "Members of sensitive groups may experience health effects. The general public is less likely to be affected.";
    case >= 150 && < 200:
      return "Some members of the general public may experience health effects; members of sensitive groups may experience more serious health effects.";
    case >= 200 && < 300:
      return "Health alert: The risk of health effects is increased for everyone. Everyone should avoid outdoor exertion.";
    case >= 300 && <= 500:
      return "Health warning of emergency conditions: Everyone is more likely to be affected. Avoid all outdoor activities.";
    default:
      return "No air quality advice available.";
  }
}
