//
//  SparkCreativeApp.swift
//  SparkCreative
//
//  Created by Shakira Al-Jahmee on 5/12/25.
//




import SwiftUI
import SwiftData

@main
struct SparkCreativeApp: App {
    var appData: AppDataModel
    //@StateObject var moodData = MoodModel()
    // Shakira - added onboarding status using AppStorage
    //var name = String("")
    let container: ModelContainer
    init() {
        do {
            container = try ModelContainer(for: CalendarEntry.self)
        } catch {
            fatalError("Failed to create a model container in the app initializer: \(error)")
        }
        
        appData = AppDataModel(context: container.mainContext)
    }
    @AppStorage("hasCompletedOnboarding") var hasCompletedOnboarding: Bool = false
    
    

    var body: some Scene {
        WindowGroup {
            Group { //revise what group is
                let _ = appData.currentDate // forces view update on date change
                
                // use anyview as a workaround to allow conditional views of different types. 6-9
                if hasCompletedOnboarding {
                    AnyView(CheckInView(name: appData.name))
                } else {
                    //6-8 switch homescreen to tree view if user checked in today
                    if appData.hasSubmittedToday() {
                        AnyView(EntrySummaryView(date: appData.currentDate))//6-9
                        
                    } else {
                        AnyView(WelcomeView())
                    }
                }
            }
           .environmentObject(appData)
        }
    }
    
    
}
