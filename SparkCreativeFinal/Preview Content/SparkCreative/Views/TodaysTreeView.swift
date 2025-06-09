//
//  TodaysTreeView.swift
//  SparkCreative
//
//  Created by Shakira Al-Jahmee on 5/12/25.
//

import SwiftUI

struct TodaysTreeView: View {
    //shakira
    @StateObject var moodViewModel = MoodViewModel()

    @EnvironmentObject var appData: AppDataModel
    //@Binding var selectedTab: Int
    @StateObject var viewModel = MoodViewModel()
    @State var goToCalendar: Bool = false
    var name = ""
    @State var showButton: Bool = false
    @State var goToExercise = false
    
    //shakira - added show button flag
    @State var showButtons = false
//    var mood: String
//    var emotions: [String]
//    var circumstances: [String]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.beige
                    .ignoresSafeArea()
                
                VStack {
                    Text("Todays Tree")
                        .font(.custom("Sinhala MN", size: 30))
                        .foregroundStyle(Color.hunterGreen)
                        .bold()
                    //image of the correlated tree
                    
                    // Image(appData.treeColor)
                    //shakira
//                    moodViewModel.treeColor
//                                   .resizable()
//                                   .frame(width: 200, height: 200)
//                    MoodSlider.from(mood: appData.currentCalendarEntry.mood).treeColor
//                        .resizable()
//                        .frame(width: 200, height: 200)
//
                    
                    //shakira - added tree
//                    MoodSlider.from(mood: appData.currentCalendarEntry.mood).treeColor
//                        .resizable()
//                        .frame(width: 200, height: 200)
                    appData.currentCalendarEntry.mood?.treeColor ?? MoodSlider.neutral.treeColor
                        .resizable()
                       // .frame(width: 100, height: 100)
                        //                        .frame(width: 200, height: 200)
//
                    Text("mood: \(appData.currentCalendarEntry.mood?.rawString ?? "unknown mood")")//data
                        .font(.custom("Sinhala MN", size: 25))
                        .foregroundStyle(Color.hunterGreen)
                        .bold()
                    Text("Your emotions: \(appData.currentCalendarEntry.selectedEmotions.joined(separator: ", "))")
                        .font(.custom("Sinhala MN", size: 25))
                        .foregroundStyle(Color.hunterGreen)
                        .bold()
                    //selected from previous screen
                    Text("Your circumstances:  \(appData.currentCalendarEntry.selectedCircumstances.joined(separator: ", "))")
                        .font(.custom("Sinhala MN", size: 25))
                        .foregroundStyle(Color.hunterGreen)
                        .bold()
                    //selected from previous screen

                    //bubbles of data
                    
                    // This modifier replaces NavigationLink(isActive:)
                    
                    
                    plantTreeButton(appData: appData)
                    goToExerciseButton()
                    
                    //                    .fullScreenCover(isPresented: $goToCalendar){
                    //                        CalendarView()
                    //                    }
                }
                .fixedSize(horizontal: false, vertical: true)
            }
            NavigationLink(destination: CheckInView(currentTab: .calendar, name: name), isActive: $goToCalendar) {
        
            }
            NavigationLink(destination: ExerciseSelectionView(), isActive: $goToExercise) {
        
            }
        }
    }
    

    
    func plantTreeButton(appData: AppDataModel) -> some View{
        
        Button(action: {
            //selectedTab = 1
            appData.addEntries(CalendarEntry: appData.currentCalendarEntry)
          
            goToCalendar = true
        }, label: {
            Text("Plant Tree")
                .font(.headline)
                .foregroundColor(.beige)
                .frame(width: 163, height: 66)
                .background(Color.hunterGreen)
                .cornerRadius(20)
        
        })
       
        
    }
    
    //shakira - added button for exercise 5/31
    
    func goToExerciseButton() -> some View{
        Button(action: {
            goToExercise = true
        }, label: {
            Text("Try Breathing exercise")
                .font(.headline)
                .foregroundColor(.beige)
                .frame(width: 163, height: 66)
                .background(Color.hunterGreen)
                .cornerRadius(20)
                .padding()
        })
        
    }
    
}
//shakira - added extension for tree
extension MoodSlider {
    static func from(mood: String) -> MoodSlider {
        switch mood.lowercased() {
        case "delighted":
            return .delighted
        case "plesant":
            return .plesant
        case "neutral":
            return .neutral
        case "displeased":
            return .displeased
        case "upset":
            return .upset
        default:
            return .neutral
        }
    }
}

#Preview {
    TodaysTreeView()
        .environmentObject(AppDataModel())
}
