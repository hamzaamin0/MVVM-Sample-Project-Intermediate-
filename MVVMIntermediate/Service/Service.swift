//
//  Service.swift
//  MVVMIntermediate
//
//  Created by MAC on 08/10/2021.
//

import Foundation

class Service{
    
    static let shared = Service()
    
    func fetchCourses(completion:  @escaping ([Course]?, Error?) -> ()){
        
        let urlString = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        guard let url = URL.init(string: urlString) else {return}
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            
            if let err = error {
                
                completion(nil, err)
                print("failed to fetch courses")
                return
            }
            
            guard let data = data else {return}
            do {
                let courses = try JSONDecoder().decode([Course].self, from: data)
                DispatchQueue.main.async {
                    completion(courses, nil)
                }
            }
            catch let jsonErr {
                print("failed to decode", jsonErr)
            }
            
        }.resume()
        
    }
}
