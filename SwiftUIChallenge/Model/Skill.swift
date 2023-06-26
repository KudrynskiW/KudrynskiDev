//
//  Skill.swift
//  SwiftUIChallenge
//
//  Created by Wojciech Kudrynski on 21/06/2023.
//

import Foundation
import SwiftUI

enum Categories: String {
    case Apple
    case Frameworks
    case Other
}

struct Skill: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var category: String
    private var rate: Int
    
    init(id: Int, name: String, category: String, rate: Int) {
        self.id = id
        self.name = name
        self.category = category
        self.rate = rate
    }
    
    func prepareImages() -> [String] {
        var stars: [String] = ["star", "star", "star", "star", "star"]
        
        for rateCount in 0..<rate {
            stars[rateCount] = "star.fill"
        }
        
        return stars
    }
}
