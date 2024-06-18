# Weather Forecast App

## Project Summary
The Weather Forecast App is a mobile application that provides users with current weather information and a five-day weather forecast based on their location. It utilizes the OpenWeatherMap API to fetch weather data and displays it in a user-friendly interface. The app also handles various states such as fetching location data, loading weather data, and displaying errors if they occur.

## Primary Features
- **Current Weather**: Fetches and displays current weather information.
- **Five-Day Forecast**: Provides a five-day weather forecast.
- **State Handling**: Manages various states including idle, fetching location, fetching weather, and displaying errors.
- **User-Friendly Interface**: Clear and concise weather details.
- **Permissions Handling**: Handles location access permissions.
- **Error Handling**: Displays errors for network issues and data fetching problems.

## Architecture
The project is organized into several main components, each responsible for different aspects of the application:

- **Network**
  - `NetworkSession`: Protocol to abstract network session, making it easier to test.
  - `WeatherAPIConfiguration`: Configuration for the weather API URLs.
  - `WeatherError`: Custom errors for weather fetching.
- **ViewModel**
  - `WeatherViewModel`: Manages the application's state and coordinates the fetching of data.
- **Model**
  - `WeatherLoadingState`: Enum to handle various states of weather data loading.
  - `WeatherModel`: Data model for the current weather.
  - `ForecastModel`: Data model for the five-day forecast.
- **Views**
  - `PermissionsDeniedView`: View shown when location permissions are denied.
  - `ContentView`: Main content view.
  - `LoadingView`: View shown during data fetching.
  - `WeatherView`: View to display weather data.
  - `WeatherIconView`: View to display weather icons.
  - `WeatherRow`: Reusable row component for weather details.
- **Managers**
  - `LocationManager`: Manages location services.
  - `WeatherManager`: Handles data fetching logic.
- **Utilities**
  - `ModelData`: Supplementary data for models.
  - `WeatherData`: Supplementary data for weather.
  - `FiveDayForecastData`: Supplementary data for five-day forecast.
  - `Extensions`: Extensions to simplify code.

## Instructions to Set Up and Run in Xcode

1. **Clone the Repository**
    ```bash
    git clone https://github.com/yourusername/weather-forecast-app.git](https://github.com/AlexanderAdegbenro/WeatherForecast.git
    cd weather-forecast-app
    ```

2. **Open in Xcode**
   - Open `WeatherForecastApp.xcodeproj` in Xcode.

3. **Set Up API Key**
   - Create a file named `Secrets.swift` in the `Utilities` folder.
   - Add your OpenWeatherMap API key to `Secrets.swift`:
     ```swift
     struct Secrets {
         static let apiKey = "YOUR_API_KEY"
     }
     ```

4. **Run the Project**
   - Select the target device or simulator.
   - Press `Cmd + R` to build and run the project.

## Why This Project Was Chosen
I chose to showcase this project because it demonstrates my ability to develop a full-featured iOS application that integrates with an external API, handles various application states, and provides a seamless user experience. This project highlights my skills in SwiftUI, Combine, and handling asynchronous network requests.

## Areas for Improvement

1. **Code Duplication**
   - There is some duplication in handling different states within the `WeatherViewModel` and views. Refactoring common logic into helper functions or extensions could reduce code duplication.

2. **Error Handling**
   - Currently, error messages are displayed using simple text views. Improving the error handling mechanism to provide more user-friendly and informative error messages would enhance the user experience.

3. **Testing**
   - While basic unit tests are in place, increasing the coverage and adding more integration tests would ensure the robustness of the application. Implementing mutation tests could further improve the quality of tests.

4. **Performance Optimization**
   - The app could be optimized for performance by caching weather data and reducing unnecessary network requests.

By addressing these areas, the project can become more efficient, maintainable, and user-friendly.

