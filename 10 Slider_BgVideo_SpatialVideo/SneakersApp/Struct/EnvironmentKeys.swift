import SwiftUI

struct CartItemCountKey: EnvironmentKey {
    static let defaultValue: Binding<Int> = .constant(0)
}

extension EnvironmentValues {
    var cartItemCount: Binding<Int> {
        get { self[CartItemCountKey.self] }
        set { self[CartItemCountKey.self] = newValue }
    }
}
