//
//  ItemDetailViewApp.swift
//  ItemDetailView
//
//  Created by jetz on 2024/08/06.
//

import SwiftUI

@main
struct ItemDetailViewApp: App {
    @State private var showDetailView = true

    var body: some Scene {
        WindowGroup {
            ContentView(showDetailView: $showDetailView)
        }
    }
}
