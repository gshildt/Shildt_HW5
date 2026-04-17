import SwiftUI

struct MainScreen: View {
    @Binding var isDarkMode: Bool
    @Binding var name: String
    @Binding var role: String
    @Binding var email: String
    @Binding var phone: String
    @Binding var profileImage: UIImage?

    var body: some View {
        Components.Scaffold(
            appBar: Components.AppBar(title: "Welcome"),
            content: {
                VStack(spacing: 20) {
                    Text("Welcome to the Profile App!")
                        .font(.title)

                    NavigationLink(destination: ProfileScreen(isDarkMode: $isDarkMode, name: $name, role: $role, email: $email, phone: $phone, profileImage: $profileImage)) {
                        Text("Go to Profile")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }

                    NavigationLink(destination: SettingsScreen(isDarkMode: $isDarkMode, name: $name, role: $role, email: $email, phone: $phone, profileImage: $profileImage)) {
                        Text("Settings")
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }

                    Button(action: {
                        isDarkMode.toggle()
                    }) {
                        Text("Toggle Dark Mode")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .padding()
            }
        )
    }
}

struct MainScreen_Previews: PreviewProvider {
    @State static var isDarkMode = false
    @State static var name = "John Doe"
    @State static var role = "Software Developer"
    @State static var email = "johndoe@example.com"
    @State static var phone = "+1234567890"
    @State static var profileImage: UIImage? = nil

    static var previews: some View {
        MainScreen(isDarkMode: $isDarkMode, name: $name, role: $role, email: $email, phone: $phone, profileImage: $profileImage)
    }
}

struct Components {
    struct Scaffold<Content: View>: View {
        let appBar: AppBar
        let content: Content

        init(appBar: AppBar, @ViewBuilder content: () -> Content) {
            self.appBar = appBar
            self.content = content()
        }

        var body: some View {
            VStack(spacing: 0) {
                appBar
                content
            }
        }
    }

    struct AppBar: View {
        let title: String

        var body: some View {
            ZStack {
                Color.blue
                    .ignoresSafeArea(edges: .top)

                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .frame(height: 60)
        }
    }
}
