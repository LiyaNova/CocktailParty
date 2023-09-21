//
//  RecipeView.swift
//  CocktailParty
//
//  Created by Юлия Филимонова on 27.08.2023.
//

import SwiftUI

struct RecipeView: View {
    //MARK: - PROPERTIES
    let cocktail: Cocktail

    //MARK: - BODY
    var body: some View {
        GroupBox {
            VStack(alignment: .leading, spacing: Constants.vStackSpacing) {
                Text(Constants.instructions)
                    .font(.title3).bold()
                    .foregroundColor(AppColors.reefGold)
                Text(cocktail.instructions ?? "")
                    .foregroundColor(AppColors.capeHoney)

                Divider().background(AppColors.capeHoney)

                Text(Constants.ingredients)
                    .font(.headline).bold()
                    .foregroundColor(AppColors.reefGold)
                if let ingredientInfo = cocktail.ingredientInfo {
                    ForEach(ingredientInfo, id: \.ingridient) { ingridient in
                        IngredientView(ingredient: ingridient)
                    }
                }
            }//:VSTACK
        }//:GROUP
        .padding([.leading,.trailing])
    }

    //MARK: - CONSTANTS
    private struct Constants {
        static let vStackSpacing: CGFloat = 10
        static let instructions = "Instructions:"
        static let ingredients = "Ingredients:"
    }
}

 //MARK: - PREVIEW
struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(cocktail: Cocktail.exampleFullTwo())
    }
}
