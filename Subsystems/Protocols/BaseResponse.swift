//
//  BaseResponse.swift
//  CodeExerciseXfinity
//
//  Created by DANIEL SPADY on 9/5/19.
//  Copyright © 2019 DANIEL SPADY. All rights reserved.
//

import Foundation

protocol BaseResponse {
    associatedtype Request: BaseRequest
    var request: Request? { get set }
    
    var task: URLSessionDataTask? { get set }
    var data: Data? { get set }
    var response: HTTPURLResponse? { get set }
    var error: Error? { get set }
    
    associatedtype Payload
    var result: Payload? { get set }
    
    init()
}

extension BaseResponse {
    
    public init(request: Request, task: URLSessionDataTask?, data: Data?, response: HTTPURLResponse?, error: Error?, result: Payload?) {
        self.init()
        self.request = request
        self.task = task
        self.data = data
        self.response = response
        self.error = error
        self.result = result
    }
}
