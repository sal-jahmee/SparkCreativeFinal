//
//  BreathingAnimationView.swift
//  Originally SparkCreative Watch App - converting to iOS app.
//
//  Created by Linda Swanson on 5/20/25.
//

import SwiftUI

struct BreathingAnimationView: View {
    @State var scale_in_out = false
    @State var rotate_in_out = false

    var body: some View {
        ZStack {
            Color("cream")
                .ignoresSafeArea()
            Group { // draw 2 circles and put into group
                ZStack {
                    Circle()
                        .frame(width: 80, height: 80)
                        .foregroundColor(Color.green)
                        .offset(y: -42)
                    Circle()
                        .frame(width: 80, height: 80)
                        .foregroundColor(Color.green)
                        .offset(y: 42)
                }
            }.opacity(1/3)
            
            Group { // Copy and rotate the group at 60 degrees
                ZStack {
                    Circle()
                        .frame(width: 80, height: 80)
                        .foregroundColor(Color.green)
                        .offset(y: -42)
                    Circle()
                        .frame(width: 80, height: 80)
                        .foregroundColor(Color.green)
                        .offset(y: 42)
                }
            }
            .rotationEffect(.degrees(60))
            .opacity(1/4)
            
            Group { // Copy and rotate the group at 120 degrees
                ZStack {
                    Circle()
                        .frame(width: 80, height: 80)
                        .foregroundColor(Color.green)
                        .offset(y: -42)
                    Circle()
                        .frame(width: 80, height: 80)
                        .foregroundColor(Color.green)
                        .offset(y: 42)
                }
                
            }
            .rotationEffect(.degrees(120))
            .opacity(1/2)
            // Whole container
        }
        .rotationEffect(.degrees(rotate_in_out ? 90 : 0))
        .scaleEffect(scale_in_out ? 1 : 1/8)
        // from tutorial, deprecated .animation(Animation.easeInOut(repeatForever: true, autoreverses: true).speed(1/8))
        //.withAnimation(.easeInOut(duration: 1))
        //.withAnimation(<#T##SwiftUICore.Animation?#>, <#T##() -> Result#>)
        //.animation(.easeInOut.repeatForever().speed(1/8))
        .onAppear {
            self.rotate_in_out.toggle()
            self.scale_in_out.toggle()
        }
    }
}

#Preview {
    BreathingAnimationView()
}
