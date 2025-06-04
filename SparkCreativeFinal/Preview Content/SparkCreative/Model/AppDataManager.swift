//
//  AppDataManager.swift
//  SparkCreative
//
//  Created by Shakira Al-Jahmee on 5/29/25.
//

import Foundation

// this holds the mood from the slider as well as the selected items from QuestionaireViewOne and QuestionairViewTwo.
class AppDataModel: ObservableObject {

    @Published var currentCalendarEntry = CalendarEntry(date: Date.now, mood: nil, selectedEmotions: [""], selectedCircumstances: [""], exercises: [""])
    
    // this stores the calendar entries created by the user
    @Published var entries: [CalendarEntry] = [CalendarEntry(date: Date.now.addingTimeInterval(-86400), mood: .delighted, selectedEmotions: ["tolerant", "excited"], selectedCircumstances: ["school", "pets"], exercises: ["breathing"])]

    // adds data after user plants tree to entries array
    func addEntries(CalendarEntry: CalendarEntry){
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
