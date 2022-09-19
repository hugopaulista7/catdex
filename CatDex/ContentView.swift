//
//  ContentView.swift
//  CatDex
//
//  Created by Hugo Paulista on 16/09/22.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor(Color.primary)
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(Color.light)]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(Color.secondary)]
        navBarAppearance.shadowColor = UIColor.black
        
        let navScrollAppearance = UINavigationBarAppearance()
        
        navScrollAppearance.titleTextAttributes = [.foregroundColor: UIColor(Color.primary)]
        navScrollAppearance.backgroundColor = UIColor(Color.accent)
        navScrollAppearance.shadowColor = UIColor(Color.accent)
        
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navScrollAppearance
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    BreedList()
                }
            }.background(Color.accent)
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
