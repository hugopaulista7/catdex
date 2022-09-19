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
        GridItem(.adaptive(minimum: 152))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(viewModel.breeds, id: \.self) { breed in
                    BreedCard(breed: breed).onAppear {
                        viewModel.loadMoreContentIfNeeded(currentItem: breed)
                    }
                }
            }.padding(.all, 16)
            
            if viewModel.loading {
                FurballsProgressView()
            }
            
        }
        .background(Color.accent)
        .frame(maxWidth: .infinity)
    }
}

struct BreedList_Previews: PreviewProvider {
    static var previews: some View {
        BreedList()
    }
}
