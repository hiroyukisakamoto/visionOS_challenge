//
//  BackgroundImage.swift
//  SneakersApp
//
//  Created by jetz on 2024/08/01.
//

import SwiftUI

struct BackgroundImage: View {
    let imageName: String
    let geometry: GeometryProxy
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: geometry.size.width, height: geometry.size.height)
            .scaledToFill()
            .blur(radius: 10)
    }
}
