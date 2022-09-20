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
        
        if item.id == breeds.last?.id  {
            fetchData()
        }
    }
    
    private func fetchData() {
        loading = true
        Api().callApi(basePath + "?limit=\(limit)&page=\(currentPage)") {result in
            switch result {
            case .success(let data):
                guard let dataUnwrapped = data else {return}
                self.decode(data: dataUnwrapped)
            case .failure(let error):
                print("Request failed with error: \(error.localizedDescription)")
            }
            
        }

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
                self.loading = false
            }
            
        } catch {
            print(error)
        }
    }
}

