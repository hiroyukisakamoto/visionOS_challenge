import SwiftUI
import RealityKit
import RealityKitContent

struct ItemDetailView: View {
    let modelURL = URL(string: "https://developer.apple.com/augmented-reality/quick-look/models/nike-pegasus/sneaker_pegasustrail.usdz")!
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                HStack(alignment: .center,spacing: 24){
                    Model3D(url: modelURL){
                        model in model.resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    VStack(alignment: .leading, spacing: 24) {
                        Text("Nike Dunk Low Retro")
                            .font(Font.custom("SF Pro", size: 31.69).weight(.bold))
                            .lineSpacing(36.98)
                        Text("Mens’s Shoe")
                            .font(Font.custom("SF Pro", size: 11.23).weight(.bold))
                            .lineSpacing(14.53)
                        Text("£109.99")
                            .font(Font.custom("SF Pro", size: 15).weight(.bold))
                            .lineSpacing(20)
                        Text("Created for the hardwood but taken to the streets, the Nike Dunk Low Retro returns with crisp overlays and original team colours. This basketball icon channels '80s vibes with premium leather in the upper that looks good and breaks in even better. Modern footwear technology helps bring the comfort into the 21st century.")
                            .font(Font.custom("SF Pro", size: 12).weight(.bold))
                            .lineSpacing(16)
                            .foregroundColor(Color(red: 1, green: 1, blue: 1).opacity(0.96))
                        Text("Select Size")
                            .font(Font.custom("SF Pro", size: 11.23).weight(.bold))
                            .lineSpacing(14.53)
                            .foregroundColor(Color(red: 1, green: 1, blue: 1).opacity(0.96))
                        ZStack() {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 288, height: 16)
                                .background(Color(red: 0, green: 0, blue: 0).opacity(0.10))
                                .cornerRadius(100)
                                .offset(x: 0, y: 0)
                            Ellipse()
                                .foregroundColor(.clear)
                                .frame(width: 160, height: 40)
                                .offset(x: -1, y: 0)
                            HStack(spacing: 0) {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 12, height: 12)
                                    .background(.white)
                                    .cornerRadius(100)
                            }
                            .padding(2)
                            .frame(width: 151, height: 16)
                            .background(Color(red: 1, green: 1, blue: 1).opacity(0.60))
                            .cornerRadius(100)
                            .offset(x: -68.50, y: 0)
                        }
                        .cornerRadius(80)
                        Text("26.0")
                            .font(Font.custom("SF Pro", size: 12.09).weight(.bold))
                            .lineSpacing(15.27)
                            .foregroundColor(Color(red: 1, green: 1, blue: 1).opacity(0.96))
                            .padding(EdgeInsets(top: 6.36, leading: 0, bottom: 6.36, trailing: 0))
                            .frame(width: 56, height: 28.73)
                            .cornerRadius(7.64)
                        HStack(spacing: 4) {
                            Text("Add to Bag")
                                .font(Font.custom("SF Pro", size: 17).weight(.bold))
                                .lineSpacing(22)
                                .foregroundColor(Color(red: 1, green: 1, blue: 1).opacity(0.96))
                                .cornerRadius(100)
                                .glassBackgroundEffect()
                            Text("Favorite")
                                .font(Font.custom("SF Pro", size: 17).weight(.bold))
                                .lineSpacing(22)
                                .foregroundColor(Color(red: 1, green: 1, blue: 1).opacity(0.96))
                                .glassBackgroundEffect()
                        }
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                        .frame(width: 147, height: 44)
                        .cornerRadius(100)
                    }
                }
                Spacer()
            }
        }
        .glassBackgroundEffect()
    }
}

#Preview {
    ItemDetailView()
}
