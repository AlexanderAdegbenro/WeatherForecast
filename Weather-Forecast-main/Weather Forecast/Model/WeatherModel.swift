import Foundation

// Main model for the current weather response
struct WeatherModel: Decodable, Equatable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse
    var list: [ForecastResponse]?
    var visibility: Int?
    var dt: Int?
    var sys: SysResponse?
    var clouds: CloudsResponse?
    var base: String?

    // Coordinates of the location
    struct CoordinatesResponse: Decodable, Equatable {
        var lon: Double
        var lat: Double
    }

    // Weather details
    struct WeatherResponse: Decodable, Equatable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }

    // Main weather parameters
    struct MainResponse: Decodable, Equatable {
        var temp: Double
        var feelsLike: Double
        var tempMin: Double
        var tempMax: Double
        var pressure: Double
        var humidity: Double
        
        // Provide readable property names
        enum CodingKeys: String, CodingKey {
            case temp
            case feelsLike = "feels_like"
            case tempMin = "temp_min"
            case tempMax = "temp_max"
            case pressure
            case humidity
        }
    }
    
    // Wind details
    struct WindResponse: Decodable, Equatable {
        var speed: Double
        var deg: Double
    }
    
    // Forecast data for each time interval
    struct ForecastResponse: Decodable, Equatable {
        var dt: Int
        var main: MainResponse
        var weather: [WeatherResponse]
        var dtTxt: String
        
        enum CodingKeys: String, CodingKey {
            case dt, main, weather
            case dtTxt = "dt_txt"
        }
    }
    
    // System data like sunrise and sunset times
    struct SysResponse: Decodable, Equatable {
        var type: Int?
        var id: Int?
        var country: String?
        var sunrise: Int?
        var sunset: Int?
    }
    
    // Cloudiness details
    struct CloudsResponse: Decodable, Equatable {
        var all: Int?
    }
}
