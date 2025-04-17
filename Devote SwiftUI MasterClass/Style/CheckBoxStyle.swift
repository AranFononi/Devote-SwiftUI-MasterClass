//
//  CheckBoxStyle.swift
//  Devote SwiftUI MasterClass
//
//  Created by Aran Fononi on 17/4/25.
//

import SwiftUI

struct CheckBoxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(configuration.isOn ? .pink : .primary)
                .font(.system(size: 30, weight: .semibold, design: .rounded))
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            configuration.label
        }
    }
}

#Preview {
    Toggle("PlaceHolder", isOn: .constant(true))
        .toggleStyle(CheckBoxStyle())
        .padding()
}
