//
//  CalendarView.swift
//  SparkCreative
//
//  Created by Shakira Al-Jahmee on 5/14/25.
//

import SwiftUI

struct CalendarView: View {
    
    @EnvironmentObject var appData: AppDataModel
    @State var currentDate: Date = Date()
    var body: some View {
        ZStack{
            Color.cream
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Forest View")
                    .font(.largeTitle)
                Text("Take a look at your forest")
                
                //CALENDAR
                                DatePicker("Date", selection: $currentDate)
                                    .datePickerStyle(.graphical)
                                    .padding()
                                   // .colorScheme(.light) // forces white text on dark backgrounds
                
                Text("Select a day to view a past tree you have planted.")
            }
        }
    }
}

#Preview {
    CalendarView()
        .environmentObject(AppDataModel(context: DataController.freshInstall.mainContext))

}
