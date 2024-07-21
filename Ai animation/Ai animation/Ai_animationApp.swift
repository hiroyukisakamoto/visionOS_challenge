//
//  Ai_animationApp.swift
//  Ai animation
//
//  Created by jetz on 2024/07/21.
//

import SwiftUI

@main
struct Ai_animationApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.windowStyle(.volumetric)

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
