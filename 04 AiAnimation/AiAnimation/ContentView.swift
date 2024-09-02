import SwiftUI
import RealityKit

struct ContentView : View {
    @State private var isRotating = false
    
    var body: some View {
        ZStack{
            ZStack{
                Image("11_shadow").scaleEffect(0.6)
                Image("10_icon-bg").scaleEffect(0.5)
                
                
                Image("06_blue-right")
                    .rotationEffect(.degrees(isRotating ?  -360 : 420))
                    .hueRotation(.degrees(isRotating ? 720 : -50))
                    .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: isRotating ? -5 : 15))
                    .scaleEffect(0.5).blendMode(.colorBurn)
                
                Image("07_blue-middle").blur(radius: 25).scaleEffect(0.5)
                    .rotationEffect(.degrees(isRotating ?  30 : -420))
                    .hueRotation(.degrees(isRotating ? 0 : 720))
                    .rotation3DEffect(.degrees(15), axis:(x:1, y:5, z:1))
                
                Image("09_pink-top")
                
                Image("08_pink-left").scaleEffect(0.5)
                    .rotationEffect(.degrees(isRotating ?  30 : -420))
                    .hueRotation(.degrees(isRotating ? 0 : 720))
                
                
                Image("05_intersect")
                    .rotationEffect(.degrees(isRotating ?  30 : -420))
                    .hueRotation(.degrees(isRotating ? 0 : 720))
                    .rotation3DEffect(.degrees(15), axis:(x:1, y:5, z:1))
                
                Image("03_green-left").scaleEffect(0.5).blur(radius: 25).opacity(0.5).blendMode(.colorBurn)
                    .rotationEffect(.degrees(isRotating ?  30 : -420))
                    .hueRotation(.degrees(isRotating ? 0 : 720))
                    .rotation3DEffect(.degrees(15), axis:(x:1, y:5, z:1))
                
                Image("04_green-left").scaleEffect(0.5).blur(radius: 25)
                    .rotationEffect(.degrees(isRotating ?  30 : -420))
                    .hueRotation(.degrees(isRotating ? 0 : 720))
                    .rotation3DEffect(.degrees(15), axis:(x:1, y:5, z:1))
                
                Image("02_pink-bottom").blendMode(.multiply).opacity(0.25)
                    .rotationEffect(.degrees(isRotating ?  30 : -420))
                    .hueRotation(.degrees(isRotating ? 0 : 720))
                    .rotation3DEffect(.degrees(15), axis:(x:1, y:5, z:1))
            }
            
            .blendMode(isRotating ? .hardLight : .difference )
            
            Image("01_highlight")
                .rotationEffect(.degrees(isRotating ?  30 : -420))
                .hueRotation(.degrees(isRotating ? 0 : 720))
                .blendMode(.overlay)
                .onAppear{
                    withAnimation(.easeInOut(duration: 12).repeatForever(autoreverses: false)){
                        isRotating.toggle()
                    }
                }
        }
//        .scaleEffect(0.4)
//        .frame(width: 60, height: 60)
    }
}
#Preview {
    ContentView()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
