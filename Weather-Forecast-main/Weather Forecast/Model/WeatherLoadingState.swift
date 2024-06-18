import Foundation
import CoreLocation
import SwiftUI

// MARK: - WeatherLoadingState
enum WeatherLoadingState: Equatable {
    case idle
    case fetchingLocation
    case fetchedLocation(CLLocation)
    case fetchingWeather
    case fetchingForecast
    case fetchedWeatherAndForecast(WeatherModel, Welcome)
    case error(String)
    
    // Equatable conformance to compare different loading states
    static func == (lhs: WeatherLoadingState, rhs: WeatherLoadingState) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle),
             (.fetchingLocation, .fetchingLocation),
             (.fetchingWeather, .fetchingWeather),
             (.fetchingForecast, .fetchingForecast):
            return true
        case let (.fetchedLocation(lhsLocation), .fetchedLocation(rhsLocation)):
            return lhsLocation == rhsLocation
        case let (.fetchedWeatherAndForecast(lhsWeather, lhsForecast), .fetchedWeatherAndForecast(rhsWeather, rhsForecast)):
            return lhsWeather == rhsWeather && lhsForecast == rhsForecast
        case let (.error(lhsError), .error(rhsError)):
            return lhsError == rhsError
        default:
            return false
        }
    }
}
