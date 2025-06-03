//
//  ListView.swift
//  SparkCreative
//
//  Created by Shakira Al-Jahmee on 5/18/25.
//

import SwiftUI

struct ListView: View {
    
    struct Exercise: Identifiable {
        let id = UUID()
        let title: String
        let description: String
    }
    //model
    let exercises = [
        Exercise(title: "Breathing", description: "Helps you focus on breathing."),
        Exercise(title: "Vent", description: "Relaxes your muscles."),
       // Exercise(title: "Affirmations", description: "Improves your posture."),
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(exercises) { exercise in
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.feldgrau)
                            .frame(maxWidth: .infinity, minHeight: 100)
                        
                        VStack {
                            Text(exercise.title)
                                .font(.custom("SinhalaMN", size: 20))
                                .foregroundColor(.mintGreen)
                                .fontWeight(.bold)
                            
                            Text(exercise.description)
                                .font(.custom("SinhalaMN", size: 18))
                                .foregroundColor(.mintGreen.opacity(0.9))
                        }
//                        .padding()
                    }
                    .listRowInsets(EdgeInsets()) // remove default List padding
                    .padding(.vertical, 6) // space between items
                }
                .listRowBackground(Color.clear)
            }
            .background(.beige)
            .scrollContentBackground(.hidden)
        }
    }
}

#Preview {
    ListView()
}

