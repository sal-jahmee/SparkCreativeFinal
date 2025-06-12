//
//  AppDataModel.swift
//  SparkCreative
//
//  Created by Shakira Al-Jahmee on 5/26/25.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class CalendarEntry: Identifiable {
    @Attribute(.unique)
    var id: String
    var date: Date = Date()
    var moodString: String?
    var mood: MoodSlider {
        return MoodSlider(mood: moodString ?? "neutral")
    }
    var selectedEmotions: [String] = []
    var selectedCircumstances: [String] = []
    var exercises : [String]
    
    init(date: Date, mood: String? = nil, selectedEmotions: [String], selectedCircumstances: [String], exercises: [String]) {
        self.id = UUID().uuidString
        self.date = date
        self.moodString = mood
        self.selectedEmotions = selectedEmotions
        self.selectedCircumstances = selectedCircumstances
        self.exercises = exercises
    }
    
    /// Write a func that returns the name of the day from the date. (Mon, Tue, Wed)
    ///
    /// when you go intp entry summary view call this
    
}

/*
- we can create different INSTANCES of this struct.
- in the apps context the INSTANCE = ONE entry
- so we need somewhere to place these INSTANCES=ENTRIES
- FINAL resting place for one individual INSTANCE = ENTRY
*/
