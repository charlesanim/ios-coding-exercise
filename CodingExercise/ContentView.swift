//
//  ContentView.swift
//  CodingExercise
//
//  Created by Charles Anim on 1/31/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var data = ViewModel()
    @State var isPresented = false
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    Divider().padding([.leading, .trailing], 20)
                    VStack{
                        ScrollView {
                            ForEach(0..<self.data.photoArray.count, id: \.self) { index in
                                    Card(thumbnailUrl: self.data.photoArray[index].thumbnailUrl,
                                         title: self.data.photoArray[index].title, imageUrl: self.data.photoArray[index].url)
                                        .padding(.bottom)
                            }
                        }
                    }
                }
                .navigationBarTitle("Modern Fertility")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
