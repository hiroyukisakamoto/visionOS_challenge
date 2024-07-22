import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @State private var isRotating = 0.0
    @State private var isDragging = false
    
    var body: some View {
        NavigationStack {
            Model3D(named: "Apple-vision-pro_3D_Model") { visionPro in
                visionPro
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(0.3)
                    .rotation3DEffect(.degrees(isRotating * 2), axis: (x: 5, y: -5, z: 10))
            } placeholder: {
                ProgressView()
            }
            .toolbar{
                ToolbarItem(placement: .bottomOrnament){
                    VStack {
                        Slider(value: $isRotating, in: 0...359, onEditingChanged: { editing in
                            if editing {
                                isDragging = true
                            } else {
                                isDragging = false
                                addInertia()
                            }
                        })
                        .frame(width: 360)
                        .padding()
                        Text("Rotate")
                    }
                }
            }
        }
    }
    
    private func addInertia() {
        guard isRotating > 10 else { return } // isRotatingが10以下の場合は何もしない
        withAnimation(Animation.easeOut(duration: 1.0)) {
            isRotating += 30.0 // ここで適切な慣性の量を設定
        }
    }
}

#Preview {
    ContentView()
}
