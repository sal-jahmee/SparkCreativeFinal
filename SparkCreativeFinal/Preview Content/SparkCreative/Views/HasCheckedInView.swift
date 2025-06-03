//
//  hasCheckedInView.swift
//  SparkCreative
//
//  Created by Shakira Al-Jahmee on 5/12/25.
//

import SwiftUI

struct HasCheckedInView: View {
    @EnvironmentObject var appData: AppDataModel

    var body: some View {
        Text("has checked in view")
    }
}

#Preview {
    HasCheckedInView()
        .environmentObject(AppDataModel())

}
