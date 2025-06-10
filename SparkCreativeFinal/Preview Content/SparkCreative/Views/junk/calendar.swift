//
//  calendar.swift
//  SparkCreative
//
//  Created by Shakira Al-Jahmee on 5/21/25.
//

import SwiftUI

struct CustomCalendarView: View {
   // @EnvironmentObject var appData: AppDataModel

    let columns: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 10), count: 7)
    let days = Calendar.current.shortWeekdaySymbols
    let dates = (1...30).map { $0 }

    var body: some View {
        ZStack{
            Color.cream
                .edgesIgnoringSafeArea(.all)
            VStack {
                LazyVGrid(columns: columns, spacing: 80
                ) {
                    ForEach(days, id: \.self) { day in
                        Text(day).font(.caption).bold()
                    }
                    
                    ForEach(dates, id: \.self) { day in
                        calendarButton(day: day)
//                        Text("\(day)")
//                            .frame(maxWidth: .infinity, minHeight: 40)
//                            .background(Color.brown)
//                            .cornerRadius(8)
                    }
                }
                .padding()
            }
        }.onAppear{
         //   print(appData.entries)
        }
    }
    
    func calendarButton(day: Int) -> some View{
        let day = day
        return Button(action: {
            
        }, label: {
            Text("\(day)")
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, minHeight: 40)
                .background(Color.brown)
                .cornerRadius(8)
        })
    }
}


#Preview {
    CustomCalendarView()
       // .environmentObject(AppDataModel())
}
