//
//  Breed.swift
//  CatDex
//
//  Created by Hugo Paulista on 17/09/22.
//

import Foundation

struct Breed: Codable, Identifiable {
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
    let grooming: Int
    let vocalisation: Int
    let hairless: Int
    let natural: Int
    let rare: Int
    let shortLegs: Int
    let suppressedTail: Int
    let image: Image
}

struct Image: Codable {
    let id: String
    let url: String
}