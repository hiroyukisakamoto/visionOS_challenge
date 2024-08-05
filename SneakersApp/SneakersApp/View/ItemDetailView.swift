import SwiftUI
import RealityKit
import RealityKitContent

struct ItemDetailView: View {
    @Binding var showDetailView: Bool

    @State private var shoeSize: Double = 26.0
    @Environment(\.cartItemCount) var cartItemCount: Binding<Int>
    let modelURL = URL(string: "https://developer.apple.com/augmented-reality/quick-look/models/nike-pegasus/sneaker_pegasustrail.usdz")!
    let minSize: Double = 22.0
    let maxSize: Double = 29.0
    
    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .center,spacing: 72){
                Spacer()
                Model3D(url: modelURL){
                    model in model.resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }.frame(width: 1280/1.75)
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
                    Slider(value: $shoeSize, in: minSize...maxSize, step: 0.5)
                        .frame(width: geometry.size.width / 5)
                        .background(Color(red: 1, green: 1, blue: 1).opacity(0.60))
                        .cornerRadius(46)
                    Text("\(shoeSize, specifier: "%.1f") cm")
                        .font(Font.custom("SF Pro", size: 12.09).weight(.bold))
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 6.36, leading: 0, bottom: 6.36, trailing: 0))
                        .cornerRadius(7.64)
                    HStack(spacing: 16) {
                        Button(action: {
                            cartItemCount.wrappedValue += 1
                        }) {
                            Label("Add to Bag", systemImage: "bag")
                                .font(Font.custom("SF Pro", size: 17).weight(.bold))
                                .foregroundColor(.white)
                        }
                        Button(action: {
                            cartItemCount.wrappedValue += 1
                        }) {
                            Label("Favorite", systemImage: "heart")
                                .font(Font.custom("SF Pro", size: 17).weight(.bold))
                                .foregroundColor(.white)
                        }
                    }
                    Spacer()
                }
                .frame(width: 350)
                Spacer()
            }
            .glassBackgroundEffect()
        }
    }
}

//#Preview {
//    ItemDetailView()
//}
