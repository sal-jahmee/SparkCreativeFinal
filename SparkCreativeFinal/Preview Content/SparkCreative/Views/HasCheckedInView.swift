//
//  hasCheckedInView.swift
//  SparkCreative
//
//  Created by Shakira Al-Jahmee on 5/12/25.
//

import SwiftUI

struct HasCheckedInView: View {
    @EnvironmentObject var appData: AppDataModel

    var body: some View {
        ZStack {
            (Color.cream)
                .ignoresSafeArea()
            
      
       VStack {
           Text("Hey")
               .font(.custom("SinhalaMN", size: 30))
          
           Text("Today's Tree")
               .font(.custom("SinhalaMN", size: 40))
           
           Image("tree")
               .padding()
           Text("Neutral")
               .font(.custom("SinhalaMN", size: 25))
           
               .padding()
           Text("Your Emotions")
               .font(.custom("SinhalaMN", size: 22))
               .padding()
           HStack(spacing: 30) {
               HStack {
                   Image(systemName: "leaf.fill")
                   Text ("Calm")
               }
               
               HStack {
                   Image(systemName: "leaf.fill")
                   Text ("Focused")
               }
          
               HStack {
                   Image(systemName: "leaf.fill")
                   Text("Mindful")
               }
               
           }
           .font(.custom("SinhalaMN", size: 17))
           
           Text("The Circumstances")
               .font(.custom("SinhalaMN", size: 22))
               .padding()
           HStack (spacing: 30){
               HStack {
                   Image(systemName: "leaf.fill")
                   Text ("Friends")
               }
               HStack {
                   Image(systemName: "leaf.fill")
                   Text ("Business")
               }
               HStack {
                   Image(systemName: "leaf.fill")
                   Text("Work")
               }
           }
.font(.custom("SinhalaMN", size: 17))
           Text("Exercise")
               .font(.custom("SinhalaMN", size: 22))
               .padding()
           Text("Your exercise will show up here")
           
        }
       .foregroundColor(.hunterGreen)
       .bold()
    }
}
}
#Preview {
    HasCheckedInView()
        .environmentObject(AppDataModel())

}
