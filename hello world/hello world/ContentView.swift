import SwiftUI
import RealityKit

struct ContentView: View {
    
    var body: some View {
       
        Text("hello_worldApp")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .glassBackgroundEffect()
    }
}

#Preview {
    ContentView()
}
