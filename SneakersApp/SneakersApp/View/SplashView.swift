import SwiftUI

struct SplashParentView: View {
    @State private var isSplashPresented = true
    
    var body: some View {
        ZStack {
            if isSplashPresented {
                SplashView(isPresented: $isSplashPresented)
            } else {
                MainView()
                // `HomeView` または他のメインコンテンツビューに置き換え
            }
        }
    }
}

struct SplashView: View {
    @Binding var isPresented: Bool
    @State private var slideIn = false
    @State private var scaleUp = false
//    @State private var fadeOut = false
    @State private var isFlashing = false
    
    
    var body: some View {
        ZStack() {
            ZStack() {
                Image("NikeLogo")
                    .opacity(slideIn ? 1 : 0) // 透明度を変更
                    .offset(x: slideIn ? 0 : -20) // 横方向の位置を変更
                    .animation(.easeInOut(duration: 1), value: slideIn)
                    .opacity(isFlashing ? 0 : 1.0) // 透明度を0.2から1.0の間で変化させます
                    .animation(
                        Animation.easeInOut(duration: 0.02)
                            .repeatCount(10,autoreverses: true) // 永続的に繰り返し、自動で反転
                    )
                    .onAppear {
                        isFlashing = true // ビューが表示されたらアニメーションを開始
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            isFlashing = false
                        }
                    }
                
            }
            .frame(width: 1280, height: 720)
            .background(Color(red: 1, green: 0, blue: 0.08).opacity(0.9))
            .scaleEffect(scaleUp ? 1 : 0) // 初期スケールを0に設定
            .animation(.easeInOut(duration: 0.2).delay(1), value: scaleUp)
//            .opacity(fadeOut ? 0 : 1) // フェードアウト用の透明度
//            .animation(.easeInOut(duration: 0.75), value: fadeOut)
            .onAppear {
                scaleUp = true // ビューが表示されたときにアニメーションを開始
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    slideIn = true // スケールアップアニメーションが完了した後にスライドインを開始
                }
//                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
//                    fadeOut = true // 5秒後にフェードアウトを開始
//                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    isPresented = false // フェードアウト後に`isPresented`をfalseに設定
                }
            }
        }
    }
}

#Preview {
    SplashParentView()
}
