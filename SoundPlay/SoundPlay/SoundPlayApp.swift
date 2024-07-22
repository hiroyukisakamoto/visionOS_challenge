//
//  SoundPlayApp.swift
//  SoundPlay
//
//  Created by jetz on 2024/07/21.
//

import SwiftUI

@main
struct SoundPlayApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.windowStyle(.volumetric)

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
