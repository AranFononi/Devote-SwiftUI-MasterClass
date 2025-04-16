//
//  HideKeyboardExtension.swift
//  Devote SwiftUI MasterClass
//
//  Created by Aran Fononi on 16/4/25.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
