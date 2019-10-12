//
//  CharacterIconRequest.swift
//  CodeExerciseXfinity
//
//  Created by DANIEL SPADY on 9/6/19.
//  Copyright © 2019 DANIEL SPADY. All rights reserved.
//

import Foundation

class CharacterIconRequest: BaseRequest {
    
    var endpoint: URL?
    
    public init(endpoint: URL) {
        super.init()
        self.endpoint = endpoint
    }
    
    override var url: URL? {
        if let endpoint = endpoint {
            return endpoint
        }
        return nil
    }
}
