//
//  QuestionaireView.swift
//  SparkCreative
//
//  Created by Shakira Al-Jahmee on 5/12/25.
//

import SwiftUI

struct QuestionaireViewOne: View {
    @EnvironmentObject var appData: AppDataModel
    @State private var goToQuestionaireTwo = false
    // @State var selectedEmotions: [String] = []
    
    //var mood: String //comes from mood slider
    
    let emotions = ["Indifferent", "Calm", "Focused", "Alert", "Curious", "Mindful", "Detached", "Tolerant", "Present", "Grounded", "Accepting", "Passive", "Settled", "Stable", "Reflective"]
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ZStack{
            Color.cream.edgesIgnoringSafeArea(.all)
            
            
            VStack{
                
                Group {
                    Text("Let's dig deeper into how you are feeling")
                        .font(.custom("SinhalaMN", size:30))
                        .padding()
                    
                Text("Choose an emotion that best describes your stress level.")
                        .font(.custom("SinhalaMN", size:20))
                        .padding()
                    
                //shakira - added only choose 3
                Text("Select up to 3 emotions")
                        .font(.custom("SinhalaMN", size:18))

                }
                .foregroundStyle(.hunterGreen)
                .multilineTextAlignment(.center)
                .fontWeight(.bold)
        
                VStack{
                    
                    HStack{
                        LazyVGrid(columns: columns, spacing: 16){
                            ForEach(emotions, id: \.self) { emotion in
                                
                                Button(action: {
                                    if appData.currentCalendarEntry.selectedEmotions.contains(emotion){
                                        appData.currentCalendarEntry.selectedEmotions.removeAll{ $0 == emotion }
                                        //Shakira - added condition so they can only pick up to 3
                                    } else if appData.currentCalendarEntry.selectedEmotions.count <= 3{
                                        appData.currentCalendarEntry.selectedEmotions.append(emotion)
                                    }
                                    //revise
                                    
                                }) {
                                    Text(emotion)
                                        .fontWeight(.bold)
                                        .font(.system(size: 15))
                                        .frame(width: 114, height: 65)
                                        .background(appData.currentCalendarEntry.selectedEmotions.contains(emotion) ? Color.hunterGreen : Color.gray)
                                        .foregroundStyle(Color.beige)
                                        .cornerRadius(80)
                                    
                                }
                            }
                        }
                    }
                }
                .padding()
                NextQuestionaireScreen()
                    .navigationDestination(isPresented: $goToQuestionaireTwo) {
                        QuestionaireViewTwo()
                    }
            }
            .fixedSize(horizontal: false, vertical: true)
        }
    }
    
    func NextQuestionaireScreen() -> some View {
        Button(action: {
            goToQuestionaireTwo = true
        }, label: {

            Text("Next")
                .font(.title)
                .bold()
                .foregroundColor(.beige)
                .frame(width: 163, height: 66)
                .background(Color.hunterGreen)
                .cornerRadius(20)
                .padding()
        })
    }
}

#Preview {
    QuestionaireViewOne()
        .environmentObject(AppDataModel(context: DataController.freshInstall.mainContext))
}
