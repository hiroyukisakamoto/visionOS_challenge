import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    let modelURL = URL(string: "https://developer.apple.com/augmented-reality/quick-look/models/cosmonaut/CosmonautSuit_en.reality")!
    var body: some View {
        let soundPlayer = SoundPlayer()
        Model3D(url: modelURL){
            model in model.resizable()
                .aspectRatio(contentMode: .fit)
            //　.scaleEffect(0.5)
                .phaseAnimator([false,true]){
                    cosmonaut , roate in cosmonaut
                        .rotation3DEffect(.degrees(roate ? 720:0), axis:(x:45,y:45,z:45))
                } animation : {
                    rotate in
                        .easeInOut(duration:4)
                }
        } placeholder: {
            ProgressView()
        }
        .onAppear {
            soundPlayer.musicPlay()
        }
    }
}
#Preview {
    ContentView()
}
