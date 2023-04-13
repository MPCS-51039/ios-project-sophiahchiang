//
//  ClimbService.swift
//  CountingClimbs
//
//  Created by Sophia Chiang on 4/7/23.
//

import Foundation

enum ClimbCallingError: Error {
    case problemGeneratingURL
    case problemGettingDataFromAPI
    case problemDecodingData
}

class ClimbService {
    private let urlString = "https://run.mocky.io/v3/b3849c0b-c229-497d-878c-9808b7fe695d"

    
    func getClimbs(completion: @escaping ([Climb]?, Error?) -> ()) {
            guard let url = URL(string: self.urlString) else {
                DispatchQueue.main.async { completion(nil, ClimbCallingError.problemGeneratingURL) }
                return
        }
                
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    DispatchQueue.main.async { completion(nil, ClimbCallingError.problemGettingDataFromAPI) }
                    return
                }
                
                do {
                    let climbResult = try JSONDecoder().decode(ClimbResult.self, from: data)
                    DispatchQueue.main.async { completion(climbResult.climbs, nil) }
                } catch (let error) {
                    print(error)
                    DispatchQueue.main.async { completion(nil, ClimbCallingError.problemDecodingData) }
                }
                                                        
            }
            task.resume()
        }
    
}
