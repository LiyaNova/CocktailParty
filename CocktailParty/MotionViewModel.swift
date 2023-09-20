//
//  MotionViewModel.swift
//  for CocktailParty
//
//  Created by Iuliia Filimonova on 20.09.2023
//
    

import SwiftUI

class MotionViewModel: ObservableObject {

    @Published var circleNumber = Int.random(in: 12...16)
    @Published var isAnimating: Bool = false

    func randomCoordinate(max: CGFloat) -> CGFloat {
       CGFloat.random(in: 0...max)
    }

    func randomSize() -> CGFloat {
        CGFloat(Int.random(in: 10...300))
    }

    func randomScale() -> CGFloat {
        CGFloat(Double.random(in: 0.1...2.0))
    }

    func randomSpeed() -> Double {
        Double.random(in: 0.025...1.0)
    }

    func randomDelay() -> Double {
        Double.random(in: 0...2)
    }

    func randomColor() -> Color? {
        [AppColors.bronzeOlive, AppColors.reefGold, 
         AppColors.sunglow, AppColors.capeHoney, Color.accentColor].randomElement()
    }

}
