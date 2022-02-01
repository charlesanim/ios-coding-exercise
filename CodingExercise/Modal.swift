//
//  Modal.swift
//  CodingExercise
//
//  Created by Charles Anim on 1/31/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct Modal: View {
    @Environment(\.presentationMode) var presentationMode
    let item: Item
    
    var body: some View {
        ZStack {
            Color.primary.edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                        .onTapGesture {
                            withAnimation {
                                presentationMode.wrappedValue.dismiss()
                        }
                        }
                }.padding(.horizontal)
                .padding(.bottom, 100)
                VStack {
                    WebImage(url: URL(string: item.url))
                        .resizable()
                        .indicator(.activity) // Activity Indicator
                        .transition(.fade(duration: 0.5))
                        .aspectRatio(contentMode: .fit)
                    Spacer()
            }
            }
           
        }
    }
}

struct Modal_Previews: PreviewProvider {
    static var previews: some View {
        Modal(item: Item(url: "url"))
    }
}
