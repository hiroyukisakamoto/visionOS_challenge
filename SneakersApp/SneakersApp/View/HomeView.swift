import SwiftUI
import AVKit

struct HomeView: View {
    let videoArray = [
        (""),
        ("nikeAirmax")
    ]
    let imageArray = [
        ("kim-vladislav-i3ZzxAvgDKI-unsplash"), ("oskar-hagberg-1mMIpisWzn8-unsplash")
    ]
    let headerArray = [
        ("kick check"),
        ("behind the scene")
    ]
    let textArray = [
        ("AIR JORDAN 5", "PURPLE GRAPES"),
        ("NIKE AIR MAX", "Dynamic Land")
    ]
    
    @State private var isVideoPlayerPresented = false
    @State private var isTextVisible = true
    @State private var isPlaying = false

    var body: some View {
        GeometryReader { geometry in
            TabView {
                ForEach(0..<imageArray.count, id: \.self) { index in
                    ZStack {
                        BackgroundImage(imageName: imageArray[index], geometry: geometry)
                        if index == 1 {
                            BackgroundVideo(videoName: videoArray[index], geometry: geometry, isPlaying: $isPlaying)
                        }
                        if isTextVisible {
                            HeaderText(header: headerArray[index], geometry: geometry, isPlaying: $isPlaying)
                                .padding(40)
                                .contentShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                                .hoverEffect(.highlight)
                                .onTapGesture {
                                    if index == 1 {
                                        isTextVisible.toggle()
                                        isPlaying.toggle()  // 追加
                                    }
                                }
                        } else if index != 1 {
                            HeaderText(header: headerArray[index], geometry: geometry, isPlaying: $isPlaying)
                                .padding(40)
                                .contentShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                                .hoverEffect(.highlight)
                        }
                        
                        if isTextVisible {
                            VStack(alignment: .leading) {
                                TextOverlay(title: textArray[index].0, subtitle: textArray[index].1, geometry: geometry)
                            }
                            .frame(width: geometry.size.width)
                            .position(x: geometry.size.width / 4, y: geometry.size.height / 1.25)
                        } else if index != 1 {
                            VStack(alignment: .leading) {
                                TextOverlay(title: textArray[index].0, subtitle: textArray[index].1, geometry: geometry)
                            }
                            .frame(width: geometry.size.width)
                            .position(x: geometry.size.width / 4, y: geometry.size.height / 1.25)
                        }
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .overlay(
                        RoundedRectangle(cornerRadius: 46)
                            .inset(by: 0.50)
                            .stroke(.white, lineWidth: 0.50)
                    )
                }
            }
            .tabViewStyle(PageTabViewStyle())
        }
    }
}

struct BackgroundImage: View {
    let imageName: String
    let geometry: GeometryProxy
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: geometry.size.width, height: geometry.size.height)
            .scaledToFill()
            .blur(radius: 5)
    }
}

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
                }
                .onChange(of: isPlaying) { newValue in  // 追加
                    if newValue {
                        player?.play()
                    } else {
                        player?.pause()
                    }
                }
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

struct HeaderText: View {
    let header: String
    let geometry: GeometryProxy
    @State private var isHovered: Bool = false
    @Binding var isPlaying: Bool  // 追加
    
    var body: some View {
        Text(header.uppercased())
            .font(Font.custom("Impact", size: min(geometry.size.width, geometry.size.height) / 7.5))
            .onHover { hover in
                isHovered = hover
            }
            .foregroundColor(isHovered ? .black : .white)
            .onTapGesture {  // 追加
                isPlaying.toggle()
            }
    }
}

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

#Preview {
    HomeView()
}
