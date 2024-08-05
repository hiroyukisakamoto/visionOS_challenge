//
//  HeaderButton.swift
//  SneakersApp
//
//  Created by jetz on 2024/08/02.
//

import SwiftUI

struct HeaderButton: View {
    @State private var showDetailView = false
    @State private var showItemDetail: Bool = false
    @Binding var isPlaying: Bool
    @Binding var isTextVisible: Bool
    
    let header: String
    let geometry: GeometryProxy
    let index: Int
    
    var body: some View {
        Button(action: {
            if index == 0 {
                showItemDetail = true
                showDetailView = true
            } else {
                isTextVisible.toggle()
                isPlaying.toggle()
            }
        }) {
            Text(header.uppercased())
                .font(Font.custom("Impact", size: min(geometry.size.width, geometry.size.height) / 7.5).weight(.medium))
                .foregroundColor(Color.white)
                .onTapGesture {
                    isPlaying.toggle()
                }
                .padding(EdgeInsets(
                    top: 10,
                    leading: 40,
                    bottom: 10,
                    trailing: 40
                ))
        }
        .fullScreenCover(isPresented: $showDetailView) {
            ItemDetailView(showDetailView: $showDetailView)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
