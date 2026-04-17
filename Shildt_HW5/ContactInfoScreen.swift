import SwiftUI

struct ContactInfoScreen: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Contact Information")
                .font(.title)

            Text("Email: johndoe@example.com")
            Text("Phone: +1234567890")
        }
        .navigationTitle("Contact Info")
    }
}

struct ContactInfoScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContactInfoScreen()
    }
}