import SwiftUI
import AVKit

struct HomeView: View {
    @State private var isPlaying = false
    @State private var isTextVisible = true
    
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
    
    var body: some View {
        GeometryReader { geometry in
            TabView {
                ForEach(0..<imageArray.count, id: \.self) { index in
                    ZStack {
                        BackgroundImage(imageName: imageArray[index], geometry: geometry)
                        if index == 1 {
                            BackgroundVideo(videoName: videoArray[index], geometry: geometry, isPlaying: $isPlaying)
                        }
                        HeaderButton(isPlaying: $isPlaying, isTextVisible: $isTextVisible, header: headerArray[index], geometry: geometry, index: index)
                            .padding(40)
                        
                        if isTextVisible || index != 1 {
                            VStack(alignment: .leading) {
                                TextOverlay(title: textArray[index].0, subtitle: textArray[index].1, geometry: geometry)
                            }
                            .frame(width: geometry.size.width)
                            .position(x: geometry.size.width / 4, y: geometry.size.height / 1.25)
                        }
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .glassBackgroundEffect()
                }
            }
            .tabViewStyle(PageTabViewStyle())
        }
    }
}
