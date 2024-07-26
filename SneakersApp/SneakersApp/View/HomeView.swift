import SwiftUI

struct HomeView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Text("KICK CHECK".uppercased())
                    .font(Font.custom("Impact", size: min(geometry.size.width, geometry.size.height) / 7.5)) // ウィンドウサイズに応じてフォントサイズを調整
                    .foregroundColor(.white)
                VStack(alignment: .leading) {
                    Text("AIR JORDAN 5".uppercased())
                        .font(Font.custom("Futura Condensed", size: min(geometry.size.width, geometry.size.height) / 15).weight(.medium))
                        .foregroundColor(.white)
                    Text("PURPLE GRAPES".uppercased())
                        .font(Font.custom("Futura Condensed", size: min(geometry.size.width, geometry.size.height) / 15).weight(.medium))
                        .foregroundColor(.white)
                        .offset(y: 15)
                }
                .frame(width: geometry.size.width)
                .position(x: -(geometry.size.width / 4) + (geometry.size.width / 2), y: geometry.size.height / 1.25)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(
                AsyncImage(url: URL(string: "https://images.unsplash.com/photo-1687019733490-31cb827f35c1?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"))
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .blur(radius: 5)
                    .opacity(0.75)
            )
            .background(.ultraThinMaterial)
            .cornerRadius(46)
            .overlay(
                RoundedRectangle(cornerRadius: 46)
                    .inset(by: 0.50)
                    .stroke(.white, lineWidth: 0.50)
            )
            
        }
    }
}

#Preview {
    HomeView()
}
