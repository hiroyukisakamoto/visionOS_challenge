import SwiftUI

struct IdentifiableImage: Identifiable {
    let id = UUID()
    let name: String
}

struct SearchView: View {
    @State private var selectedImage: IdentifiableImage? = nil
    @State private var showDetailView = false
    
    let imageNames = [
        "image00001", "image00002", "image00003",
        "image00004", "image00005", "image00006",
        "image00007", "image00008", "image00009"
    ].map { IdentifiableImage(name: $0) }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(imageNames) { image in
                        Button(action: {
                            selectedImage = image
                        }) {
                            Image(image.name)
                                .resizable()
                                .aspectRatio(3/4, contentMode: .fill)
                                .frame(height: 200)
                                .cornerRadius(16)
                                .shadow(radius: 16)
                                .clipped()
                        }
                    }
                    // .fullScreenCover(isPresented: $showDetailView) {
                    // ItemDetailView(showDetailView: $showDetailView)
                    // }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(32)
            }
            .glassBackgroundEffect()
        }
    }
}

#Preview {
    SearchView()
}
