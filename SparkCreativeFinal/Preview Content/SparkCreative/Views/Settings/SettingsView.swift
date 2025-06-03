//
//  settingsView.swift
//  SparkCreative
//
//  Created by Shakira Al-Jahmee on 5/14/25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Color.purple.edgesIgnoringSafeArea(.all)
                VStack{
                    Text("my name") // then name
                }
            }
            .navigationTitle("Your settings")
        }
    }
}

#Preview {
    SettingsView()
}



    


