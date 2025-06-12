//
//  DataController.swift
//  SparkCreativeFinal
//
//  Created by Shakira Al-Jahmee on 6/11/25.
//

import Foundation
import SwiftData
@MainActor
final class DataController {
    static var defaultContainer: ModelContainer = {
        var container = try! ModelContainer()
        do {
            container = try ModelContainer(for: CalendarEntry.self, configurations: ModelConfiguration(isStoredInMemoryOnly: false))
        } catch {
            fatalError("Failed to create the default model container: \(error)")
        }
        return container
    }()
    static var freshInstall: ModelContainer = {
        var container = try! ModelContainer()
        do {
            container = try ModelContainer(for: CalendarEntry.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        } catch {
            fatalError("Failed to create a model container simulating a fresh install: \(error)")
        }
        return container
    }()
    
    static var fullMonthUse: ModelContainer = {
        // get current day and return an integer of the current day in the month
        var container = try! ModelContainer()
        do {
            container = try ModelContainer(for: CalendarEntry.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        } catch {
            fatalError("Failed to create a model container simulating a month of entries: \(error)")
        }
        var context = container.mainContext
        let daysIn = Calendar.current.component(.day, from: Date.now)
        print("You are \(daysIn) days into this month")
        var entries = [CalendarEntry]()
        for i in 1...(daysIn - 1){
            var entry = CalendarEntry(date: Date.now.addingTimeInterval(TimeInterval(-86400 * i)), mood: "neutral", selectedEmotions: ["End me now"], selectedCircumstances: ["Poverty"], exercises: ["Hip thrust"])
            container.mainContext.insert(entry)
        }
        try! container.mainContext.save()
        
        return container
    }()
    
    static var sortedEntryDescriptor: FetchDescriptor = {
        let descriptor = FetchDescriptor<CalendarEntry>(
            sortBy: [
                .init(\.date, order: .forward)
            ]
        )
        return descriptor
    }()
}
