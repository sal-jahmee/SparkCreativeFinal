//
//  EntrySummaryView.swift
//  SparkCreativeFinal
//
//  Created by Shakira Al-Jahmee on 6/4/25.
//

import SwiftUI

struct EntrySummaryView: View {
    var entry: CalendarEntry?
    var body: some View {
        NavigationStack {
            ZStack{
                Color.beige
                    .ignoresSafeArea()
                VStack{
                    Text("Todays Tree")
                        .font(.custom("Sinhala MN", size: 30))
                        .foregroundStyle(Color.hunterGreen)
                        .bold()
                    entry?.mood?.treeColor ?? MoodSlider.neutral.treeColor
                    Text("mood: \(entry?.mood?.rawString ?? "unknown mood")")//data
                        .font(.custom("Sinhala MN", size: 25))
                        .foregroundStyle(Color.hunterGreen)
                        .bold()
                    Text("Your emotions: \(entry?.selectedEmotions.joined(separator: ", ") ?? "")")
                        .font(.custom("Sinhala MN", size: 25))
                        .foregroundStyle(Color.hunterGreen)
                        .bold()
                    //selected from previous screen
                    Text("Your circumstances:  \(entry?.selectedCircumstances.joined(separator: ", ") ?? "")")
                        .font(.custom("Sinhala MN", size: 25))
                        .foregroundStyle(Color.hunterGreen)
                        .bold()
                }
                
            }
        }
    }
}

#Preview {
    EntrySummaryView(entry: AppDataModel().entries.first!)
}
