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
    
    func fetchData() {
        print("aqui")
        Api().callApi(basePath + "?limit=25&page=0", completion: {result in
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
                self.breeds = breeds
            }
            
        } catch {
            print(error)
        }
    }
}

