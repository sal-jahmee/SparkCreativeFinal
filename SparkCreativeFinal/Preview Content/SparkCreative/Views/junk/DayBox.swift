//
//  DayBox.swift
//  SparkCreativeFinal
//
//  Created by Shakira Al-Jahmee on 6/4/25.
//

import SwiftUI

struct DayBox: View {
    
    @State var hasEntry: Bool = false
    var day: Int = 1
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 40, height: 40)
                .foregroundColor(hasEntry ? Color.green : Color.gray )
            
            Text(String(day)) //converting int to string
        }
    }
}

#Preview {
    DayBox()
}
