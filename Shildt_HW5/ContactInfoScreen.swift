import SwiftUI
import PhotosUI

struct ContactInfoScreen: View {
    @Binding var isDarkMode: Bool
    @Binding var name: String
    @Binding var role: String
    @Binding var email: String
    @Binding var phone: String
    @Binding var profileImage: UIImage?

    @State private var isPhotoPickerPresented = false

    var body: some View {
        Components.Scaffold(
            appBar: Components.AppBar(title: "Edit Contact Info"),
            content: {
                VStack(spacing: 20) {
                    Text("Edit Contact Info")
                        .font(.largeTitle)
                        .padding()

                    TextField("Name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    TextField("Role", text: $role)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    TextField("Phone", text: $phone)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    if let image = profileImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .onTapGesture {
                                isPhotoPickerPresented = true
                            }
                    } else {
                        Text("No Profile Image")
                            .foregroundColor(.gray)
                            .onTapGesture {
                                isPhotoPickerPresented = true
                            }
                    }

                    Button(action: {
                        isPhotoPickerPresented = true
                    }) {
                        Text("Change Profile Picture")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .sheet(isPresented: $isPhotoPickerPresented) {
                        PhotoPicker(selectedImage: $profileImage)
                    }

                    Spacer()
                }
                .padding()
            }
        )
    }
}

struct PhotoPicker: UIViewControllerRepresentable {
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
        let parent: PhotoPicker

        init(_ parent: PhotoPicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            picker.dismiss(animated: true)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
}



