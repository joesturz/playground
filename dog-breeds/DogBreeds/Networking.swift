//
//  Networking.swift
//  DogBreeds
//
//  Created by Joe Sturzenegger on 1/25/23.
//

import Foundation

public class Networking {
    
    public func getAllBreeds(completionHandler: @escaping (DogBreeds) -> Void) {
        guard let url = URL(string: "https://dog.ceo/api/breeds/list/all") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("network error: \(error)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }
            if let data = data, let breeds = try? JSONDecoder().decode(DogBreeds.self, from: data) {
                completionHandler(breeds)
            }
        }
        task.resume()
        return
    }
    
    public func getDogImages(breed: String, count: Int, completionHandler: @escaping (DogImages) -> Void) {
        guard let url = URL(string: "https://dog.ceo/api/breed/\(breed)/images/random/\(count)") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("network error: \(error)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }
            if let data = data, let breeds = try? JSONDecoder().decode(DogImages.self, from: data) {
                completionHandler(breeds)
            }
        }
        task.resume()
        return
    }
    
}
