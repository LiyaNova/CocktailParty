//
//  MainCocktailView.swift
//  CocktailParty
//
//  Created by Юлия Филимонова on 19.08.2023.
//

import SwiftUI

struct MainCocktailView: View {
    //MARK: - PROPERTIES
    @StateObject var cocktailsFetcher = CocktailsFetcher()
    let isAlcoholic: Bool
    let title: String

    //MARK: - BODY
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                //COCKTAILS COLLECTION
                LazyVGrid(columns: [GridItem(), GridItem()],
                          spacing: 0) {
                    ForEach(cocktailsFetcher.cocktails) { cocktail in
                        CocktailCell(cocktail: cocktail)
                    }
                } //:GRID
            } //:SCROLL
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(AppColors.bronzeOlive, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar { favoritesBarItem }
        } //:NAVIGATION
        .onAppear {
            cocktailsFetcher.fetchCocktails(withAlcohol: isAlcoholic)
        }
    }

    //NAVBAR ITEM
    var favoritesBarItem: ToolbarItem<(), Button<Image>> {
        return ToolbarItem(placement: .navigationBarTrailing) {
            Button {
                //TODO
            } label: {
                Image(systemName: "heart.fill")
            } 
        }
    }
}

 //MARK: - PREVIEW
struct MainCocktailView_Previews: PreviewProvider {
    static var previews: some View {
        MainCocktailView(isAlcoholic: true, title: "Cocktails with alcohol")
    }
}
