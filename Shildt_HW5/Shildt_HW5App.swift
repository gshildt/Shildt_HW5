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

    var body: some Scene {
        WindowGroup {
            MainScreen(isDarkMode: $isDarkMode)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
