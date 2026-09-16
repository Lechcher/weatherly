class WeatherConverter {
  // --- Temperature ---
  static double celsiusToFahrenheit(double c) => (c * 1.8) + 32;

  // --- Wind Speed ---
  static double kmhToMs(double kmh) => kmh / 3.6;
  static double kmhToFts(double kmh) => kmh * 0.911344;
  static double kmhToMph(double kmh) => kmh / 1.609344;
  static double kmhToKnots(double kmh) => kmh / 1.852;

  // --- Air Pressure ---
  static double hpaToMmHg(double hpa) => hpa * 0.750062;
  static double hpaToInHg(double hpa) => hpa * 0.02953;

  // --- Visibility ---
  static double metersToKm(double m) => m / 1000;
}
