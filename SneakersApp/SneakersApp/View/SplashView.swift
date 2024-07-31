import SwiftUI

struct ParentView: View {
    @State private var isSplashPresented = true
    
    var body: some View {
        ZStack {
            if isSplashPresented {
                SplashView(isPresented: $isSplashPresented)
            } else {
                TabBarView() // `HomeView` または他のメインコンテンツビューに置き換え
            }
        }
    }
}

struct SplashView: View {
    @Binding var isPresented: Bool
    @State private var slideIn = false
    @State private var scaleUp = false
    @State private var fadeOut = false
    
    var body: some View {
        ZStack() {
            ZStack() {
                Image("NikeLogo")
                    .opacity(slideIn ? 1 : 0) // 透明度を変更
                    .offset(x: slideIn ? 0 : -20) // 横方向の位置を変更
                    .animation(.easeInOut(duration: 1), value: slideIn)
                
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
            .animation(.easeInOut(duration: 0.5).delay(1), value: scaleUp)
            .opacity(fadeOut ? 0 : 1) // フェードアウト用の透明度
            .animation(.easeInOut(duration: 0.5), value: fadeOut)
            .onAppear {
                scaleUp = true // ビューが表示されたときにアニメーションを開始
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    slideIn = true // スケールアップアニメーションが完了した後にスライドインを開始
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    fadeOut = true // 5秒後にフェードアウトを開始
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    isPresented = false // フェードアウト後に`isPresented`をfalseに設定
                }
            }
        }
    }
}

#Preview {
    ParentView()
}
