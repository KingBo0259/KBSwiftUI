//
//  KBHike.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/21.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBHike: Codable, Hashable, Identifiable {
    var name: String
    var id: Int
    var distance: Double
    var difficulty: Int
    var observations: [Observation]
    
    static var formatter = LengthFormatter()
    
    var distanceText: String {
        return KBHike.formatter
            .string(fromValue: distance, unit: .kilometer)
    }
    
    struct Observation: Codable, Hashable {
        var distanceFromStart: Double
        
        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
    }
}
