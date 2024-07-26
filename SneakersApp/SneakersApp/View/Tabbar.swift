import SwiftUI

struct Tabbar : View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            SplashView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            SplashView()
                .tabItem {
                    Label("Cart", systemImage: "cart.fill")
                }
            SplashView()
                .tabItem {
                    Label("My Account", systemImage: "person.fill")
                }
        }
    }
}
#Preview {
    Tabbar()
}
