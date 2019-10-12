//
//  CharacterRequest.swift
//  CodeExerciseXfinity
//
//  Created by DANIEL SPADY on 9/5/19.
//  Copyright © 2019 DANIEL SPADY. All rights reserved.
//

import Foundation

class CharacterRequest: BaseRequest {
    
    override var url: URL? {
        let urlString = BaseService.characterEndpoint
        return URL(string: urlString)
    }
}
