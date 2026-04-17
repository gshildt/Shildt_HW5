import SwiftUI

struct ProfileScreen: View {
    @Binding var isDarkMode: Bool

    var body: some View {
        VStack(spacing: 20) {
            Circle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)

            Text("John Doe")
                .font(.title)
                .fontWeight(.bold)

            Text("Software Developer")
                .font(.subheadline)
                .foregroundColor(.gray)

            Button(action: {
                // Navigate back to the home screen
                isDarkMode.toggle()
            }) {
                Text("Back to Home")
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .navigationTitle("Profile")
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    @State static var isDarkMode = false

    static var previews: some View {
        ProfileScreen(isDarkMode: $isDarkMode)
    }
}