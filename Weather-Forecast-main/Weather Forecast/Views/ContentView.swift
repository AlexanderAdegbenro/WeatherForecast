
import SwiftUI

// MARK: - ContentView
struct ContentView: View {
    
    @StateObject var viewModel = WeatherViewModel()
    
    // Computed properties for styling
    var backgroundColor: Color {
        Color(red: 0.286, green: 0.337, blue: 0.447)
    }
    
    // Main body of the view
    var body: some View {
        GeometryReader { geometry in
            ScrollView(showsIndicators: false) {
                VStack {
                    WeatherContentView(viewModel: viewModel)
                }
                .frame(minWidth: geometry.size.width, minHeight: geometry.size.height)
            }
            .background(backgroundColor)
            .preferredColorScheme(.dark)
        }
    }
}

// View to handle the content based on the loading state
struct WeatherContentView: View {
    @ObservedObject var viewModel: WeatherViewModel

    var body: some View {
        content
            .task {
                if case .fetchedLocation(let location) = viewModel.loadingState {
                    await viewModel.fetchWeatherAndForecast(for: location)
                }
            }
    }

    var content: some View {
        switch viewModel.loadingState {
        case .idle, .fetchingLocation, .fetchingWeather, .fetchingForecast, .fetchedLocation:
            return AnyView(LoadingView())
            
        case .fetchedWeatherAndForecast:
            return AnyView(WeatherView(viewModel: viewModel))
            
        case .error(let message):
            return AnyView(Text(message).foregroundColor(.red))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
