import SwiftUI

struct ContentView: View {
    var body: some View {
        SplashParentView()
    }
}

#Preview {
    ContentView()
        .cornerRadius(46)
}

//struct ContentView: View {
//    @State private var showDetailView = false
//
//    var body: some View {
//        Button(action: {
//            showDetailView = true
//        }) {
//            Text("Go to Detail Page")
//                .font(.headline)
//                .padding()
//                .foregroundColor(.white)
//        }
//        .fullScreenCover(isPresented: $showDetailView) {
//            ItemDetailView(showDetailView: $showDetailView)
//        }
//    }
//}
