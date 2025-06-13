//
//  DateComponents.swift
//  SparkCreativeFinal
//
//  Created by Shakira Al-Jahmee on 6/13/25.
//

import Foundation


extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }
}
