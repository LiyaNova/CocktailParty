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
            VStack(alignment: .leading, spacing: 10) {
                Text("Instructions:")
                    .font(.title3).bold()
                    .foregroundColor(AppColors.reefGold)
                Text(cocktail.instructions ?? "")
                    .foregroundColor(AppColors.capeHoney)

                Divider().background(AppColors.capeHoney)

                Text("Ingredients:")
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
}

 //MARK: - PREVIEW
struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(cocktail: Cocktail.exampleFullTwo())
    }
}
