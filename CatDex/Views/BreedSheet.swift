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
            VStack(alignment: .leading, spacing: 24) {
                Text(breed.name)
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(LightColor.color)
                
                BreedSheetRegularText(breed.description).padding(.horizontal)
                
                if let altNames = breed.altNames {
                    HStack {
                        BreedSheetRegularText("Alternative names: ")
                        BreedSheetRegularText(altNames)
                    }.padding(.horizontal)
                }
                Group {
                    Group {
                        VStack(alignment:.leading, spacing: 4) {
                            Text("Origin: ").font(.system(size: 16, weight: .bold)).foregroundColor(LightColor.color)
                            BreedSheetRegularText(breed.origin)
                        }
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Temperament: ").font(.system(size: 16, weight: .bold)).foregroundColor(LightColor.color)
                            BreedSheetRegularText(breed.temperament)
                        }
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Lifespan in years: ").font(.system(size: 16, weight: .bold)).foregroundColor(LightColor.color)
                            BreedSheetRegularText(breed.lifeSpan)
                        }
                    }.padding(.horizontal)
                    BreedSheetVGrid(breed: breed)
                    BreedSheetBooleanVGrid(breed: breed).padding(.horizontal)
                    
                    
                }
            }
            .padding(.all)
            .background(MainColor.color)
            .cornerRadius(16)
            .offset(y: -24)
        }.edgesIgnoringSafeArea(.all)
            .background(MainColor.color)
    }
}

struct BreedSheet_Previews: PreviewProvider {
    static var previews: some View {
        BreedSheet(breed: breedTest)
    }
}

