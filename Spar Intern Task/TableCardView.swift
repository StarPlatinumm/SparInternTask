import SwiftUI

struct TableCardView: View {
    //    @State private var products: [Product] = [
    //        Product(id: 0, title: "Хэппи мил (липа)", price: 19.99, discount: 0.1, countryOfOrigin: "Франция 🇫🇷", rating: 4.2, reviews: 16, specialTag: Tag.new, imageName: "image0"),
    //        Product(id: 1, title: "Мясо единорога", price: 299.99, discount: 0.2, countryOfOrigin: "Япония 🇯🇵", rating: 4.5, reviews: 4, specialTag: Tag.lowPrice, imageName: "image1"),
    //        Product(id: 2, title: "Куриные рёбра", price: 39.99, discount: 0.15, countryOfOrigin: nil, rating: 4.2, reviews: 7, specialTag: Tag.cardPrice, imageName: "image2"),
    //        Product(id: 3, title: "Не помидоры", price: 9.99, discount: nil, countryOfOrigin: "Россия 🇷🇺", rating: 4.0, reviews: 22, specialTag: nil, imageName: "image3"),
    //        Product(id: 4, title: "Запретные плоды", price: 999.99, discount: nil, countryOfOrigin: "Турция 🇹🇷", rating: 4.9, reviews: 14, specialTag: nil, imageName: "image4")
    //    ]
    
    private var product: Product = Product(id: 0, title: "Хэппи мил (липа)", price: 19.99, discount: 0.1, countryOfOrigin: "Франция 🇫🇷", rating: 4.2, reviews: 16, specialTag: Tag.new, imageName: "image0", inCart: 0)
    
    var body: some View {
        ZStack {
            // ЗАДНИК
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.sparWhite)
            
            // ОСНОВНОЙ КОНТЕНТ
            VStack {
                // фото товара
                Image(product.imageName)
                
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 8) {
                        // рейтинг
                        HStack(alignment: .bottom, spacing: 4) {
                            Image("star-rating")
                            Text(String(format: "%.1f", product.rating))
                                .font(.caption)
                            if let discount = product.discount {
                                Spacer()
                                Text(String(format: "%.0f", discount * 100) + "%")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("discountRed"))
                                
                            }
                        }
                        
                        // описание
                        Text(product.title)
                            .font(.caption)
                            .opacity(0.8)
                        
                        // страна-производитель
                        Text(product.countryOfOrigin)
                            .font(.caption)
                            .opacity(0.6)
                    }
                    
                    Spacer()
                    
                    HStack {
                        // цена
                        VStack(alignment: .leading) {
                            Text("\(String(format: "%.2f", product.price)) р/кг")
                                .font(.caption)
                                .fontWeight(.bold)
                            // старая цена (если есть скидка)
                            if let discount = product.discount {
                                Text(String(format: "%.2f", product.price * (1 - discount)))
                                    .font(.caption)
                                    .strikethrough()
                            }
                        }
                        Spacer()
                        
                        // кнопка добавления в корзину
                        Button(action: {}, label: {
                            Image("cart")
                                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                                .background(Color.green)
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                        })
                    }
                }
            }
            .padding(4)
            VStack {
                HStack(alignment: .top) {
                    // АКЦИЯ
                    if let specialTag = product.specialTag {
                        TopLeftBadgeView(specialTag)
                    }
                    Spacer()
                    // ПРАВЫЕ КНОПКИ
                    TopRightButtonsView()
                }
                Spacer()
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color.gray, radius: 4, x: 0, y: 2)
    }
}

struct TopRightButtonsView: View {
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

struct TopLeftBadgeView: View {
    private let badgeText: String
    private let badgeColor: Color
    
    init(_ specialTag: Tag) {
        badgeText = specialTag.rawValue
        switch specialTag {
        case .lowPrice:
            badgeColor = Color("tagRed")
        case .cardPrice:
            badgeColor = Color("tagGreen")
        case .new:
            badgeColor = Color("tagPurple")
        }
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(badgeColor)
                .clipShape(
                    .rect(
                        topLeadingRadius: 0,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 6,
                        topTrailingRadius: 6
                    )
                )
                
            Text(badgeText)
                .font(.caption2)
                .foregroundColor(.white)
                .padding(.leading, 12)
                .padding(.trailing, 6)
                .padding(.top, 2)
                .padding(.bottom, 4)
        }
        .fixedSize()
    }
}

#Preview {
    TableCardView()
        .frame(width: 168, height: 278)
}
