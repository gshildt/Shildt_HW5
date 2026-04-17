//
//  Shildt_HW5App.swift
//  Shildt_HW5
//
//  Created by Greg Shildt on 4/17/26.
//

import SwiftUI
@main
struct ProfileAppScene: App {
    @State private var isDarkMode = false
    @State private var name = "John Doe"
    @State private var role = "Software Developer"
    @State private var email = "johndoe@example.com"
    @State private var phone = "+1234567890"
    @State private var profileImage: UIImage? = nil

    var body: some Scene {
        WindowGroup {
            MainScreen(
                isDarkMode: $isDarkMode,
                name: $name,
                role: $role,
                email: $email,
                phone: $phone,
                profileImage: $profileImage
            )
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
