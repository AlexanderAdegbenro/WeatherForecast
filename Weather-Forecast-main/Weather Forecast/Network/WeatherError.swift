import Foundation

// MARK: - WeatherError

enum WeatherError: Error {
    case invalidURL
    case badServerResponse
    case failedDecoding(DecodingError)
    case other(Error)
}

