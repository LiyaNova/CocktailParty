//
//  EntranceButton.swift
//  CocktailParty
//
//  Created by Юлия Филимонова on 19.08.2023.
//

import SwiftUI

struct EntranceButton: View {
    //MARK: - PROPERTIES
    var label: String

    //MARK: - BODY
    var body: some View {
        // Button properties
        let buttonShape = Capsule()
            .strokeBorder(AppColors.capeHoney,lineWidth: Constants.borderlineWidth)
            .background(Capsule().fill(AppColors.zeus).opacity(Constants.opacity))
        let buttonFont = Font.system(size: Constants.fontSize, weight: .light, design: .serif)
        // BUTTON
        HStack {
            Spacer()
            Text(label.uppercased())
            Spacer()
        }
        .padding(.vertical, Constants.buttonPadding)
        .foregroundColor(AppColors.sunglow)
        .font(buttonFont)
        .background(buttonShape)
    }

    //MARK: - CONSTANTS
    private struct Constants {
        static let buttonPadding: CGFloat = 10
        static let fontSize: CGFloat = 20
        static let opacity: CGFloat = 0.7
        static let borderlineWidth: CGFloat = 1.25
    }
}

 //MARK: - PREVIEW
struct EntranceButton_Previews: PreviewProvider {
    static var previews: some View {
        EntranceButton(label: "Alcohol")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
