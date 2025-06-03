//
//  WelcomePage.swift
//  SparkCreative
//
//  Created by Shakira Al-Jahmee on 5/17/25.
//

import SwiftUI

struct EnterNameView: View {
    @EnvironmentObject var appData: AppDataModel
    
    //Shakira - added boolean for onboarding
    @AppStorage("hasCompletedOnboarding") var hasCompletedOnboarding: Bool = false
   // var mood: String
    @State private var goToHomeScreen = false
    @State var name: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack  {
                Color.cream.edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    Text("Calm Tree")
                        .font(.largeTitle)
                        .foregroundColor(.hunterGreen)
                        .bold()
                    //.offset(y: -200)
                    
                    Text("Help us make this a more personal experience for you!")
                        .foregroundColor(.hunterGreen).multilineTextAlignment(.center)
                       
                        .bold()
                        .font(.title)
                        .padding()
                    //Text("Enter your name")
                    //text field to enter name
                    TextField("Enter your name", text: $name)
                        .padding()
                        .background(Color.green.opacity(0.2))
                        .frame(width: 300, height: 50)
                    
                    Text("dont worry, no one will know ;)")
                        .foregroundColor(.hunterGreen)
                    Spacer()
                    NextButtonToHomeScreen()
                        .fullScreenCover(isPresented: $goToHomeScreen) {
                            CheckInView(name: name)
                        }
                    //                NavigationLink(destination: CheckInView(name: name), isActive: $goToHomeScreen) {
                    //                    NextButtonToHomeScreen()
                    //                }
                    //whats the difference use cases
                    //                NavigationLink(destination: CheckInView(), isActive: $goToHomeScreen) {
                    //                    NextButtonToHomeScreen()
                    //                }
                    //                NextButtonToHomeScreen()
                    //                    .navigationDestination(isPresented: $goToHomeScreen){
                    //                        CheckInView()
                    //                    }
                }
            }
        }
    }
    
    func NextButtonToHomeScreen() -> some View {
        Button(action: {
            goToHomeScreen = true
            
            //Shakira - set boolean to true if onboarding is completed
            hasCompletedOnboarding = true
        }, label: {
            Image("nextButton")
//            Text("GET STARTED")
//                .font(.headline)
//                .foregroundColor(.white)
//                .padding()
//                .background(Color.blue)
//                .cornerRadius(10)
        })
    }
    //validate name function
}


#Preview {
    EnterNameView()
        .environmentObject(AppDataModel())

}
