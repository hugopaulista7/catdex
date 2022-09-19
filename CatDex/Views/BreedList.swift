//
//  BreedList.swift
//  CatDex
//
//  Created by Hugo Paulista on 17/09/22.
//

import SwiftUI

struct BreedList: View {
    @StateObject var viewModel: BreedListViewModel = BreedListViewModel()
    
    let columns = [
        GridItem(.adaptive(minimum: 128))
    ]
    
    var body: some View {
        ScrollView {
            if (viewModel.loading) {
                ProgressView{
                    Text("Fetching furballs...")
                        .frame(width: .infinity)
                }.onAppear(perform: viewModel.fetchData)
                    .progressViewStyle(CircularProgressViewStyle(tint: LightColor.color))
                    .foregroundColor(LightColor.color)
            } else {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.breeds, id: \.self) { breed in
                        BreedCard(breed: breed)
                    }
                }.padding(.horizontal)
            }
        }
        .background(AccentColor.color)
        .frame(maxWidth: .infinity)
    }
}

struct BreedList_Previews: PreviewProvider {
    static var previews: some View {
        BreedList()
    }
}
