import Foundation

// MARK: - Welcome
// This is the main model for the forecast response. It holds the entire forecast data.
struct Welcome: Codable, Equatable {
    let cod: String
    let message, cnt: Int
    let list: [WeatherList]
    let city: City
}

// MARK: - City
// Details about the city where the forecast is provided.
struct City: Codable, Equatable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population, timezone, sunrise, sunset: Int
}

// MARK: - Coord
// Geographical coordinates of the city.
struct Coord: Codable, Equatable {
    let lat, lon: Double
}

// MARK: - WeatherList
// Weather data for each time interval. Each entry gives us detailed weather info at a specific time.
struct WeatherList: Codable, Equatable {
    let dt: Int
    let main: MainWeather
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let visibility: Int
    let pop: Double
    let sys: Sys
    let dtTxt: String
    let rain: Rain?
    
    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, sys
        case dtTxt = "dt_txt"
        case rain
    }
}

// MARK: - Clouds
// Details about cloudiness.
struct Clouds: Codable, Equatable {
    let all: Int
}

// MARK: - MainWeather
// Main weather parameters like temperature, pressure, and humidity.
struct MainWeather: Codable, Equatable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
    let tempKf: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

// MARK: - Rain
// Rain volume for the specified period.
struct Rain: Codable, Equatable {
    let the3H: Double
    
    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}

// MARK: - Sys
// System data like pod (day/night indicator).
struct Sys: Codable, Equatable {
    let pod: Pod
}

enum Pod: String, Codable, Equatable {
    case day = "d"
    case night = "n"
}

// MARK: - Weather
// Detailed weather conditions.
struct Weather: Codable, Equatable {
    let id: Int
    let main: WeatherCondition
    let description, icon: String
}

enum WeatherCondition: String, Codable, Equatable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
}

// MARK: - Wind
// Details about wind speed, direction, and gusts.
struct Wind: Codable, Equatable {
    let speed: Double
    let deg: Int
    let gust: Double
}
