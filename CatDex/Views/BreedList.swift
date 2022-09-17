//
//  BreedList.swift
//  CatDex
//
//  Created by Hugo Paulista on 17/09/22.
//

import SwiftUI

struct BreedList: View {
    @StateObject var viewModel: BreedListViewModel = BreedListViewModel()
    
    
    var body: some View {
        if (viewModel.loading) {
            ProgressView{
                Text("Fetching furballs...")
            }.onAppear(perform: viewModel.fetchData)
        } else {
            List(viewModel.breeds) {
                breed in
                HStack {
                    AsyncImage(
                        url: URL(string: breed.image.url),
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 128.0, height: 128.0)
                        },
                        placeholder: {
                            ProgressView().frame(width: 128.0, height: 128.0)
                        }
                    )
                        
                    Text(breed.name).foregroundColor(AccentColor.color)
                }
            }
        }
    }
}

struct BreedList_Previews: PreviewProvider {
    static var previews: some View {
        BreedList()
    }
}
