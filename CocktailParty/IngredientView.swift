//
//  IngredientView.swift
//  CocktailParty
//
//  Created by Юлия Филимонова on 26.08.2023.
//

import SwiftUI

struct IngredientView: View {
    //MARK: - PROPERTIES
    let ingredient: (ingridient: String, measure: String?)

    //MARK: - BODY
    var body: some View {
        HStack {
            Group {
                InfoButton
                Text(ingredient.ingridient)
            }//:GROUP
            Spacer(minLength: 25)
            Text(ingredient.measure ?? "")
        }//:HSTACK
        .foregroundColor(AppColors.capeHoney)
    }

    var InfoButton: some View {
        Button {
            //TODO
        } label: {
            Image(systemName: "info.circle")
                .foregroundColor(AppColors.sunglow)
        }
    }
}
 //MARK: - PREVIEW
struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientView(ingredient: Cocktail.exampleFullOne().ingredientInfo![0])
            .previewLayout(.fixed(width: 300, height: 80))
    }
}
