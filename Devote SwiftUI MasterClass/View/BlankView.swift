//
//  BlankView.swift
//  Devote SwiftUI MasterClass
//
//  Created by Aran Fononi on 17/4/25.
//

import SwiftUI

struct BlankView: View {
    var body: some View {
        VStack{
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(.black)
        .opacity(0.25)
        .ignoresSafeArea(.all, edges: .all)
    }
}

#Preview {
    BlankView()
}
