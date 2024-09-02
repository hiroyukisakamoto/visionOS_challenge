//
//  objectRotateApp.swift
//  objectRotate
//
//  Created by jetz on 2024/07/21.
//

import SwiftUI

@main
struct objectRotateApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.windowStyle(.volumetric)

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
