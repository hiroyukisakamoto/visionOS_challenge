//
//  TextOverlay.swift
//  SneakersApp
//
//  Created by jetz on 2024/08/01.
//

import SwiftUI

struct TextOverlay: View {
    let title: String
    let subtitle: String
    let geometry: GeometryProxy
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title.uppercased())
                .font(Font.custom("Futura Condensed", size: min(geometry.size.width, geometry.size.height) / 20).weight(.medium))
                .foregroundColor(.white)
            Text(subtitle.uppercased())
                .font(Font.custom("Futura", size: min(geometry.size.width, geometry.size.height) / 15).weight(.medium))
                .foregroundColor(.white)
                .offset(y: 15)
        }
    }
}
