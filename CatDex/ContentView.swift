//
//  ContentView.swift
//  CatDex
//
//  Created by Hugo Paulista on 16/09/22.
//

import SwiftUI

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> some UIViewController {
        UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
       if let nc  = uiViewController.navigationController {
            self.configure(nc)
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                MainColor.color.ignoresSafeArea()
                VStack {
                    BreedList()
                }
            }
        .navigationTitle("CatDex")
        .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
