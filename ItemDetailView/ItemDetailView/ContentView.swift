import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @Binding var showDetailView: Bool
    
    @State private var shoeSize: Double = 26.0
    @State private var sliderWidth: CGFloat = 0
    
    @State private var isRotating = 0.0
    // @State private var isDragging = false
    @State private var rotationAngle: Double = 22.5 // 初期角度を45度に設定

        
    let minSize: Double = 22.0
    let maxSize: Double = 29.0
    
    
    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .center,spacing: 64){
                Spacer()
                NavigationStack {
                    VStack(alignment:.leading, spacing: 64){
                        Spacer()
                        Button(action: {
                            showDetailView = false
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                        }
                        VStack(alignment:.center, spacing: 96){
                            Model3D(named: "sneaker_pegasustrail") {
                                model in model
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .rotation3DEffect(.degrees(rotationAngle + isRotating * 2), axis: (x: 1, y: 1, z: 0))
                            } placeholder: {
                                ProgressView()
                            }
                            VStack {
                                Slider(value: $isRotating, in: 0...359)
                                    .frame(width: 240)
                                    .padding()
                                Text("Rotate")
                            }
                        }
                        Spacer()
                    }
                }
                VStack(alignment: .leading, spacing: 24) {
                    Spacer()
                    Text("Nike Dunk Low Retro")
                        .font(Font.custom("SF Pro", size: 32).weight(.bold))
                    Text("Mens’s Shoe")
                        .font(Font.custom("SF Pro", size: 24).weight(.bold))
                    Text("£109.99")
                        .font(Font.custom("SF Pro", size: 32).weight(.bold))
                    Text("Created for the hardwood but taken to the streets, the Nike Dunk Low Retro returns with crisp overlays and original team colours. This basketball icon channels '80s vibes with premium leather in the upper that looks good and breaks in even better. Modern footwear technology helps bring the comfort into the 21st century.")
                        .font(Font.custom("SF Pro", size: 16).weight(.bold))
                        .lineSpacing(8)
                        .foregroundColor(.white)
                    Text("Select Size")
                        .font(Font.custom("SF Pro", size: 20).weight(.bold))
                        .foregroundColor(.white)
                    VStack(alignment:.leading, spacing: 40){
                        Slider(value: $shoeSize, in: minSize...maxSize, step: 0.5)
                            .frame(width: geometry.size.width / 4)
                            .background(Color.white.opacity(0.60))
                            .overlay(
                                GeometryReader { geometry in
                                    Color.clear
                                        .onAppear {
                                            sliderWidth = geometry.size.width
                                        }
                                }
                            )
                            .cornerRadius(46)
                        Text("\(shoeSize, specifier: "%.1f") cm")
                            .font(Font.custom("SF Pro", size: 12.09).weight(.bold))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.10))
                            .cornerRadius(20)
                            .position(x: getThumbPosition())
                            .frame(height:30)
                    }
                    HStack(spacing: 20) {
                        Button(action: {
                            print("tap")
                        }) {
                            Label("Add to Bag", systemImage: "bag")
                                .font(Font.custom("SF Pro", size: 17).weight(.bold))
                                .foregroundColor(.white)
                        }
                        Button(action: {
                            print("tap")
                        }) {
                            Label("Favorite", systemImage: "heart")
                                .font(Font.custom("SF Pro", size: 17).weight(.bold))
                                .foregroundColor(.white)
                        }
                    }
                    Spacer()
                }
                .frame(width: geometry.size.width / 3)
                Spacer()
            }
            .glassBackgroundEffect()
            
        }
    }
    func getThumbPosition() -> CGFloat {
        let percentage = (shoeSize - minSize) / (maxSize - minSize)
        return sliderWidth * CGFloat(percentage)
    }
}

#Preview {
    ContentView(showDetailView: .constant(true))
}
