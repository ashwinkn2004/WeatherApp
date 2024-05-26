
# 🌤️ Weather App

A simple weather app built with Flutter that displays current weather information using the OpenWeather API.

## Features

- 🌡️ View current weather conditions including temperature, humidity, wind speed, etc.
- 🔍 Search for weather information by city name.
- 📅 Display weather forecast for the next few days.
- ⭐ Save favorite locations for quick access to weather information.

## Clone App

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/weather-app.git
   ```

2. Navigate to the project directory:

   ```bash
   cd weather-app
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Run the app:

   ```bash
   flutter run
   ```

## Configuration

To use the OpenWeather API, you need to obtain an API key from [OpenWeather](https://openweathermap.org/api) and replace `YOUR_API_KEY` in `lib/pages/consts.dart` with your actual API key.

```dart
const OPENWEATHER_API_KEY = 'YOUR_API_KEY';
```

## Contributing

Contributions are welcome! Please feel free to submit a pull request or open an issue if you encounter any bugs or have any feature requests.

