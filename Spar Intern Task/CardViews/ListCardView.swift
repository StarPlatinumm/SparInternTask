import SwiftUI

struct ListCardView: View {
    
    private var product: Product = Product(id: 0, title: "Хэппи мил (липа)", price: 19.99, discount: 0.1, countryOfOrigin: "Франция 🇫🇷", rating: 4.2, reviews: 16, specialTag: Tag.new, imageName: "image0", inCart: 0)
    
    var body: some View {
        ZStack {
            // ЗАДНИК
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.sparWhite)
            
            // ОСНОВНОЙ КОНТЕНТ
            HStack(spacing: 8) {
                // фото товара
                Image(product.imageName)
                    .overlay(alignment: .topLeading) {
                        if let specialTag = product.specialTag {
                            SpecialTagView(specialTag)
                        }
                    }
                    .overlay(alignment: .bottomTrailing) {
                        if let discount = product.discount {
                            Text(String(format: "%.0f", discount * 100) + "%")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(Color("discountRed"))
                        }
                    }
                    .clipShape(
                        .rect(
                            topLeadingRadius: 20,
                            bottomLeadingRadius: 0,
                            bottomTrailingRadius: 0,
                            topTrailingRadius: 0
                        )
                    )
                
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 8) {
                        
                        HStack(alignment: .bottom, spacing: 4) {
                            // рейтинг
                            Image("star-rating")
                            Text(String(format: "%.1f", product.rating))
                                .font(.caption)
                            // отзывы
                            Text("| \(product.reviews) отзывов")
                                .font(.caption)
                                .opacity(0.6)
                            
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
                    Spacer()
                    // ПРАВЫЕ КНОПКИ
                    OrderListAndFavoritesMenuView()
                }
                Spacer()
            }
        }
    }
}


#Preview {
    ListCardView()
        .frame(height: 150)
}
