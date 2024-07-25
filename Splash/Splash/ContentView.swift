import SwiftUI

struct ContentView: View {
    @State private var slideIn = false
    @State private var scaleUp = false
    
    var body: some View {
        ZStack() {
            ZStack() {
                Image("NikeLogo")
                    .opacity(slideIn ? 1 : 0) // 透明度を変更
                    .offset(x: slideIn ? 0 : -20) // 横方向の位置を変更
                    .animation(.easeInOut(duration: 1), value: slideIn) // アニメーションを適用
                
            }
            .frame(width: 1280, height: 720)
            .background(Color(red: 1, green: 0, blue: 0.08).opacity(0.9))
            .cornerRadius(46)
            .overlay(
                RoundedRectangle(cornerRadius: 46)
                    .inset(by: 0.50)
                    .stroke(.white, lineWidth: 1)
            )
            .scaleEffect(scaleUp ? 1 : 0) // 初期スケールを0に設定
            .animation(.easeInOut(duration: 0.5).delay(1), value: scaleUp) // スケールアニメーションを適用
            .onAppear {
                scaleUp = true // ビューが表示されたときにアニメーションを開始
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    slideIn = true // スケールアップアニメーションが完了した後にスライドインを開始
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
