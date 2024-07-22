//
//  objectRotate_soundApp.swift
//  objectRotate_sound
//
//  Created by jetz on 2024/07/22.
//

import SwiftUI

@main
struct objectRotate_soundApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.windowStyle(.volumetric)

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
