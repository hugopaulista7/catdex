//
//  BreedSheetVGrid.swift
//  CatDex
//
//  Created by Hugo Paulista on 21/09/22.
//

import SwiftUI

struct BreedSheetVGrid: View {
    
    let breed: Breed
    
    var body: some View {
        let columns = [
            GridItem(.adaptive(minimum: 186))
        ]
        LazyVGrid(columns: columns, spacing: 16) {
            VStack(alignment: .leading, spacing: 6)  {
                Text("Adaptability: ").font(.system(size: 16, weight: .bold)).foregroundColor(LightColor.color)
                Stars(rating: breed.adaptability)
            }
            VStack(alignment: .leading, spacing: 6)  {
                Text("Affection level: ").font(.system(size: 16, weight: .bold)).foregroundColor(LightColor.color)
                Stars(rating: breed.affectionLevel)
            }
            VStack(alignment: .leading, spacing: 6)  {
                Text("Child friendly: ").font(.system(size: 16, weight: .bold)).foregroundColor(LightColor.color)
                Stars(rating: breed.childFriendly)
            }
            VStack(alignment: .leading, spacing: 6)  {
                Text("Dog friendly: ").font(.system(size: 16, weight: .bold)).foregroundColor(LightColor.color)
                Stars(rating: breed.dogFriendly)
            }
            VStack(alignment: .leading, spacing: 6)  {
                Text("Energy level: ").font(.system(size: 16, weight: .bold)).foregroundColor(LightColor.color)
                Stars(rating: breed.energyLevel)
            }
            VStack(alignment: .leading, spacing: 6)  {
                Text("Intelligence: ").font(.system(size: 16, weight: .bold)).foregroundColor(LightColor.color)
                Stars(rating: breed.intelligence)
            }
            VStack(alignment: .leading, spacing: 6)  {
                Text("Health issues: ").font(.system(size: 16, weight: .bold)).foregroundColor(LightColor.color)
                Stars(rating: breed.healthIssues)
            }
            VStack(alignment: .leading, spacing: 6)  {
                Text("Shedding level: ").font(.system(size: 16, weight: .bold)).foregroundColor(LightColor.color)
                Stars(rating: breed.sheddingLevel)
            }
            VStack(alignment: .leading, spacing: 6)  {
                Text("Social needs: ").font(.system(size: 16, weight: .bold)).foregroundColor(LightColor.color)
                Stars(rating: breed.socialNeeds)
            }
            VStack(alignment: .leading, spacing: 6)  {
                Text("Stranger friendly: ").font(.system(size: 16, weight: .bold)).foregroundColor(LightColor.color)
                Stars(rating: breed.strangerFriendly)
            }
            
        }
    }
}

struct BreedSheetVGrid_Previews: PreviewProvider {
    static var previews: some View {
        BreedSheetVGrid(breed: breedTest)
    }
}
