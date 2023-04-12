//
//  Climb.swift
//  CountingClimbs
//
//  Created by Sophia Chiang on 4/7/23.
//

import Foundation

class Climb: CustomDebugStringConvertible {
    var debugDescription: String {
        return "Climb(name: \(self.name), grade: \(self.grade), type: \(self.type))"
    }
    
    var name: String
    var grade: String
    var type: String
    var imageUrl: String
    var isFinished: Bool = false
    var isFavorite: Bool = false
    
    init(named name: String, grade: String, type: String, imageUrl: String) {
        self.name = name
        self.grade = grade
        self.type = type
        self.imageUrl = imageUrl
    }
    
}


