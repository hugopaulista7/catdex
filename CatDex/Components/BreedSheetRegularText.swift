//
//  BreedSheetRegularText.swift
//  CatDex
//
//  Created by Hugo Paulista on 21/09/22.
//

import SwiftUI

struct BreedSheetRegularText: View {
    init(_ text: String, _ customColor: Color? = LightColor.color) {
        self.text = text
        if let customColor = customColor {
            self.color = customColor
        }
    }
    
    var text: String
    var color: Color = LightColor.color
    
    var body: some View {
        Text(text).font(.system(size: 20, weight: .regular)).foregroundColor(color)
    }
}

struct BreedSheetRegularText_Previews: PreviewProvider {
    static var previews: some View {
        BreedSheetRegularText("Hello world")
    }
}
