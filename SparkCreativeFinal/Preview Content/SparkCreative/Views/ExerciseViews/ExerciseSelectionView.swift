//
//  ExerciseSelectionView.swift
//  SparkCreative
//
//  Created by Shakira Al-Jahmee on 5/12/25.
//

import SwiftUI

struct ExerciseSelectionView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color.beige.edgesIgnoringSafeArea(.all)
                VStack{
                    Text("De-Stress Exercises")
                        .font(.custom("Sinhala MN", size: 40))
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Text("Take a mindful minute")
                        .font(.custom("Sinhala MN", size: 20))
                    
                    ListView()
                    
                }
                .padding()
                .fontWeight(.bold)
                .foregroundStyle(.hunterGreen)
            }
        }
    }
}
#Preview {
    ExerciseSelectionView()
}
