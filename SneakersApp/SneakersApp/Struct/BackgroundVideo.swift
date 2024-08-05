//
//  BackgroundVideo.swift
//  SneakersApp
//
//  Created by jetz on 2024/08/01.
//

import SwiftUI
import AVKit

struct BackgroundVideo: View {
    let videoName: String
    let geometry: GeometryProxy
    @State private var player: AVPlayer?
    @State private var looper: AVPlayerLooper?
    @Binding var isPlaying: Bool
    
    var body: some View {
        if let url = Bundle.main.url(forResource: videoName, withExtension: "mov") {
            VideoPlayer(player: player)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .scaledToFill()
                .blur(radius: 5)
                .onAppear {
                    let playerItem = AVPlayerItem(url: url)
                    player = AVQueuePlayer(playerItem: playerItem)
                    looper = AVPlayerLooper(player: player as! AVQueuePlayer, templateItem: playerItem)
                    player?.isMuted = true
                    player?.play()
                }
            //                .onChange(of: isPlaying) { newValue in
            //                    if newValue {
            //                        player?.play()
            //                    } else {
            //                        player?.pause()
            //                    }
            //                }
                .onDisappear {
                    player?.pause()
                }
        } else {
            Text("ビデオファイルが見つかりません")
                .foregroundColor(.blue)
                .font(.title)
                .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}
