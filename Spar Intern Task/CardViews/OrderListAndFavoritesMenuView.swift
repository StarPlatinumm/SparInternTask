import SwiftUI

struct OrderListAndFavoritesMenuView: View {
    var body: some View {
        VStack {
            Button(action: {}, label: {
                Image("card-action-order-list")
                    .frame(width: 16, height: 16)
            })
            Button(action: {}, label: {
                Image("card-action-favorite")
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
