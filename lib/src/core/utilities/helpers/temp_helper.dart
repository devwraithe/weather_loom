String weatherImage(String weatherCondition) {
  switch (weatherCondition.toLowerCase()) {
    case "clear":
      return "assets/images/clear.jpeg";
    case "clouds":
      return "assets/images/clear.jpeg";
    case "drizzle":
      return "assets/images/clear.jpeg";
    case "rain":
      return "assets/images/clear.jpeg";
    case "snow":
      return "assets/images/clear.jpeg";
    case "thunderstorm":
      return "assets/images/clear.jpeg";
    case "mist":
      return "assets/images/clear.jpeg";
    case "fog":
      return "assets/images/clear.jpeg";
    case "haze":
      return "assets/images/clear.jpeg";
    case "smoke":
      return "assets/images/clear.jpeg";
    case "dust":
      return "assets/images/clear.jpeg";
    case "sand":
      return "assets/images/clear.jpeg";
    case "ash":
      return "assets/images/clear.jpeg";
    case "squall":
      return "assets/images/clear.jpeg";
    case "tornado":
      return "assets/images/squall.jpeg";
    default:
      return "assets/images/black.jpeg";
  }
}
