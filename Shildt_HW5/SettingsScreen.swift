import SwiftUI

struct SettingsScreen: View {
    @Binding var isDarkMode: Bool

    var body: some View {
        VStack(spacing: 20) {
            Toggle(isOn: $isDarkMode) {
                Text("Dark Mode")
            }
            .padding()

            NavigationLink(destination: ContactInfoScreen()) {
                Text("Contact Info")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .navigationTitle("Settings")
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    @State static var isDarkMode = false

    static var previews: some View {
        SettingsScreen(isDarkMode: $isDarkMode)
    }
}