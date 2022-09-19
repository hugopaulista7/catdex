//
//  FurballsProgressView.swift
//  CatDex
//
//  Created by Hugo Paulista on 19/09/22.
//

import SwiftUI

struct FurballsProgressView: View {
    var body: some View {
        ProgressView{
            Text("Fetching furballs...")
        }.progressViewStyle(CircularProgressViewStyle(tint: MainColor.color))
            .foregroundColor(MainColor.color)
    }
}

struct FurballsProgressView_Previews: PreviewProvider {
    static var previews: some View {
        FurballsProgressView()
    }
}
