import SwiftUI

struct SpecialTagView: View {
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
    SpecialTagView(Tag.cardPrice)
}
