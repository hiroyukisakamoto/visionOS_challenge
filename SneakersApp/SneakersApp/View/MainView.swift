import SwiftUI

struct MainView : View {
    @State private var cartItemCount: Int = 0

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
    MainView()
}
