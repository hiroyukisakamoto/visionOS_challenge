import SwiftUI
import AVKit
import UIKit

struct ClearBackgroundView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .clear
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
struct HomeView: View {
    @State private var isPlaying = false
    @State private var isTextVisible = true
    @State private var currentPage = 0
    @State private var isFullscreen = false
    
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
            VStack{
                Spacer()
                TabView(selection: $currentPage) {
                    ForEach(0..<imageArray.count, id: \.self) { index in
                        ZStack {
                            BackgroundImage(imageName: imageArray[index], geometry: geometry)
                            if index == 1 {
                                BackgroundVideo(videoName: videoArray[index], geometry: geometry, isPlaying: $isPlaying, isFullscreen: $isFullscreen)
                            }
                            HeaderButton(isPlaying: $isPlaying, isTextVisible: $isTextVisible, isFullscreen: $isFullscreen, header: headerArray[index], index: index)
                                .padding()
                                .position(x: geometry.size.width / 2, y:400)
                            
                            if isTextVisible || index != 1 {
                                HStack(){
                                    TextOverlay(title: textArray[index].0, subtitle: textArray[index].1, geometry: geometry)
                                        .frame(width: geometry.size.width)
                                        .position(x: geometry.size.width / 5, y: geometry.size.height / 1.25)
                                    Image("NikeLogo")
                                        .position(x: 640, y: 850)
                                        .scaleEffect(0.5)
                                        
                                }
                            }
                        }
                        //　.frame(width: geometry.size.width, height: geometry.size.height)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                Spacer()
            }
        }
    }
}

#Preview {
    HomeView()
}
