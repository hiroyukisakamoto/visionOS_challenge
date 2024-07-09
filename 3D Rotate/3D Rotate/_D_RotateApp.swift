//
//  _D_RotateApp.swift
//  3D Rotate
//
//  Created by jetz on 2024/07/10.
//

import SwiftUI

@main
struct _D_RotateApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.windowStyle(.volumetric)

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
