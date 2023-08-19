//
//  EntranceButton.swift
//  CocktailParty
//
//  Created by Юлия Филимонова on 19.08.2023.
//

import SwiftUI

struct EntranceButton: View {
    //MARK: - PROPERTIES
    let label: String

    //MARK: - BODY
    var body: some View {
        // Button properties
        let buttonShape = Capsule()
            .strokeBorder(Color.accentColor,lineWidth: 1.25)
            .background(Capsule().fill(AppColors.zeus).opacity(0.7))
        let buttonFont = Font.system(size: 33, weight: .light, design: .serif)
        // BUTTON
        Text(label)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .foregroundColor(AppColors.sunglow)
            .font(buttonFont)
            .background(buttonShape)
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
