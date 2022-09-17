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
        List(viewModel.breeds) {
            breed in
            HStack {
                AsyncImage(url: URL(string: breed.image.url)).frame(width: 32.0, height: 32.0)
                Text(breed.name)
            }
        }.onAppear{viewModel.fetchData()}.foregroundColor(.primary)
    }
}

struct BreedList_Previews: PreviewProvider {
    static var previews: some View {
        BreedList()
    }
}
