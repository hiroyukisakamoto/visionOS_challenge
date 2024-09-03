//
//  CartView.swift
//  SneakersApp
//
//  Created by jetz on 2024/07/30.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        VStack(spacing: 50) {
            Text("カートの中身は空です")
                .font(.largeTitle)
            Label("", systemImage: "cart.fill")
                .font(.system(size: 50))
        }
    }
}

#Preview {
    AccountView()
}
