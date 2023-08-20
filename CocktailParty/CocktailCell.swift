//
//  CocktailCell.swift
//  CocktailParty
//
//  Created by Юлия Филимонова on 19.08.2023.
//

import SwiftUI

struct CocktailCell: View {
//MARK: - PROPERTIES
    let cocktail: Cocktail

    //MARK: - BODY
    var body: some View {
        VStack {
            // IMAGE
            if let image = cocktail.image {
                AsyncImage(url: URL(string: image)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFill()
                            .frame(width: 170, height: 220)
                            .cornerRadius(12)
                            .clipped()
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.accentColor,
                                            lineWidth: 0.5))
                    } else {
                        ProgressView()
                            .frame(width: 170, height: 220)
                    }
                }
            }
            // NAME
            HStack {
                if let name = cocktail.name  {
                    Text(name)
                        .font(.subheadline)
                        .fontWeight(.light)
                        .foregroundColor(.accentColor)
                }//:TEXT
                Spacer()
                Button {
                    //TODO
                } label: {
                    Image(systemName: "heart")
                }//:BUTTON
            }
            .frame(height: 30)
            // LINE
            Divider()
                .background(AppColors.capeHoney)

        }//:VSTACK
        .padding()
    }
}

 //MARK: - PREVIEW
struct CocktailRow_Previews: PreviewProvider {
    static var previews: some View {
        CocktailCell(cocktail: Cocktail.exampleTwo())
            .previewLayout(.fixed(width: 170, height: 250))
            .padding()
    }
}
