//
//  Divider.swift
//  CodingExercise
//
//  Created by Charles Anim on 1/31/22.
//

import SwiftUI

struct Divider: View {
    var body: some View {
        Rectangle()
            .fill(Color.teal)
            .frame(height: 2)
            .edgesIgnoringSafeArea(.horizontal)
    }
}

struct Divider_Previews: PreviewProvider {
    static var previews: some View {
        Divider().padding([.leading, .trailing], 20.0)
    }
}
