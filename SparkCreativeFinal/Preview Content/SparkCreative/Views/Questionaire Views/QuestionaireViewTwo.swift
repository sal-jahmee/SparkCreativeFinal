//
//  QuestionaireViewTwo.swift
//  SparkCreative
//
//  Created by Shakira Al-Jahmee on 5/17/25.
//

import SwiftUI

struct QuestionaireViewTwo: View {
    @EnvironmentObject var appData: AppDataModel

    
   // var mood: String //comes from mood slider
   // var emotions: [String]
    
    
    //@State var selectedCategory: [String] = []
    @State var showTodaysTree = false
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    @State var categories = ["School", "Work", "Business", "Friends", "Family", "Partner", "Kids", "Pets", "World", "Economics", "Politics" , "Health"]
    
    var body: some View {
        ZStack{
            Color.cream.edgesIgnoringSafeArea(.all)

            VStack{
                
                Group {
                    Text("What is impacting you right now?")
                        .font(.custom("SinhalaMN", size:30))
                        .padding()

                Text("Choose a category below")
                        .font(.custom("SinhalaMN", size:25))
                   

                //shakira - added only choose 3
                Text("Select up to 3 circumstances")
                        .font(.custom("SinhalaMN", size:18))
                        .padding()

                }
                .foregroundStyle(.hunterGreen)
                .multilineTextAlignment(.center)
                .fontWeight(.bold)
                
                LazyVGrid(columns: columns, spacing: 16){
                    ForEach(categories, id: \.self) { category in
                        Button(action: {
                            if appData.currentCalendarEntry.selectedCircumstances.contains(category) {
                                appData.currentCalendarEntry.selectedCircumstances.removeAll { $0 == category }
                //Shakira - added condition so they can only pick up to 3
                            } else if appData.currentCalendarEntry.selectedCircumstances.count <= 3 {
                                appData.currentCalendarEntry.selectedCircumstances.append(category)
                             
                            }
                        }, label:{
                            Text(category)
                                .frame(width: 114, height: 65)
                                .background(appData.currentCalendarEntry.selectedCircumstances.contains(category) ? Color.hunterGreen : Color.gray)
                                .foregroundStyle(.beige)
                                .cornerRadius(80)
                        })
                    }
                }
                
                NextButton2()
                
                    .navigationDestination(isPresented: $showTodaysTree){
                        TodaysTreeView()
                    }
            }
            .padding()
        }
    }

    func NextButton2() -> some View{
        Button(action: {
            showTodaysTree = true
        }, label: {
//            Text("Next")
//                .font(.headline)
//                .foregroundStyle(.white)
//                .frame(width: 100, height: 60)
//                .background(.blue)
            Image("nextButton")
                .padding()
        })
    }
}

#Preview {
    QuestionaireViewTwo()
        .environmentObject(AppDataModel())
}
