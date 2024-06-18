import Foundation
import CoreLocation

// MARK: - WeatherAPIConfiguration

struct WeatherAPIConfiguration {
    private let baseURL = "https://api.openweathermap.org/data/2.5"
    private let apiKey = "8d82e17bc8b285661a57dcc0dbb79fec"
    private let units = "imperial"
    
    static let `default` = WeatherAPIConfiguration()
    
    func urlForCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) -> URL {
        URL(string: "\(baseURL)/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=\(units)")!
    }
    
    func urlForFiveDayForecast(latitude: CLLocationDegrees, longitude: CLLocationDegrees) -> URL {
        URL(string: "\(baseURL)/forecast?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=\(units)")!
    }
}
