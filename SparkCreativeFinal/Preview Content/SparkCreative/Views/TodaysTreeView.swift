//
//  TodaysTreeView.swift
//  SparkCreative
//
//  Created by Shakira Al-Jahmee on 5/12/25.
//

import SwiftUI

struct TodaysTreeView: View {
    //shakira 6/3- accepts date
  // var selectedDate: Date
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
                        Text("Today's Tree")
                        appData.currentCalendarEntry.mood.treeColor
                        Text("Mood:")
                        Text("\(appData.currentCalendarEntry.moodString ?? "unknown mood")") //data
                            .padding(.bottom, 20)
                        
                        Text("Your Emotions:")
                        Text(appData.currentCalendarEntry.selectedEmotions
                            .filter { !$0.isEmpty }
                            .joined(separator: ", "))
                            .padding(.bottom, 20)
                        
                        //selected from previous screen
                        Text("Your Circumstances:")
                        Text(appData.currentCalendarEntry.selectedCircumstances
                            .filter { !$0.isEmpty }
                            .joined(separator: ", "))
                            .padding(.bottom, 20)
                        
                        plantTreeButton(appData: appData)
                            .onChange(of: appData.entries) { oldValue, newValue in
                                appData.todaysEntry = appData.currentCalendarEntry
                            }
                        goToExerciseButton()
                    }
                    .foregroundStyle(Color.hunterGreen)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .bold()
                    .font(.custom("Sinhala MN", size: 25))
                
            }
            NavigationLink(destination: CheckInView(currentTab: .calendar, name: name), isActive: $goToCalendar) {
        
            }
            NavigationLink(destination: ExerciseSelectionView(), isActive: $goToExercise) {
        
            }
        }
    }
    

    
    func plantTreeButton(appData: AppDataModel) -> some View{
        
        Button(action: {

            appData.addEntries(CalendarEntry: appData.currentCalendarEntry)
            //Shakira 6/3 - // Save current date
            appData.currentCalendarEntry.date = Date()
            appData.saveCurrentEntry()
 
          
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
            Text("Try Breathing Exercise")
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
//extension MoodSlider {
//    static func from(mood: String) -> MoodSlider {
//        switch mood.lowercased() {
//        case "delighted":
//            return .delighted
//        case "pleasant":
//            return .pleasant
//        case "neutral":
//            return .neutral
//        case "displeased":
//            return .displeased
//        case "upset":
//            return .upset
//        default:
//            return .neutral
//        }
//    }
//}

#Preview {
//    TodaysTreeView(selectedDate: Date())
    TodaysTreeView()
        .environmentObject(AppDataModel(context: DataController.freshInstall.mainContext))
}
