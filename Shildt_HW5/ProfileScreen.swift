import SwiftUI
import PhotosUI

struct ProfileScreen: View {
    @Binding var isDarkMode: Bool
    @Binding var name: String
    @Binding var role: String
    @Binding var email: String
    @Binding var phone: String
    @Binding var profileImage: UIImage?
    @State private var isImagePickerPresented: Bool = false

    var body: some View {
        Components.Scaffold(
            appBar: Components.AppBar(title: "Profile"),
            content: {
                VStack(spacing: 20) {
                    if let profileImage = profileImage {
                        Image(uiImage: profileImage)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                    } else {
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 100, height: 100)
                    }

                    Text(name)
                        .font(.title)
                        .fontWeight(.bold)

                    Text(role)
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    Text("Email: \(email)")
                        .font(.body)

                    Text("Phone: \(phone)")
                        .font(.body)

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

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .photoLibrary
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            picker.dismiss(animated: true)
        }
    }
}
