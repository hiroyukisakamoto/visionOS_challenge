import SwiftUI

struct ContentView: View {
    var body: some View {
        ParentView()
    }
}

#Preview {
    ContentView()
        .glassBackgroundEffect()
        .cornerRadius(46)
    // .opacity(0.975)
}
