//
//  SplashApp.swift
//  Splash
//
//  Created by jetz on 2024/07/25.
//

import SwiftUI

@main
struct SplashApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.windowStyle(.volumetric)

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
