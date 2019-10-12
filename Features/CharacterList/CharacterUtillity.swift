//
//  CharacterUtillity.swift
//  CodeExerciseXfinity
//
//  Created by DANIEL SPADY on 9/5/19.
//  Copyright © 2019 DANIEL SPADY. All rights reserved.
//

import Foundation

class CharacterUtillity: BaseService {
    
    /**
     Retrieve list of Characters
     
     - parameter request: CharacterRequest
     - parameter dispatchQueue: The queue used to execute the completionHandler. If nil, the completionHandler will execute on the same queue as the request. The default queue is the BaseService dispatchQueue
     - parameter completionHandler: (CharacterResponse) -> ()
     - returns: URLSessionDataTask?
     
     */
    @discardableResult static public func characterList(_ request: CharacterRequest = CharacterRequest(), dispatchQueue: DispatchQueue? = BaseService.dispatchQueue, completionHandler: @escaping (CharacterResponse) -> ()) -> URLSessionDataTask? {
        
        var task: URLSessionDataTask? = nil
        
        task = makeGetRequest(with: request, completeOn: dispatchQueue) { (data, response, error) in
                        
            let response = CharacterResponse(request: request,
                                                     task: task,
                                                     data: data,
                                                     response: response as? HTTPURLResponse,
                                                     error: error,
                                                     result: CharacterResult.fromJSON(data))
            
            completionHandler(response)
        }
        
        task?.resume()
        
        return task
    }
    
    /**
     Retrieve Icon for Character
     
     - parameter request: CharacterIconRequest
     - parameter dispatchQueue: The queue used to execute the completionHandler. If nil, the completionHandler will execute on the same queue as the request. The default queue is the BaseService dispatchQueue
     - parameter completionHandler: (CharacterIconResponse) -> ()
     - returns: URLSessionDataTask?
     
     */
    @discardableResult static public func characterIcon(_ request: CharacterIconRequest, dispatchQueue: DispatchQueue? = BaseService.dispatchQueue, completionHandler: @escaping (CharacterIconResponse) -> ()) -> URLSessionDataTask? {
        
        var task: URLSessionDataTask? = nil
        
        task = makeGetRequest(with: request, completeOn: dispatchQueue) { (data, response, error) in
            
            let response = CharacterIconResponse(request: request,
                                             task: task,
                                             data: data,
                                             response: response as? HTTPURLResponse,
                                             error: error,
                                             result: nil)

            completionHandler(response)
        }
        
        task?.resume()
        
        return task
    }
}
