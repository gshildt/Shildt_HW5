import SwiftUI

struct MainScreen: View {
    @Binding var isDarkMode: Bool

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Welcome to the Profile App!")
                    .font(.title)

                NavigationLink(destination: ProfileScreen(isDarkMode: $isDarkMode)) {
                    Text("Go to Profile")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                Button(action: {
                    isDarkMode.toggle()
                }) {
                    Text("Toggle Theme")
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .navigationTitle("Welcome")
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    @State static var isDarkMode = false

    static var previews: some View {
        MainScreen(isDarkMode: $isDarkMode)
    }
}