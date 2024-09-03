//
//  CartView.swift
//  SneakersApp
//
//  Created by jetz on 2024/07/30.
//

import SwiftUI

struct CartView: View {
    var body: some View {
        VStack(spacing: 50) {
            Text("Taro Satoh")
                .font(.largeTitle)
            Label("", systemImage: "person.fill")
                .font(.system(size: 50))
        }
        .frame(width: 1280, height: 720)
        .glassBackgroundEffect()
    }
}

#Preview {
    CartView()
}
