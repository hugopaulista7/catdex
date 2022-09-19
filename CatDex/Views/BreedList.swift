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
                    BreedCard(breed: breed)
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
