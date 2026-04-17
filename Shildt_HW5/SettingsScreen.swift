import SwiftUI

struct SettingsScreen: View {
    @Binding var isDarkMode: Bool
    @Binding var name: String
    @Binding var role: String
    @Binding var email: String
    @Binding var phone: String
    @Binding var profileImage: UIImage?

    var body: some View {
        VStack(spacing: 20) {
            NavigationLink(destination: ContactInfoScreen(isDarkMode: $isDarkMode, name: $name, role: $role, email: $email, phone: $phone, profileImage: $profileImage)) {
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
    static var isDarkMode = Binding.constant(false)
    static var name = Binding.constant("John Doe")
    static var role = Binding.constant("Software Developer")
    static var email = Binding.constant("johndoe@example.com")
    static var phone = Binding.constant("+1234567890")
    static var profileImage = Binding.constant(nil as UIImage?)

    static var previews: some View {
        SettingsScreen(isDarkMode: isDarkMode, name: name, role: role, email: email, phone: phone, profileImage: profileImage)
    }
}
