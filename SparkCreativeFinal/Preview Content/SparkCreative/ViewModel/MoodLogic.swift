//
//  StressLevelSelectionModel.swift
//  SparkCreative
//
//  Created by Shakira Al-Jahmee on 5/17/25.
//

import Foundation
import SwiftUI


struct MoodSlider {
    enum Mood {
        case delighted
        case pleasant
        case neutral
        case displeased
        case upset
    }
    
    var mood: Mood
    init(mood: String) {
        switch mood {
        case "delighted":
            self.mood = .delighted
        case "pleasant":
            self.mood = .pleasant
        case "neutral":
            self.mood = .neutral
        case "displeased":
            self.mood = .displeased
        case "upset":
            self.mood = .upset
        default:
            self.mood = .neutral
        }
    }
    // this part is for the title to display on the homescreen
    
    var title: String {
        switch mood {
        case .delighted:
            return "\"Delighted\""
        case .pleasant:
            return "\"Pleasant\""
        case .neutral:
            return "\"Neutral\""
        case .displeased:
            return "\"Displeased\""
        case .upset:
            return "\"Upset\""
        }
    }
  //This is for the summary page
    var rawString: String {
        switch mood {
        case .delighted:
            return "Delighted"
        case .pleasant:
            return "Pleasant"
        case .neutral:
            return "Neutral"
        case .displeased:
            return "Displeased"
        case .upset:
            return "Upset"
        }
    }
  
    
    // this part is to display the tree on the home screen
    //shakira- changed asset names
    var treeColor: Image {
        switch mood {
        case .delighted:
            return Image("orangeTree")
        case .pleasant:
            return Image("yellowTree")
        case .neutral:
            return Image("greenTree")
        case .displeased:
            return Image("blueTree")
        case .upset:
            return Image("redTree")

        }
   }
}
