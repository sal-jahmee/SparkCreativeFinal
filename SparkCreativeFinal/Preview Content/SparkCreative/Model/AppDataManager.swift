//
//  AppDataManager.swift
//  SparkCreative
//
//  Created by Shakira Al-Jahmee on 5/29/25.
//

import Foundation
import SwiftUI

// this holds the mood from the slider as well as the selected items from QuestionaireViewOne and QuestionairViewTwo.
class AppDataModel: ObservableObject {
    @AppStorage("name") var name: String = ""
    
    
    
    //6-8 ensure date resets at midnight
    @Published var currentDate = Calendar.current.startOfDay(for: Date())
    
    @Published var currentCalendarEntry = CalendarEntry(date: Date.now, mood: nil, selectedEmotions: [""], selectedCircumstances: [""], exercises: [""])
    
    // this stores the calendar entries created by the user
    @Published var entries: [CalendarEntry] = [CalendarEntry(date: Date.now.addingTimeInterval(-86400), mood: .delighted, selectedEmotions: ["tolerant", "excited"], selectedCircumstances: ["school", "pets"], exercises: ["breathing"])]
    
    
    //6-8 ensure date resets at midnight
    init() {
        Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { _ in
            self.currentDate = Calendar.current.startOfDay(for: Date())
        }
    }
    
    // adds data after user plants tree to entries array
    func addEntries(CalendarEntry: CalendarEntry){
        //6-8 remove any existing entry for today
        entries.removeAll() { Calendar.current.isDate($0.date, inSameDayAs: CalendarEntry.date) }
        entries.append(CalendarEntry)
    }
    
    /// Searches entries and returns a calendar entry and a boolean
    func getEntry(_ input: Date?) -> (CalendarEntry? , Bool){
        /// Safely unwraps  if the optional date is nil, if it is do not compute further
        guard let unwrappedInput = input else {
            return (nil, false)
        }
        
        /// Searches array to compare the input date to each item in the entries array and returns the item and true if found, else returns both empty values
        for item in entries {
            if Calendar.current.isDate(unwrappedInput, equalTo: item.date, toGranularity: .day){
                return (item, true)
            }
        }
        return (nil, false)
    }
    
    //6-8 check if user submitted today (to switch homescreen)
    func hasSubmittedToday() -> Bool {
        let today = Date()
        return entries.contains { Calendar.current.isDate($0.date, inSameDayAs: today) }
    }
}


/*
- This file is where we create the instance
- This file is where we tell it where to go
= This is where we create that final list of entries
- This file is where we append it to the final list of entries
- This is where we create the method to append the entries to the final list of entries
 
- instance created -> container for instance created -> method to append instance to that container created! :D
*/





















//    @Published var mood: String = ""
//    @Published var selectedEmotions: [String] = []
//    @Published var selectedCircumstances: [String] = []
//
    

/*
init(){
    loadIntitialData()
}
 */

// loads data when app manager is called and prints statement for confirmation
//testing purposees
/*
func loadIntitialData() {
    //add data - dummy data
    entries.append(CalendarEntry(date: Date(), mood: "happy", selectedEmotions: ["hopeful", "excited"], selectedCircumstances: ["school", "work"],exercises:  ["venting","breathing"]))
    print(entries)
}
 */
