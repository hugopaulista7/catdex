//
//  BreedModal.swift
//  CatDex
//
//  Created by Hugo Paulista on 20/09/22.
//

import SwiftUI

struct BreedSheet: View {
    var breed: Breed
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if let image = breed.image, let url = image.url {
                
                GeometryReader { reader in
                    AsyncImage(
                        url: URL(string: url),
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .offset(y: -reader.frame(in: .global).minY)
                                .frame(width: UIScreen.main.bounds.width, height: reader.frame(in: .global).minY + 480)
                        },
                        placeholder: {
                            ProgressView().progressViewStyle(CircularProgressViewStyle(tint: Color.light))
                        }
                    )
                }.frame(height: 480)
            }
            VStack(alignment: .leading, spacing: 16) {
                Text(breed.name)
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(LightColor.color)
                
                Text(breed.description)
                    .padding(.top, 8)
                    .font(.system(size: 16))
                    .foregroundColor(LightColor.color)
            }
            .padding(.all)
            .background(MainColor.color)
            .cornerRadius(16)
            .offset(y: -24)
            .frame(width: UIScreen.main.bounds.width)
            .edgesIgnoringSafeArea(.horizontal)
        }.edgesIgnoringSafeArea(.all)
            .padding(.top)
//            .background(MainColor.color.edgesIgnoringSafeArea(.all))
    }
}

struct BreedSheet_Previews: PreviewProvider {
    static var previews: some View {
        BreedSheet(breed: breedTest)
    }
}
