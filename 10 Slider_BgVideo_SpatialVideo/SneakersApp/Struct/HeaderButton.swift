import SwiftUI

struct HeaderButton: View {
    @Binding var isPlaying: Bool
    @Binding var isTextVisible: Bool
    @Binding var isFullscreen: Bool
    
    let header: String
    let index: Int
    
    @State private var buttonPosition: CGPoint = .zero
    @Binding var showDetailView: Bool// ItemDetailViewを表示するための状態変数
    
    
    var body: some View {
        GeometryReader { geometry in
            Button(action: {
                if index == 0 {
                    showDetailView = true
                } else {
                    isTextVisible.toggle()
                    isPlaying.toggle()
                    isFullscreen.toggle()
                }
            }) {
                Text(header.uppercased())
                    .font(Font.custom("Impact", size: min(geometry.size.width, geometry.size.height) / 7.5).weight(.medium))
                    .foregroundColor(Color.white)
                    .padding(EdgeInsets(top: 10, leading: 40, bottom: 10, trailing: 40))
            }
            .buttonStyle(PlainButtonStyle())
            .background(GeometryReader { geo in
                Color.clear.preference(key: ViewPositionKey.self, value: geo.frame(in: .global).origin)
            })
            .onPreferenceChange(ViewPositionKey.self) { pos in
                self.buttonPosition = pos
                print("Button position: \(pos)")
            }
            .fullScreenCover(isPresented: $showDetailView) {
                ItemDetailView(showDetailView: $showDetailView)  // ItemDetailViewをシートとして表示
            }
        }
    }
}

struct ViewPositionKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero
    
    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
        value = nextValue()
    }
}
