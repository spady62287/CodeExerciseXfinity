//
//  CharacterResponse.swift
//  CodeExerciseXfinity
//
//  Created by DANIEL SPADY on 9/5/19.
//  Copyright © 2019 DANIEL SPADY. All rights reserved.
//

import Foundation

public struct CharacterResponse: BaseResponse {
    
    var request: CharacterRequest?
    var task: URLSessionDataTask?
    var data: Data?
    var response: HTTPURLResponse?
    var error: Error?
    var result: CharacterResult?
    
    public init() {
        self.request = Request()
        self.task = nil
        self.data = nil
        self.response = nil
        self.error = nil
        result = nil
    }
}
