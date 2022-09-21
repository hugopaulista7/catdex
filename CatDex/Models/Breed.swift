//
//  Breed.swift
//  CatDex
//
//  Created by Hugo Paulista on 17/09/22.
//

import Foundation

struct Breed: Codable, Identifiable, Hashable {
    static func == (lhs: Breed, rhs: Breed) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    let id: String
    let name: String
    let altNames: String?
    let temperament: String
    let origin: String
    let description: String
    let lifeSpan: String
    let adaptability: Int
    let affectionLevel: Int
    let childFriendly: Int
    let dogFriendly: Int
    let energyLevel: Int
    let intelligence: Int
    let healthIssues: Int
    let sheddingLevel: Int
    let socialNeeds: Int
    let strangerFriendly: Int
    // boolean
    let grooming: Int
    let vocalisation: Int
    let hairless: Int
    let natural: Int
    let rare: Int
    let shortLegs: Int
    let suppressedTail: Int
    let image: BreedImage?
}

struct BreedImage: Codable {
    let id: String?
    let url: String?
}
