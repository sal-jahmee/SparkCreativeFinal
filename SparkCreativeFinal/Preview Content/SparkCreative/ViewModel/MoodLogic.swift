//
//  StressLevelSelectionModel.swift
//  SparkCreative
//
//  Created by Shakira Al-Jahmee on 5/17/25.
//

import Foundation
import SwiftUI

//this is for questionare
//struct Mood: Identifiable{
//    let name: String
//    var isSelected: Bool = false
//    var id: String = UUID().uuidString
//}

//class MoodModel : ObservableObject {
//    
//   
//}

enum MoodSlider {
    case delighted
    case plesant
    case neutral
    case displeased
    case upset
 
    // this part is for the title to display on the homescreen
    
    var title: String {
        switch self {
        case .delighted:
            return "\"Delighted\""
        case .plesant:
            return "\"Plesant\""
        case .neutral:
            return "\"Neutral\""
        case .displeased:
            return "\"Displeased\""
        case .upset:
            return "\"Upset\""
        }
    }
  
    var rawString: String {
        switch self {
        case .delighted:
            return "Delighted"
        case .plesant:
            return "Plesant"
        case .neutral:
            return "Neutral"
        case .displeased:
            return "Displeased"
        case .upset:
            return "Upset"
        }
    }
  
    
    // this part is to display the leaf on the home screen
    //shakira- changed asset names
    var treeColor: Image {
        switch self {
        case .delighted:
            return Image("orangeTree")
        case .plesant:
            return Image("yellowTree")
        case .neutral:
            return Image("greenTree")
        case .displeased:
            return Image("blueTree")
        case .upset:
            return Image("redTree")

//        case .happy:
//            return Image("leafBlue")
//        case .sad:
//            return Image("leafGreen")
//        case .neutral:
//            return Image("leafYellow")
//        case .angry:
//            return Image("leafOrange")
//        case .stressed:
//            return Image("leafRed")
        }
   }
}
