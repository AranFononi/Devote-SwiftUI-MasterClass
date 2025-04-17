//
//  BackgroundImageView.swift
//  Devote SwiftUI MasterClass
//
//  Created by Aran Fononi on 17/4/25.
//

import SwiftUI

struct BackgroundImageView: View {
    var body: some View {
        Image("rocket")
            .antialiased(true)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea(.all)
    }
}

#Preview {
    BackgroundImageView()
}
