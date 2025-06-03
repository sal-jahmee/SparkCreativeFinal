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
    @Published var entries: [CalendarEntry] = []

    // adds data after user plants tree to entries array
    func addEntries(CalendarEntry: CalendarEntry){
        entries.append(CalendarEntry)
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
