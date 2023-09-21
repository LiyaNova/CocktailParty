//
//  ScrollOffsetPreferenceKey.swift
//  CocktailParty
//
//  Created by Юлия Филимонова on 29.08.2023.
//

import SwiftUI

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero
    static let detailCocktailViewScrollName = "detailCocktailViewScroll"

    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
    }
}
