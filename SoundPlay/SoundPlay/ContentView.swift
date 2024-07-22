//
//  ContentView.swift
//  Ai animation
//
//  Created by jetz on 2024/07/21.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    let soundPlayer = SoundPlayer()
    var body: some View{
        ZStack{
            Image("background")
                .resizable()
                .aspectRatio(/*@START_MENU_TOKEN@*/CGSize(width: 16, height: 9)/*@END_MENU_TOKEN@*/, contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
            HStack {
                Button(action:{
                    soundPlayer.cymbalPlay()
                }){
                    ButtonImageView(imageName: "cymbal")
                }
                Button(action:{
                    soundPlayer.guitarPlay()
                }){
                    ButtonImageView(imageName: "guitar")
                }
            }
        }
    }
}


#Preview(windowStyle: .volumetric) {
    ContentView()
}
