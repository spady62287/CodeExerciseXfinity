//
//  CharacterIconResponse.swift
//  CodeExerciseXfinity
//
//  Created by DANIEL SPADY on 9/7/19.
//  Copyright © 2019 DANIEL SPADY. All rights reserved.
//

import Foundation

public struct CharacterIconResponse: BaseResponse {
    
    var request: CharacterIconRequest?
    var task: URLSessionDataTask?
    var data: Data?
    var response: HTTPURLResponse?
    var error: Error?
    var result: CharacterResult?
    
    public init() {
        self.request = nil
        self.task = nil
        self.data = nil
        self.response = nil
        self.error = nil
        result = nil
    }
}
