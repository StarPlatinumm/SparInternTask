import SwiftUI

struct MainView: View {
    @State private var isListView = false
    //    @State private var products: [Product] = [
    //        Product(id: 0, title: "Хэппи мил (липа)", price: 19.99, discount: 0.1, countryOfOrigin: "Франция 🇫🇷", rating: 4.2, reviews: 16, specialTag: Tag.new, imageName: "image0", inCart: 0),
    //        Product(id: 1, title: "Мясо единорога", price: 299.99, discount: 0.2, countryOfOrigin: "Япония 🇯🇵", rating: 4.5, reviews: 4, specialTag: Tag.lowPrice, imageName: "image1", inCart: 0),
    //        Product(id: 2, title: "Куриные рёбра", price: 39.99, discount: 0.15, countryOfOrigin: "Россия 🇷🇺", rating: 4.2, reviews: 7, specialTag: Tag.cardPrice, imageName: "image2", inCart: 0),
    //        Product(id: 3, title: "Не помидоры", price: 9.99, discount: nil, countryOfOrigin: "Россия 🇷🇺", rating: 4.0, reviews: 22, specialTag: nil, imageName: "image3", inCart: 0),
    //        Product(id: 4, title: "Запретные плоды", price: 999.99, discount: nil, countryOfOrigin: "Турция 🇹🇷", rating: 4.9, reviews: 14, specialTag: nil, imageName: "image4", inCart: 0)
    //    ]
    
    @StateObject private var viewModel = ProductViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button(action: {
                        isListView.toggle()
                    }, label: {
                        Image(isListView ? "list-icon" : "table-icon")
                            .frame(width: 40, height: 40)
                            .background(.sparGray)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    })
                    .padding(EdgeInsets(top: 2, leading: 8, bottom: 2, trailing: 8))
                    Spacer()
                }
                
                if isListView {
                    List {
                        ForEach(viewModel.products) { product in
                            ListCardView(product)
                        }
                    }
                    .listStyle(.inset)
                } else {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                            ForEach(viewModel.products) { product in
                                TableCardView(product)
                            }
                        }
                        .padding()
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchProducts()
        }
    }
}

#Preview {
    MainView()
}
