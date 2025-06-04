//
//  CustomCalendarView.swift
//  SparkCreative
//
//  Created by Shakira Al-Jahmee on 5/21/25.
//

import SwiftUI

struct CustomCalendarView2: View {
    @EnvironmentObject var appData: AppDataModel
    
    @State private var displayedDate = Date()
    @State private var selectedDate: Date? = nil
    @State private var navigateToTreeView = false
    @State private var selectedEntry: CalendarEntry? = nil

    private let calendar = Calendar.current
    private let columns = Array(repeating: GridItem(.flexible()), count: 7)
    private let weekDays = Calendar.current.shortWeekdaySymbols

    var body: some View {
        NavigationStack {
            ZStack {
                Color.cream
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 16) {
                    // Month navigation
                    HStack {
                        Button(action: {
                            displayedDate = calendar.date(byAdding: .month, value: -1, to: displayedDate) ?? displayedDate
                        }) {
                            Image(systemName: "chevron.left")
                        }

                        Spacer()

                        Text(monthYearString(from: displayedDate))
                            .font(.title2)
                            .bold()

                        Spacer()

                        Button(action: {
                            displayedDate = calendar.date(byAdding: .month, value: 1, to: displayedDate) ?? displayedDate
                        }) {
                            Image(systemName: "chevron.right")
                        }
                    }
                    .padding(.horizontal)
                    
                    // Calendar Grid
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(weekDays, id: \.self) { day in
                            Text(day)
                                .font(.caption)
                                .bold()
                                .frame(maxWidth: .infinity)
                        }

                        ForEach(generateMonthDates(for: displayedDate), id: \.self) { date in
                            
                            let dateExists = appData.getEntry(date)
                            if let date = date {
                                Button(action: {
                                    selectedEntry = dateExists.0
                                    navigateToTreeView = true
                                }) {
                                    Text("\(calendar.component(.day, from: date))")
                                        .frame(maxWidth: .infinity, minHeight: 40)
                                        .background(dateExists.1 ? Color.green : Color.brown)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                    //DayBox(hasEntry: false, day: String(weekDays))
                                }
                            } else {
                                Rectangle()
                                    .fill(Color.clear)
                                    .frame(height: 40)
                            }
                        }
                    }
                    .padding(.horizontal)

                    Spacer()
                    // Calendar Grid
//                    LazyVGrid(columns: columns, spacing: 80) {
//                        ForEach(weekDays, id: \.self) { day in
//                            Text(day)
//                                .font(.caption)
//                                .bold()
//                                .frame(maxWidth: .infinity)
//                        }
//
//                        ForEach(generateMonthDates(for: displayedDate), id: \.self) { date in
////                            if let date = date {
////                                // Shakira 6/3 - Check if there's already an entry for this date
////                                        let hasEntry = appData.entries.contains {
////                                            calendar.isDate($0.date, inSameDayAs: date)
////                                        }
//                                
//                                Button(action: {
//                                    selectedDate = date
//                                    navigateToTreeView = true
//                                }) {
//                                    Text("\(calendar.component(.day, from: date))")
//                                        .frame(maxWidth: .infinity, minHeight: 40)
//                                    //shakira 6/3 - change color if has entry
//                                        //.background(hasEntry ? Color.green : Color.brown)
//                                        .background(Color.brown)
//                                        .foregroundColor(.white)
//                                        .cornerRadius(8)
//                                }
//                            } else {
//                                Rectangle()
//                                    .fill(Color.clear)
//                                    .frame(height: 40)
//                            }
//                        }
//                    }

                }
            }
           
    
            .navigationDestination(isPresented: $navigateToTreeView) {
                EntrySummaryView(entry: selectedEntry)            }
            
            //shakira 6/3 - updated this to pass selected date
//            .navigationDestination(isPresented: $navigateToTreeView) {
//                if let selectedDate = selectedDate {
//                    TodaysTreeView(selectedDate: selectedDate)
//                }
//            }

            
        }
    }

    // MARK: - Helper Functions

    func monthYearString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: date)
    }

    func generateMonthDates(for date: Date) -> [Date?] {
        var calendar = Calendar.current
        calendar.firstWeekday = 1 // Sunday

        guard let range = calendar.range(of: .day, in: .month, for: date),
              let firstOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: date))
        else {
            return []
        }

        let firstWeekday = calendar.component(.weekday, from: firstOfMonth)
        let padding: [Date?] = Array(repeating: nil, count: firstWeekday - 1)

        let days: [Date?] = range.compactMap { day in
            calendar.date(byAdding: .day, value: day - 1, to: firstOfMonth)
        }

        return padding + days
    }
}

#Preview {
    CustomCalendarView2()
        .environmentObject(AppDataModel())

}

