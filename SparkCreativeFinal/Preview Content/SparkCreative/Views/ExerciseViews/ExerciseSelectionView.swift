//
//  ExerciseSelectionView.swift
//  SparkCreative
//
//  Created by Shakira Al-Jahmee on 5/12/25.
//

import SwiftUI

struct ExerciseSelectionView: View {
    @State var goToExercise: Bool = false
    var body: some View {
        NavigationStack{
            ZStack{
                Color.beige.edgesIgnoringSafeArea(.all)
                VStack (spacing: 50){
    
                    Text("Take a Deep Breath")
                        .font(.custom("Sinhala MN", size: 40))
                        .multilineTextAlignment(.center)
                        
                      
        
                    Text("Take a mindful minute")
                        .font(.custom("Sinhala MN", size: 20))
                      
                    //ListView()
                    exerciseButtonUI()
                }
                .padding()
                .fontWeight(.bold)
                .foregroundStyle(.hunterGreen)
                
          
            }
        
            .navigationDestination(isPresented: $goToExercise) {
                ExerciseView()
            }
    
        }

    }
     
    func exerciseButtonUI() -> some View {
        Button(action: {
            goToExercise = true}) {
            VStack(spacing: 4) {
                Text("Breathing Exercise")
                    .font(.custom("SinhalaMN", size: 20))
                    .foregroundColor(.mintGreen)
                    .fontWeight(.bold)

                Text("Helps regulate the nervous system and reduce anxiety.")
                    .font(.custom("SinhalaMN", size: 18))
                    .foregroundColor(.mintGreen.opacity(0.9))
                    .multilineTextAlignment(.center)
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.feldgrau)
                    .frame(maxWidth: .infinity, minHeight: 10)
            }
    
        }
    
        .buttonStyle(.plain)
    }
}

#Preview {
    ExerciseSelectionView()
}
