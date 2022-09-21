//
//  BreedSheetBooleanVGrid.swift
//  CatDex
//
//  Created by Hugo Paulista on 21/09/22.
//

import SwiftUI

struct BreedSheetBooleanVGrid: View {
    var breed: Breed
    var body: some View {
        let columns = [
            GridItem(.adaptive(minimum: 164))
        ]
        LazyVGrid(columns: columns, alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Grooming: ").font(.system(size: 16, weight: .bold)).foregroundColor(LightColor.color)
                if Bool(truncating: breed.grooming as NSNumber) {
                    BreedSheetRegularText("Yes")
                } else {
                    BreedSheetRegularText("No")
                }
            }
            VStack(alignment: .leading, spacing: 4) {
                Text("Vocalisation: ").font(.system(size: 16, weight: .bold)).foregroundColor(LightColor.color)
                if Bool(truncating: breed.vocalisation as NSNumber) {
                    BreedSheetRegularText("Yes")
                } else {
                    BreedSheetRegularText("No")
                }
            }
            VStack(alignment: .leading, spacing: 4) {
                Text("Hairless: ").font(.system(size: 16, weight: .bold)).foregroundColor(LightColor.color)
                if Bool(truncating: breed.hairless as NSNumber) {
                    BreedSheetRegularText("Yes")
                } else {
                    BreedSheetRegularText("No")
                }
            }
            VStack(alignment: .leading, spacing: 4) {
                Text("Natural: ").font(.system(size: 16, weight: .bold)).foregroundColor(LightColor.color)
                if Bool(truncating: breed.natural as NSNumber) {
                    BreedSheetRegularText("Yes")
                } else {
                    BreedSheetRegularText("No")
                }
            }
            VStack(alignment: .leading, spacing: 4) {
                Text("Rare: ").font(.system(size: 16, weight: .bold)).foregroundColor(LightColor.color)
                if Bool(truncating: breed.rare as NSNumber) {
                    BreedSheetRegularText("Yes")
                } else {
                    BreedSheetRegularText("No")
                }
            }
            VStack(alignment: .leading, spacing: 4) {
                Text("Short legs: ").font(.system(size: 16, weight: .bold)).foregroundColor(LightColor.color)
                if Bool(truncating: breed.shortLegs as NSNumber) {
                    BreedSheetRegularText("Yes")
                } else {
                    BreedSheetRegularText("No")
                }
            }
            VStack(alignment: .leading, spacing: 4) {
                Text("Supressed tail: ").font(.system(size: 16, weight: .bold)).foregroundColor(LightColor.color)
                if Bool(truncating: breed.suppressedTail as NSNumber) {
                    BreedSheetRegularText("Yes")
                } else {
                    BreedSheetRegularText("No")
                }
            }
        }
    }
}

struct BreedSheetBooleanVGrid_Previews: PreviewProvider {
    static var previews: some View {
        BreedSheetBooleanVGrid(breed: breedTest)
    }
}
