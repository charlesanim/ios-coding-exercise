//
//  LikeButton.swift
//  CodingExercise
//
//  Created by Charles Anim on 2/1/22.
//

import SwiftUI

struct LikeButton : View {
    @State var isPressed = false
    @State var scale : CGFloat = 1
    @State var opacity  = 0.0
    var body: some View {
        ZStack {
            Image(systemName: "heart.fill")
                .opacity(isPressed ? 1 : 0)
                .scaleEffect(isPressed ? 1.0 : 0.1)
                .animation(Animation.linear, value: isPressed)
            Image(systemName: "heart")
            
            CirclesView(radius: 35, speed: 0.1, scale: 0.7, isPressed: $isPressed)
                        .opacity(self.opacity)
              
                        CirclesView(radius: 55, speed: 0.2, scale: 0.5 , isPressed: $isPressed)
                        .opacity(self.opacity)
                        .rotationEffect(Angle(degrees: 20))
            
        }.scaleEffect(self.scale)
        .font(.system(size: 40))
            .onTapGesture {
                     self.isPressed.toggle()
                     withAnimation (.linear(duration: 0.2)) {
                          self.scale = self.scale == 1 ? 1.3 : 1
                          self.opacity = self.opacity == 0 ? 1 : 0
                      }
                      withAnimation {
                          self.opacity = self.opacity == 0 ? 1 : 0
                      }
             }
        .foregroundColor(isPressed ? .red : .gray)
    }
}

struct CirclesView : View {
  
  let angle : CGFloat = 40
  let radius : CGFloat
  let speed : Double
  let scale : CGFloat
    @Binding var isPressed: Bool
      
  var body: some View {
      ZStack {
             ForEach (0..<9) { num in
                 Circle()
                     .fill(Color.red)
                     .frame(width: 10)
                     .scaleEffect(self.isPressed ? 0.1 : self.scale)
                     .animation(Animation.linear(duration: self.speed), value: isPressed)
                     .offset(x:  self.radius * cos(CGFloat(num) * self.angle * .pi / 180),
                             y: self.radius * sin(CGFloat(num) * self.angle * .pi / 180))
             }
      }
  }
}
