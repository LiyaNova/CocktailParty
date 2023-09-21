//
//  MainCocktailsView.swift
//  CocktailParty
//
//  Created by Юлия Филимонова on 19.08.2023.
//

import SwiftUI

struct MainCocktailsView: View {
    //MARK: - PROPERTIES
    @StateObject var cocktailsFetcher = MainCocktailsViewModel()
    let gridLayout = Array(repeating: GridItem(), count: Constants.gridLayoutNumber)
    let isAlcoholic: Bool

    //MARK: - BODY
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                //COCKTAILS COLLECTION
                LazyVGrid(columns: gridLayout) {
                    ForEach(cocktailsFetcher.cocktails) { cocktail in
                        NavigationLink {
                            DetailCocktailView(cocktailID: cocktail.id)
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
                    Text(Constants.title)
                        .font(.headline)
                        .foregroundColor(.accentColor)
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
            Image(systemName: Constants.loupe)
                .foregroundColor(.accentColor)
        }
    }

    var FavoritesButton: some View {
        Button {
            //TODO
        } label: {
            Image(systemName: Constants.favorites)
                .foregroundColor(AppColors.capeHoney)
        }
    }

    //MARK: - CONSTANTS
    private struct Constants {
        static let title = "Your Cocktails"
        static let loupe = "magnifyingglass"
        static let favorites = "heart.fill"

        static let gridLayoutNumber = 2
    }
}

 //MARK: - PREVIEW
struct MainCocktailView_Previews: PreviewProvider {
    static var previews: some View {
        MainCocktailsView(isAlcoholic: true)
    }
}
