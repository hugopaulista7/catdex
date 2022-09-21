//
//  Stars.swift
//  CatDex
//
//  Created by Hugo Paulista on 20/09/22.
//

import SwiftUI

struct Stars: View {
    
    var rating: Int
    
    var body: some View {
        HStack(spacing: 16) {
            
            ForEach(1...rating, id: \.self) { _ in
                Image("Star Filled Outline").resizable().frame(width: 16, height: 16)
            }
            if rating < 5 {
                ForEach(1...5-rating, id: \.self) { _ in
                    Image("Star Outline").resizable().frame(width: 16, height: 16)
                }
            }
        }
    }
}

struct Stars_Previews: PreviewProvider {
    static var previews: some View {
        Stars(rating: 3)
    }
}
