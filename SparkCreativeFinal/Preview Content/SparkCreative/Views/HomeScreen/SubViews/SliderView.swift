//
//  CalendarView.swift
//  SparkCreative
//
//  Created by Shakira Al-Jahmee on 5/12/25.
//

import SwiftUI

struct SliderView: View {
    @EnvironmentObject var appData: AppDataModel

    @State var size = UIScreen.main.bounds.width - 100
    @Binding var progress : CGFloat
    @State var angle: Double = 0


    var body: some View {
        VStack {
            
            Spacer()
        
            ZStack {
    
                Circle()
                    .stroke(Color.gray, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                    .frame(width: size, height: size)
                //progress
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(Color.hunterGreen, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                    .frame(width: size, height: size)
                    .rotationEffect(.init(degrees: -90))
                //inner finish curve
                Circle()
                    .fill(Color("stroke"))
                    .frame(width: 55, height: 55)
                    .offset(x: size / 2)
                    .rotationEffect(.init(degrees: -90))
                
                
                //drag circle
                Circle()
                    .fill(Color.hunterGreen)
                    .frame(width: 30, height: 30)
                   
                    .offset(x: size / 2)
                    .rotationEffect(.init(degrees: angle))
                //adding gesture
                    .gesture(DragGesture().onChanged(onDrag(value:)))
                    .rotationEffect(.init(degrees: -90))
                
                //sample logic
                
//                Image(systemName: "leaf.fill") // Or use your own asset with Image("leaf1")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 100, height: 100)
//                    .foregroundColor(leafColor(for: progress))
                
                
                leafColor(for: progress) // Or use your own asset with Image("leaf1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                   // .foregroundColor(leafColor(for: progress))
        
                
               
//                let mood: MoodSlider = .happy
//                Text(mood.title)
                
                
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
//    func leafColor(for progress: CGFloat) -> Color {
//        switch progress {
//        case 0..<0.2:
//            return .green
//        case 0.2..<0.4:
//            return .mint
//        case 0.4..<0.6:
//            return .yellow
//        case 0.6..<0.8:
//            return .orange
//        default:
//            return .red
//        }
//    }
    func leafColor(for progress: CGFloat) -> Image{
        switch progress {
            //        case 0..<0.2:
            //            return Image("orangeLeaf")
//        case 0.2..<0.4:
//            return Image("yellowLeaf")
//        case 0.4..<0.6:
//            return Image("greenLeaf")
//        case 0.6..<0.8:
//           // return Image("blueLeaf")
//            return Image("leafBlue")
        case 0..<0.2:
           return Image("leafOrange")
        case 0.2..<0.4:
            return Image("leafYellow")
        case 0.4..<0.6:
            return Image("leafGreen")
        case 0.6..<0.8:
            return Image("leafBlue")
        default:
            return Image("leafRed")
        }
    }
    
    func treeColor(for progress: CGFloat) -> Image{
        switch progress {
        case 0..<0.2:
            return Image("orangeTree")
        case 0.2..<0.4:
            return Image("yellowTree")
        case 0.4..<0.6:
            return Image("greenTree")
        case 0.6..<0.8:
            return Image("blueTree")
        default:
            return Image("redTree")
        }
    }
    

    
    func onDrag(value: DragGesture.Value){
        // calculating radians
        
        let vector = CGVector(dx: value.location.x, dy: value.location.y)
        
        let radians = atan2(vector.dy - 27.5, vector.dx - 27.5)
        
        //converting to angle
        var angle = radians * 180 / .pi
        
        //simple technique for 0 to 360
        
        if angle < 0{angle = 360 + angle}
        
        withAnimation(Animation.linear(duration: 0.15)){
            
            //progress
            let progress = angle / 360
            self.progress = progress
            self.angle = Double(angle)
        }
    }
    
//    func getMood() -> MoodSlider {
//        switch progress {
//        case 0..<0.2:
//            return .happy
//        case 0.2..<0.4:
//            return .sad
//        case 0.4..<0.6:
//            return .neutral
//        case 0.6..<0.8:
//            return .angry
//        default:
//            return .stressed
//        }
//    }
}
#Preview {
    SliderView(progress: .constant(0.5))
        .environmentObject(AppDataModel())

}
