import SwiftUI



struct ContentView: View {
    @Binding var isDarkMode: Bool

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Text("Welcome to the Profile App!")
                    .font(.title)

                Button(action: {
                    isDarkMode.toggle()
                }) {
                    Text("Toggle Theme")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .buttonStyle(.plain)
                .padding(.horizontal)
            }
            .navigationTitle("Profile")
        }
    }
}
