//
//  BaseRequest.swift
//  CodeExerciseXfinity
//
//  Created by DANIEL SPADY on 9/5/19.
//  Copyright © 2019 DANIEL SPADY. All rights reserved.
//

import Foundation

class BaseRequest {
    
    var url: URL? {
        // NOTE: Implement this in subclasses
        return nil
    }

    var request: URLRequest? {
        if let url = url {
            let request = URLRequest(url: url)
            
            // change to var to add headers, tokens, etc...
            
            return request
        }
        
        return nil
    }
    
    var getRequest: URLRequest? {
        return request
    }
    
    // implment POST,PUT if requireds
}
