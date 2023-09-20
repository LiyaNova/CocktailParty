//
//  BackButtonView.swift
//  CocktailParty
//
//  Created by Юлия Филимонова on 20.08.2023.
//

import SwiftUI

struct BackButtonView: View {
    //MARK: - PROPERTIES
    @Environment(\.dismiss) private var dismiss

    //MARK: - BODY
    var body: some View {
        Button {
            dismiss()
        } label: {
            ZStack {
                Circle()
                    .fill(AppColors.bronzeOlive)
                    .frame(width: Constants.buttonWidth, height: Constants.buttonWidth)
                    .overlay(Circle().stroke(Color.accentColor))
                Image(systemName: Constants.arrowLeft)
                    .imageScale(.small)
                    .foregroundColor(Color.accentColor)
            }
        }
    }

    //MARK: - CONSTANTS
    private struct Constants {
        static let arrowLeft = "chevron.left"
        static let buttonWidth: CGFloat = 26
    }
}

 //MARK: - PREVIEW
struct BackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonView()
            .previewLayout(.fixed(width: 60, height: 60))
            .padding()
    }
}
