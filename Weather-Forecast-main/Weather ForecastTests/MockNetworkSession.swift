
import Foundation
@testable import Weather_Forecast

struct MockNetworkSession: NetworkSession {
    
    var mockData: Data?
    var mockResponse: URLResponse?
    var mockError: Error?
    
    enum NetworkError: Error {
        case invalidResponse
        case requestFailed(Error)
    }

    func fetchData(for request: URLRequest) async throws -> (Data, URLResponse) {
        if let error = mockError {
            throw error
        }
        
        guard let data = mockData, let response = mockResponse else {
            throw NetworkError.invalidResponse
        }
        
        return (data, response)
    }
}
