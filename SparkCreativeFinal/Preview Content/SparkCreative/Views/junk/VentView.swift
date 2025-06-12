//
//  VentView.swift
//  SparkCreative
//
//  Created by Shakira Al-Jahmee on 5/26/25.
//

import SwiftUI

struct VentView: View {
    //simulated state for preview
    @State private var isRecording = false

    var body: some View {
        ZStack {
            Color.cream.edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
            
                Text("Vent It Out")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.hunterGreen)

                Text("Hold down or tap the mic to record your voice.")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)

                Button(action: {
                    isRecording.toggle()
                }) {
                    Image(systemName: isRecording ? "stop.circle.fill" : "mic.circle.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(isRecording ? .red : .blue)
                        .shadow(radius: 10)
                }

                Text(isRecording ? "Recording..." : "Not Recording")
                    .font(.headline)
                    .foregroundColor(isRecording ? .red : .secondary)

                Spacer()
            }
            .padding()
        }
   
    }
}

#Preview {
    VentView()
}
