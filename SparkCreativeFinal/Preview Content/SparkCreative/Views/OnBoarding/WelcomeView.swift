//
//  EnterNamePage.swift
//  SparkCreative
//
//  Created by Shakira Al-Jahmee on 5/17/25.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var appData: AppDataModel

    //var mood: String
    @State private var goToWelcomeScreen = false
    
    //var name: String
    var body: some View {
            NavigationStack{
                ZStack{
                    Color.cream.edgesIgnoringSafeArea(.all)
                VStack{
                    
                    Text("""
                    Welcome to 
                    Calm Tree
                    """)
                        .bold()
                        .font(.largeTitle)
//                        .frame(width: 300, height: 300)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.hunterGreen)
                    
                    Image("homeScreenTrees")
                        .frame(width: 80, height: 80)
//                        .padding(.bottom, 150)
//                        .padding(.top, 120)
                        .padding()
                    
                    Text("""
                        Take a deep breath, You're in the right place. Like the rhythm in the trees, we're here to help you track your stress and find balance. Let's reduce your stress together.
                        """)
                    .padding()
                    
              //      .frame(width: 250, height: 250)
                    .multilineTextAlignment(.center)
                    .font(.custom("SinhalaMN", size:20))
                    .fontWeight(.bold)
                    .foregroundColor(.hunterGreen)
                    .padding()
                    
                    LetsGoButton()
                    .fullScreenCover(isPresented: $goToWelcomeScreen) {
                        
                        EnterNameView()
                    }
                    .padding()
                }
                .padding()
            }
        }
    }
    
    func LetsGoButton() -> some View {
        
        Button(action: {
            goToWelcomeScreen = true
        }, label: {
            Text("Let's Go")
                .font(.title)
                .bold()
                .foregroundColor(.beige)
                .frame(width: 163, height: 66)
                .background(Color.hunterGreen)
                .cornerRadius(20)
                //.font(.headline)
               // .foregroundColor(.white)
                //.padding()
                //.background(Color.blue)
               // .cornerRadius(10)
        })
    }
  
    
}

#Preview {
    WelcomeView()
        .environmentObject(AppDataModel(context: DataController.freshInstall.mainContext))
}
