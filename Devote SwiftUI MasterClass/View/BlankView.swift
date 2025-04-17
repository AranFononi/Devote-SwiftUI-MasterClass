//
//  BlankView.swift
//  Devote SwiftUI MasterClass
//
//  Created by Aran Fononi on 17/4/25.
//

import SwiftUI

struct BlankView: View {
    var backroundColor: Color
    var backgroundOpacity: Double
    
    
    var body: some View {
        VStack{
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(backroundColor)
        .opacity(backgroundOpacity)
        .blendMode(.overlay)
        .ignoresSafeArea(.all, edges: .all)
    }
}

#Preview {
    BlankView(backroundColor: .black, backgroundOpacity: 0.25)
}
