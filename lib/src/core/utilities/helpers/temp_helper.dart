String weatherImage(String weatherCondition) {
  switch (weatherCondition.toLowerCase()) {
    case "clear":
      return "https://clarksvillenow.sagacom.com/files/2020/10/shutterstock_206307496-1200x768.jpg";
    case "clouds":
      return "https://images.unsplash.com/photo-1534088568595-a066f410bcda?q=80&w=3302&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
    case "drizzle":
      return "https://images.unsplash.com/photo-1635823288719-93f2c8ac7f3f?q=80&w=3376&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
    case "rain":
      return "https://images.unsplash.com/photo-1438449805896-28a666819a20?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
    case "snow":
      return "https://images.unsplash.com/photo-1637765435803-af23755dbf88?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
    case "thunderstorm":
      return "https://images.unsplash.com/photo-1583459094467-e0db130c0dea?q=80&w=2667&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
    case "mist":
      return "https://images.unsplash.com/photo-1603807617654-89b25101a00e?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
    case "fog":
      return "https://images.unsplash.com/photo-1487621167305-5d248087c724?q=80&w=3432&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
    case "haze":
      return "https://images.unsplash.com/photo-1502547854025-1eeb46a6e56c?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
    case "smoke":
      return "https://images.unsplash.com/photo-1675702662605-57e37a8cb2c3?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
    case "dust":
      return "https://images.unsplash.com/photo-1680352267694-a7fd4c33d4e1?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
    case "sand":
      return "https://images.unsplash.com/photo-1603695820889-f8a0a86b8712?q=80&w=3348&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
    case "ash":
      return "https://images.unsplash.com/photo-1579003593419-98f949b9398f?q=80&w=3273&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
    case "squall":
      return "https://images.pexels.com/photos/18956506/pexels-photo-18956506/free-photo-of-clouds-in-the-sky.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2";
    case "tornado":
      return "https://images.pexels.com/photos/1119974/pexels-photo-1119974.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2";
    default:
      return "https://images.pexels.com/photos/209831/pexels-photo-209831.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2";
  }
}
