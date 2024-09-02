import SwiftUI
import AVKit
import RealityKit

struct sample: View {
    @State private var player: AVPlayer?
    @State private var showFullScreen = false
    
    var body: some View {
        ZStack {
            if let player = player {
                CustomVideoPlayerTest(player: player)
                    .frame(width: 400, height: 400)
                    .clipShape(RoundedRectangle(cornerRadius: 23))
                    .onAppear {
                        player.play()
                        setupPlayerLooping()
                    }
            } else {
                Text("動画を読み込んでいます...")
            }
            
            Button(action: {
                playVideoFullScreen()
            }) {
                Text("")
                    .frame(width: 400, height: 400)
            }
            .opacity(0.0025)
        }
        .onAppear {
            loadVideo()
        }
        .fullScreenCover(isPresented: $showFullScreen) {
            FullScreenVideoPlayerTest(player: player)
        }
    }
    
    func loadVideo() {
        guard let url = Bundle.main.url(forResource: "video00001", withExtension: "mov") else {
            print("動画ファイルが見つかりません")
            return
        }
        
        player = AVPlayer(url: url)
    }
    
    func setupPlayerLooping() {
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player?.currentItem, queue: .main) { _ in
            player?.seek(to: .zero)
            player?.play()
        }
    }
    
    func playVideoFullScreen() {
        showFullScreen = true
        player?.play()
    }
}

struct CustomVideoPlayerTest: UIViewControllerRepresentable {
    let player: AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {}
}

struct FullScreenVideoPlayerTest: UIViewControllerRepresentable {
    let player: AVPlayer?
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = true
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {}
}

#Preview {
    sample()
}
