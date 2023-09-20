//
//  CocktailCell.swift
//  CocktailParty
//
//  Created by Юлия Филимонова on 19.08.2023.
//

import SwiftUI

struct CocktailCell: View {
    //MARK: - PROPERTIES
    @State var isLiked = false // demo purpose
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
                            .frame(width: Constants.imageWidth, height: Constants.imageHeight)
                            .cornerRadius(Constants.corenerRadius)
                            .clipped()
                            .overlay(
                                RoundedRectangle(cornerRadius: Constants.corenerRadius)
                                    .stroke(Color.accentColor,
                                            lineWidth: Constants.borderLineWidth))
                    } else {
                        ProgressView()
                            .frame(width: Constants.imageWidth, height: Constants.imageHeight)
                    }
                }
            }
            // NAME
            HStack {
                Text(cocktail.name ?? "")
                    .font(.subheadline)
                    .fontWeight(.light)
                    .foregroundColor(.accentColor)
                Spacer()
                Button {
                    isLiked.toggle()
                } label: {
                    !isLiked ? Image(systemName: Constants.emptyLike) : Image(systemName: Constants.fillLike)
                }
                .foregroundColor(AppColors.capeHoney)
            }//:HSTACK
            .frame(height: Constants.hStackHeight)
            // LINE
            Divider()
                .background(AppColors.capeHoney)

        }//:VSTACK
        .padding()
    }

    //MARK: - CONSTANTS
    private struct Constants {
        static let hStackHeight: CGFloat = 30
        static let imageWidth: CGFloat = 170
        static let imageHeight: CGFloat = 220
        static let corenerRadius: CGFloat = 12
        static let borderLineWidth: CGFloat = 0.5

        static let emptyLike = "heart"
        static let fillLike = "heart.fill"
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
