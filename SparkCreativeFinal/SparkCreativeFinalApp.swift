//
//  SparkCreativeApp.swift
//  SparkCreative
//
//  Created by Shakira Al-Jahmee on 5/12/25.
//

import SwiftUI

@main
struct SparkCreativeApp: App {
    @StateObject var appData = AppDataModel()
    //@StateObject var moodData = MoodModel()
    // Shakira - added onboarding status using AppStorage
    @AppStorage("hasCompletedOnboarding") var hasCompletedOnboarding: Bool = false
    

    var body: some Scene {
        WindowGroup {
            Group { //revise what group is
                if hasCompletedOnboarding {
                    HomeScreenView(name: "Shakira")
                } else {
                    WelcomeView()
                }
            }
           .environmentObject(appData)
        }
    }
}
