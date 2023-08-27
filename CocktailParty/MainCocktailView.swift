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
    let title = "Your Cocktails"
    let isAlcoholic: Bool

    //MARK: - BODY
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                //COCKTAILS COLLECTION
                LazyVGrid(columns: [GridItem(), GridItem()],
                          spacing: 0) {
                    ForEach(cocktailsFetcher.cocktails) { cocktail in
                        NavigationLink {
                            DetailCocktailView(cocktail: cocktail)
                        } label: {
                            CocktailCell(cocktail: cocktail)
                        }
                    }
                } //:GRID
            } //:SCROLL
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbarBackground(AppColors.bronzeOlive, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    BackButtonView()
                }
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(AppColors.capeHoney)
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    SearchButton
                    FavoritesButton
                }
            }//:TOOLBAR
        } //:NAVIGATION
        .onAppear {
            cocktailsFetcher.fetchCocktails(withAlcohol: isAlcoholic)
        }
    }

    //TOOLBAR BUTTONS
    var SearchButton: some View {
        Button {
            //TODO
        } label: {
            Image(systemName: "magnifyingglass")
                .foregroundColor(AppColors.capeHoney)
        }
    }

    var FavoritesButton: some View {
        Button {
            //TODO
        } label: {
            Image(systemName: "heart.fill")
                .foregroundColor(AppColors.capeHoney)
        }
    }
}

 //MARK: - PREVIEW
struct MainCocktailView_Previews: PreviewProvider {
    static var previews: some View {
        MainCocktailView(isAlcoholic: true)
    }
}
