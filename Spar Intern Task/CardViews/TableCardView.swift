import SwiftUI

struct TableCardView: View {
    private var product: Product
    
    init(_ product: Product) {
        self.product = product
    }
    
    var body: some View {
        ZStack {
            // ЗАДНИК
            RoundedRectangle(cornerRadius: 16)
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
                                .font(.subheadline)
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
                        SpecialTagView(specialTag)
                    }
                    Spacer()
                    // ПРАВЫЕ КНОПКИ
                    OrderListAndFavoritesMenuView()
                }
                Spacer()
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: Color.gray, radius: 4, x: 0, y: 2)
    }
}


#Preview {
    TableCardView(Product(id: 0, title: "Хэппи мил (липа)", price: 19.99, discount: 0.1, countryOfOrigin: "Франция 🇫🇷", rating: 4.2, reviews: 16, specialTag: Tag.new, imageName: "image0"))
        .frame(width: 168, height: 278)
}
