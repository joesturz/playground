//
//  Breeds.swift
//  DogBreeds
//
//  Created by Joe Sturzenegger on 1/25/23.
//

import Foundation

public struct DogBreeds: Codable {
    public let status: String
    public let message: [String: [String]]
}
