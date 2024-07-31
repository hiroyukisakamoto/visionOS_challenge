import SwiftUI

struct SearchView: View {
    let imageNames = [
        "image00001", "image00002", "image00003",
        "image00004", "image00005", "image00006",
        "image00007", "image00008", "image00009"
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(imageNames, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .aspectRatio(3/4, contentMode: .fill)
                        .cornerRadius(16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .shadow(radius: 16)
                }
            }
            .padding(32)
        }
        // .navigationTitle("EC Gallery")
        .glassBackgroundEffect()
    }
}

#Preview {
    SearchView()
}
