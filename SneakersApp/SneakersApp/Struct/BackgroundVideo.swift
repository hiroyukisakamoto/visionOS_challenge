import SwiftUI
import AVKit

struct BackgroundVideo: View {
    let videoName: String
    let geometry: GeometryProxy
    @State private var player: AVPlayer?
    @State private var looper: AVPlayerLooper?
    @Binding var isPlaying: Bool
    @Binding var isFullscreen: Bool
    
    var body: some View {
        if let url = Bundle.main.url(forResource: videoName, withExtension: "mov") {
            AVPlayerControllerRepresented(player: player)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .blur(radius: isFullscreen ? 0 : 5)
                .edgesIgnoringSafeArea(isFullscreen ? .all : [])
                .onAppear {
                    let playerItem = AVPlayerItem(url: url)
                    player = AVQueuePlayer(playerItem: playerItem)
                    looper = AVPlayerLooper(player: player as! AVQueuePlayer, templateItem: playerItem)
                    player?.isMuted = true
                    player?.play()
                }
                .onDisappear {
                    player?.pause()
                }
                .onChange(of: isFullscreen) { oldValue, newValue in
                    player?.isMuted = !newValue
                }
        } else {
            Text("ビデオファイルが見つかりません")
                .foregroundColor(.blue)
                .font(.title)
                .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

struct AVPlayerControllerRepresented: UIViewRepresentable {
    var player: AVPlayer?
    
    func makeUIView(context: Context) -> UIView {
        return PlayerUIView(player: player)
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        if let playerUIView = uiView as? PlayerUIView {
            playerUIView.updatePlayer(player)
        }
    }
}

class PlayerUIView: UIView {
    private var playerLayer: AVPlayerLayer?
    
    init(player: AVPlayer?) {
        super.init(frame: .zero)
        setupPlayerLayer(player: player)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupPlayerLayer(player: AVPlayer?) {
        playerLayer?.removeFromSuperlayer()
        
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.videoGravity = .resizeAspectFill
        playerLayer?.frame = bounds
        
        if let playerLayer = playerLayer {
            layer.addSublayer(playerLayer)
        }
    }
    
    func updatePlayer(_ player: AVPlayer?) {
        playerLayer?.player = player
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer?.frame = bounds
    }
}
