//
//  Card.swift
//  CodingExercise
//
//  Created by Charles Anim on 1/31/22.
//

import SwiftUI
import SDWebImageSwiftUI


struct Item: Identifiable {
    let id = UUID()
    let url: String
}

struct Card: View {
    var thumbnailUrl: String
    var title: String
    var imageUrl: String
    @State private var item: Item? = nil
    
    var body: some View {
        VStack {
            VStack {
                Button(action: {item = Item(url: imageUrl)}) {
            WebImage(url: URL(string: thumbnailUrl))
                .resizable()
                .indicator(.activity) // Activity Indicator
                .transition(.fade(duration: 0.5))
                .aspectRatio(contentMode: .fit)
                }
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                }
                Spacer()
                LikeButton()
                .layoutPriority(100)
            }
            .padding()
        }
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 0.5)
                    )
                    .padding([.top, .horizontal])
                    .fullScreenCover(item: $item,
                                             onDismiss: { print("dismissed!") },
                                     content: { Modal(item: $0) })
        }
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(thumbnailUrl: "boss-baby", title: "Boss Baby is Back", imageUrl: "https://via.placeholder.com/600/d32776")
    }
}
