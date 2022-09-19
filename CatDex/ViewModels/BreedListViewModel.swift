//
//  BreedListViewModel.swift
//  CatDex
//
//  Created by Hugo Paulista on 17/09/22.
//

import Foundation
class BreedListViewModel: ObservableObject {
        
    let basePath = "breeds"
    @Published var breeds: [Breed] = []
    @Published var loading = true
    private var currentPage = 0
    private var canLoadMorPages = true
    private var limit = 16
    
    
    init() {
        fetchData()
    }
    
    func loadMoreContentIfNeeded(currentItem item: Breed?) {
        guard let item = item else {
            fetchData()
            return
        }
        
        let thresholdIndex = breeds.index(breeds.endIndex, offsetBy: -16)
        if breeds.firstIndex(where: {$0.id == item.id}) == thresholdIndex {
            fetchData()
        }
        
    }
    
    private func fetchData() {
        loading = true
        print("currentPage:: \(currentPage) ")
        Api().callApi(basePath + "?limit=\(limit)&page=\(currentPage)", completion: {result in
            switch result {
            case .success(let data):
                guard let dataUnwrapped = data else {return}
                self.decode(data: dataUnwrapped)
            case .failure(let error):
                print("Request failed with error: \(error)")
            }
            
        })

    }
    
    func decode(data: Data) {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let breeds = try decoder.decode([Breed].self, from: data)
            DispatchQueue.main.async {
                self.currentPage += 1
                if (self.breeds.count == 0) {
                    self.breeds = breeds
                } else {
                    self.breeds.append(contentsOf: breeds)
                }
                print("BREEDS::: \(self.breeds)")
                self.loading = false
            }
            
        } catch {
            print(error)
        }
    }
}

