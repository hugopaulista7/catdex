//
//  BreedCard.swift
//  CatDex
//
//  Created by Hugo Paulista on 17/09/22.
//

import SwiftUI

struct BreedCard: View {
    
    let breed: Breed
    let height: CGFloat = 192.0
    let width: CGFloat = 152.0
    
    var body: some View {
        ZStack {
            AsyncImage(
                url: URL(string: breed.image.url),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: width, height: height)
                        .cornerRadius(16.0)
                },
                placeholder: {
                    ProgressView().progressViewStyle(CircularProgressViewStyle(tint: Color.light))
                        
                }
            )
            VStack(spacing: 16.0) {
                HStack {
                    Text(breed.name)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(LightColor.color)
                    .padding(.all)
                    .frame(width: width)
                }.background(MainColor.color.opacity(0.6))
                    .roundedCorners(radius: 16.0, corners: [.bottomLeft, .bottomRight])
                    .frame(width: width)
                
                
            }.frame(width: width, height: height ,alignment: .bottom)
        }.frame(width: width, height: height)
            .background(MainColor.color)
        .cornerRadius(16.0)
        .shadow(radius: 8)
    }
    
}

struct BreedCard_Previews: PreviewProvider {
    static var previews: some View {
        BreedCard(breed: breedTest)
    }
}

let breedTest = Breed(id: "abys", name: "Abysan", altNames: nil, temperament: "Active, Energetic, Independent, Intelligent, Gentle", origin: "Egypt", description: "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.", lifeSpan: "14 - 15", adaptability: 5, affectionLevel: 5, childFriendly: 3, dogFriendly: 4, energyLevel: 5, intelligence: 5, healthIssues: 2, sheddingLevel: 2, socialNeeds: 5, strangerFriendly: 5, grooming: 1, vocalisation: 1, hairless: 0, natural: 1, rare: 0, shortLegs: 0, suppressedTail: 0, image: Image(id: "0XYvRd7oD", url: "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg"))
