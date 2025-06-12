//
//  hasCheckedInView.swift
//  SparkCreative
//
//  Created by Shakira Al-Jahmee on 5/12/25.
//

import SwiftUI

struct EntrySummaryView: View {
    @EnvironmentObject var appData: AppDataModel
    var entry: CalendarEntry?
    var date = Date() //6-9
    //var name: String
    var body: some View {
        ZStack {
            (Color.cream)
                .ignoresSafeArea()
            
      
       VStack {
           Text("Hey \(appData.name)")
               .font(.custom("SinhalaMN", size: 30))
          
           Text("Today's Tree")
               .font(.custom("SinhalaMN", size: 40))
           
           entry?.mood.treeColor ?? MoodSlider(mood: "neutral").treeColor

           Text("\(entry?.moodString ?? "unknown mood")")
               .font(.custom("SinhalaMN", size: 25))
               .padding()
    
//EMOTIONS
           Text("Your Emotions")
               .font(.custom("SinhalaMN", size: 22))
               .padding()
           HStack(spacing: 1){
           if let emotions = entry?.selectedEmotions {
               ForEach(emotions, id: \.self) { emotion in
              
                       Image(systemName: "leaf.fill")
                           .padding()
                       Text(emotion)
                           //.padding()
                   }
               }
           }
           .font(.custom("SinhalaMN", size: 17))
           
//CIRCUMSTANCES
           Text("The Circumstances")
           HStack(spacing: 1){
           if let circumstances = entry?.selectedCircumstances{
               ForEach(circumstances, id: \.self) { circumstance in
             
                       Image(systemName: "leaf.fill")
                           .padding()
                       Text(circumstance)
                           //.padding()
                   }
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
    EntrySummaryView(entry: CalendarEntry(date: Date.now, selectedEmotions: ["neutral"], selectedCircumstances: ["I hate"], exercises: ["Big pluto"]))
        .environmentObject(AppDataModel(context: DataController.freshInstall.mainContext))

}
