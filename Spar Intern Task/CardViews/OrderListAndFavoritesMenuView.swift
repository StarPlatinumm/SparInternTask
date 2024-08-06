import SwiftUI

struct OrderListAndFavoritesMenuView: View {
    @State private var isFavoriteTapped = false
    
    var body: some View {
        VStack {
            Button(action: {}, label: {
                Image("order-list")
                    .frame(width: 16, height: 16)
            })
            Button(action: { isFavoriteTapped.toggle() }, label: {
                Image(isFavoriteTapped ? "heart-filled" : "heart-empty")
                    .frame(width: 16, height: 16)
            })
        }
        .padding(8)
        .background(.white)
        .opacity(0.9)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    OrderListAndFavoritesMenuView()
}
