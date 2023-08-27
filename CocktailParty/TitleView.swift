//
//  TitleView.swift
//  CocktailParty
//
//  Created by Юлия Филимонова on 27.08.2023.
//

import SwiftUI

struct TitleView: View {
    //MARK: - PROPERTIES
    var cocktail: Cocktail

    //MARK: - BODY
    var body: some View {
        VStack(spacing: 8) {
            Text(cocktail.name ?? "")
                .font(.title).bold()
                .multilineTextAlignment(.center)
                .foregroundColor(AppColors.reefGold)
                .underline(color: AppColors.reefGold)
            Text("\(cocktail.category ?? ""),  \(cocktail.isAlcoholic ?? "")")
                .font(.callout)
                .foregroundColor(AppColors.capeHoney)

            HStack {
                Image(systemName: "wineglass")
                    .imageScale(.small)
                    .foregroundColor(AppColors.reefGold)
                Text(cocktail.glassType ?? "")
                    .font(.footnote)
                    .foregroundColor(AppColors.capeHoney)
            }//:HSTACK
            
        }//:VSTACK
    }
}

 //MARK: - PREVIEW
struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(cocktail: Cocktail.exampleFullTwo())
    }
}
