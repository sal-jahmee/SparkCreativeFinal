//
//  ContentView.swift
//  Breathing Animation
//
//  Created by Lessly C. Romero-Rodriguez on 6/9/25.
//

import SwiftUI

struct ExerciseView: View {
    @State private var breathe = false
    @State private var timeRemaining = 60
    @State private var timer: Timer?

    var body: some View {
        NavigationStack {
            ZStack {
                Color.beige.edgesIgnoringSafeArea(.all)
                VStack(spacing: 30) {
                    Text("Let's Breathe")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.hunterGreen)
                    
                    Text("Instructions")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.hunterGreen)
                    
                    Text("Breath in for 2 seconds and breath out for 2 seconds. Repeat until the timer stops.")
                       .fontWeight(.bold)
                        .foregroundStyle(.hunterGreen)
                    
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 250, height: 200)
                        .bold()
                        .symbolRenderingMode(.multicolor)
                        .scaleEffect(breathe ? 1.3 : 1.0)
                        .animation(
                            breathe
                            ? .easeInOut(duration: 2).repeatForever(autoreverses: true)
                            : .default,
                            value: breathe
                        )

                    if breathe {
                        Text("\(timeRemaining) seconds")
                            .font(.title3)
                            .foregroundColor(.secondary)
                    }

                    if breathe {
                        Button("Stop") {
                            stopBreathing()
                        }
                        .buttonStyle(.bordered)
                        .tint(.red)
                    } else {
                        Button("Start Exercise") {
                            startBreathing()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.hunterGreen)
                        .foregroundStyle(.white)
                    }

                    Spacer()
                }
                .padding()
            }
        }
    }

    func startBreathing() {
        breathe = true
        timeRemaining = 60

        timer?.invalidate()

        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { t in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                t.invalidate()
                breathe = false
            }
        }
    }

    func stopBreathing() {
        timer?.invalidate()
        breathe = false
        timeRemaining = 60
    }
}

#Preview {
    ExerciseView()
}
