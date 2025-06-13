//
//  checkInView.swift
//  SparkCreative
//
//  Created by Shakira Al-Jahmee on 5/12/25.
//

import SwiftUI


enum navBarType {
    case home
    case calendar
    case exercise
}

struct CheckInView: View {
    
    @EnvironmentObject var appData: AppDataModel
    @State private var showTabs = false
   // var mood: String
    @State private var selectedTab = 0
    @State var currentTab: navBarType = .home
    
    var name: String
    
    var body: some View {
        if showTabs {
            CalendarView()
        }
        else {
        NavigationStack {
            ZStack {
                TabView(selection: $currentTab) {
                    
                    if appData.hasSubmittedToday() {
                        EntrySummaryView(entry: appData.currentCalendarEntry)
                            .tabItem {
                                Image(systemName: "house")
                                Text("Home")
                            }
                            .tag(navBarType.home)
                    } else {
                        HomeScreenView(name: name)
                            .tabItem {
                                Image(systemName: "house")
                                Text("Home")
                            }
                            .tag(navBarType.home)
                    }
            
                    
                    CustomCalendarView2()
                        .tabItem {
                            Image(systemName: "calendar")
                            Text("Browse")
                        }
                        .tag(navBarType.calendar)
                    ExerciseSelectionView()
                        .tabItem {
                            Image(systemName: "dumbbell")
                            Text("Exercises")
                        }
                        .tag(navBarType.exercise)
                }
                .tint(.hunterGreen)
            }
//            .onAppear {
//                print(currentTab)
//            }
            .navigationBarBackButtonHidden()
//settings button
                //.navigationBarItems(trailing: SettingsButton)

//Button to next screen
             //   NextButton
            }
           // .navigationTitle("How are you feeling today?")
        }
    }
   
        //button to Settings
    var SettingsButton: some View {
        Button(action: {
            
        }, label: {
            Image(systemName: "gearshape")
                .tint(.hunterGreen)
                
        })
    }
}


#Preview {
    CheckInView(name: "shakira")
        .environmentObject(AppDataModel(context: DataController.freshInstall.mainContext))

}

