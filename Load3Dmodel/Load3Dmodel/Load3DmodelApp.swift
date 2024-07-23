//
//  Load3DmodelApp.swift
//  Load3Dmodel
//
//  Created by jetz on 2024/07/23.
//

import SwiftUI

@main
struct Load3DmodelApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.windowStyle(.volumetric)

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
