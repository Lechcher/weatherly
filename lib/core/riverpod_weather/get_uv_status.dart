String getUvStatus(double uv) {
  if (uv <= 2) return "very weak";
  if (uv <= 5) return "moderate";
  if (uv <= 7) return "high";
  if (uv <= 10) return "very high";
  return "extreme";
}
