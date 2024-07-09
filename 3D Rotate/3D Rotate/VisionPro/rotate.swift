import SwiftUI
import RealityKit

struct AVP3dRotate: View {
    @State private var isRotating = 0.0
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
                        Slider(value: $isRotating, in: 0...359)
                            .frame(width: 360)
                            .padding()
                        Text("rotationw bar")
                    }
                }
            }
        }
    }
}

#Preview {
    AVP3dRotate()
}
