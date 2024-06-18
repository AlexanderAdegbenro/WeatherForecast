import Foundation
import CoreLocation

// MARK: - WeatherManager
// This class handles fetching weather data from the API.
class WeatherManager: ObservableObject {
    private let session: NetworkSession
    private let config: WeatherAPIConfiguration
    
    // Initializer with dependency injection for session and configuration
    init(session: NetworkSession = URLSession.shared as NetworkSession,
         config: WeatherAPIConfiguration = .default) {
        self.session = session
        self.config = config
    }
    
    // Fetch current weather data
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> WeatherModel {
        let url = config.urlForCurrentWeather(latitude: latitude, longitude: longitude)
        return try await fetchDataAndDecode(from: url, decodingType: WeatherModel.self)
    }
    
    // Fetch five-day weather forecast
    func getFiveDayForecast(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> Welcome {
        let url = config.urlForFiveDayForecast(latitude: latitude, longitude: longitude)
        return try await fetchDataAndDecode(from: url, decodingType: Welcome.self)
    }
    
    // Fetch data from URL and decode it
    private func fetchDataAndDecode<T: Decodable>(from url: URL, decodingType: T.Type) async throws -> T {
        let (data, response) = try await self.session.fetchData(for: URLRequest(url: url))
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw WeatherError.badServerResponse
        }
        
        return try decodeData(data, decodingType: decodingType)
    }
    
    // Decode data into the specified type
    private func decodeData<T: Decodable>(_ data: Data, decodingType: T.Type) throws -> T {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch let error as DecodingError {
            throw WeatherError.failedDecoding(error)
        } catch {
            throw WeatherError.other(error)
        }
    }
}
