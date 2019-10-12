//
//  CharacterResult.swift
//  CodeExerciseXfinity
//
//  Created by DANIEL SPADY on 9/5/19.
//  Copyright © 2019 DANIEL SPADY. All rights reserved.
//

import Foundation

class CharacterResult: BaseCodable {
    var AbstractSource: String?
    var DefinitionSource: String?
    
    struct relatedTopics: BaseCodable {
        var FirstURL: String?
        var Result: String?
        var Icon: icon?
        var Text: String?
        
        func getCharacterName() -> String {
            if let text = self.Text {
                let arrayString = text.components(separatedBy: "-")
                return arrayString[0]
            }
            return self.Text!
        }
        
        struct icon: BaseCodable {
            var URL: String?
            var Height: String?
            var Width: String?
        }
    }
    
    var RelatedTopics: [relatedTopics]?
}
