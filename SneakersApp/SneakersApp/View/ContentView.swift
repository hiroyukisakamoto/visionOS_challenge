import SwiftUI

struct ContentView: View {
    @State private var slideIn = false
    @State private var scaleUp = false
    
    var body: some View {
        ZStack() {
            SplashView()
        }
    }
}

#Preview {
    ContentView()
}
