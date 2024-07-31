import SwiftUI
import AVKit

struct HomeView: View {
    let videoArray = ["nikeAirmax"]

    let imageArray = ["kim-vladislav-i3ZzxAvgDKI-unsplash", "oskar-hagberg-1mMIpisWzn8-unsplash"]
    let textArray = [
        ("AIR JORDAN 5", "PURPLE GRAPES"),
        ("NIKE AIR MAX", "BLUE SKY")
    ]
    let headerArray = [
        ("kick check"),
        ("behind the design")
    ]
    
    @State private var isVideoPlayerPresented = false
    
    var body: some View {
        GeometryReader { geometry in
            TabView {
                ForEach(0..<imageArray.count, id: \.self) { index in
                    ZStack {
                        BackgroundImage(imageName: imageArray[index], geometry: geometry)
                        BackgroundVideo(videoName: videoArray[index], geometry: geometry)

                        
                        if index == 1 {
                            PlayButtonOverlay(isVideoPlayerPresented: $isVideoPlayerPresented)
                        }
                        
                        HeaderText(header: headerArray[index], geometry: geometry)
                        
                        VStack(alignment: .leading) {
                            TextOverlay(title: textArray[index].0, subtitle: textArray[index].1, geometry: geometry)
                        }
                        .frame(width: geometry.size.width)
                        .position(x: geometry.size.width / 4, y: geometry.size.height / 1.25)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .cornerRadius(46)
                    .overlay(
                        RoundedRectangle(cornerRadius: 46)
                            .inset(by: 0.50)
                            .stroke(.white, lineWidth: 0.50)
                    )
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .sheet(isPresented: $isVideoPlayerPresented) {
                VideoPlayerView()
            }
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
            .opacity(0.75)
    }
}

struct BackgroundVideo: View {
    let videoName: String
    let geometry: GeometryProxy
    
    var body: some View {
        if let url = Bundle.main.url(forResource: videoName, withExtension: "mov") {
            VideoPlayer(player: AVPlayer(url: url))
                .frame(width: geometry.size.width, height: geometry.size.height)
                .scaledToFill()
                .blur(radius: 5)
                .opacity(0.75)
                .onAppear {
                    AVPlayer(url: url).play()
                }
        } else {
            Text("ビデオファイルが見つかりません")
                .foregroundColor(.blue)
                .font(.title)
                .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

struct PlayButtonOverlay: View {
    @Binding var isVideoPlayerPresented: Bool
    
    var body: some View {
        Image(systemName: "play.fill")
            .resizable()
            .foregroundColor(.white)
            .frame(width: 250, height: 250)
            .opacity(0.5)
            .onTapGesture {
                isVideoPlayerPresented = true
            }
    }
}

struct HeaderText: View {
    let header: String
    let geometry: GeometryProxy
    
    var body: some View {
        Text(header.uppercased())
            .font(Font.custom("Impact", size: min(geometry.size.width, geometry.size.height) / 7.5))
            .foregroundColor(.white)
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

struct VideoPlayerView: View {
    var body: some View {
        GeometryReader { geometry in
            if let url = Bundle.main.url(forResource: "nikeAirmax", withExtension: "mov") {
                VideoPlayer(player: AVPlayer(url: url))
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .edgesIgnoringSafeArea(.all)
            } else {
                Text("ビデオファイルが見つかりません")
                    .foregroundColor(.blue)
                    .font(.title)
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
    }
}

#Preview {
    HomeView()
}
