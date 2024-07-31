import SwiftUI

struct TabBarView : View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            CartView()
                .tabItem {
                    Label("Cart", systemImage: "cart.fill")
                }
            AccountView()
                .tabItem {
                    Label("My Account", systemImage: "person.fill")
                }
        }
    }
}

#Preview {
    TabBarView()
}
