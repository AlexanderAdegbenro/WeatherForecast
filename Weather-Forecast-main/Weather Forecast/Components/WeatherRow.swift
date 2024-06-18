import SwiftUI

struct WeatherRow: View {
    var name: String
    var value: String
    
    var body: some View {
        HStack(spacing: 15) {
            HStack() {
                Text(name)
                    .font(.caption)
                Text(value)
                    .bold()
                    .font(.title2)
            }
        }
        .padding()
    }
}

struct WeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRow(name: "Feels like", value: "8°")
    }
}
