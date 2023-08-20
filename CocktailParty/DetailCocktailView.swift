//
//  DetailCocktailView.swift
//  CocktailParty
//
//  Created by Юлия Филимонова on 20.08.2023.
//

import SwiftUI

struct DetailCocktailView: View {
//MARK: - PROPERTIES
    let cocktail: Cocktail

    //MARK: - BODY
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    //IMAGE
                    if let image = cocktail.image {
                        AsyncImage(url: URL(string: image)) { phase in
                            if let image = phase.image {
                                image.resizable().scaledToFill()
                            } else {
                                ProgressView().frame(width: 300, height: 300)
                            }
                        }
                    }
                    //TITLE
                    //CATEGORY + isALCOHOLIC
                    //TAGS
                    //INSTRUCTIONS
                    // GLASS TYPE
                    //INGREDIENTS

                } //:VSTACK
            } //:SCROLL
            .edgesIgnoringSafeArea(.top)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                        BackButtonView()
                }
            } //:TOOLBAR
        } //:NIVIGATION
    }
}

 //MARK: - PREVIEW
struct DetailCocktailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailCocktailView(cocktail: Cocktail.exampleFullOne())
    }
}
