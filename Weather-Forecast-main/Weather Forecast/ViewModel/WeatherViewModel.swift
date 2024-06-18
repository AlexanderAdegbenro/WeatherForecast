import Foundation
import CoreLocation
import SwiftUI

// MARK: - WeatherViewModel
@MainActor
class WeatherViewModel: NSObject, ObservableObject {
    
    // MARK: - Properties
    @Published var loadingState: WeatherLoadingState = .idle
    private var weatherManager = WeatherManager()
    var fetchedLocation: CLLocation?
    private var locationManager = CLLocationManager()
    
    // MARK: - Initializer
    override init() {
        super.init()
        configureLocationManager()
    }
    
    // Configure the location manager and request authorization
    private func configureLocationManager() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        requestLocation()
    }
    
    // Request the user's location
    func requestLocation() {
        loadingState = .fetchingLocation
        locationManager.requestLocation()
    }
    
    // Fetch weather and forecast data based on the user's location
    func fetchWeatherAndForecast(for location: CLLocation) async {
        fetchedLocation = location
        loadingState = .fetchingWeather

        do {
            let fetchedWeather = try await weatherManager.getCurrentWeather(
                latitude: location.coordinate.latitude,
                longitude: location.coordinate.longitude
            )

            let fetchedForecast = try await weatherManager.getFiveDayForecast(
                latitude: location.coordinate.latitude,
                longitude: location.coordinate.longitude
            )

            loadingState = .fetchedWeatherAndForecast(fetchedWeather, fetchedForecast)
        } catch {
            loadingState = .error("Error fetching weather data: \(error.localizedDescription)")
        }
    }
}


