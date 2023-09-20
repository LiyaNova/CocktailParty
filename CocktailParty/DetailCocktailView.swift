//
//  DetailCocktailView.swift
//  CocktailParty
//
//  Created by Юлия Филимонова on 20.08.2023.
//

import SwiftUI

struct DetailCocktailView: View {
//MARK: - PROPERTIES
    @StateObject var cocktailInfo = DetailCocktailViewModel()
    @State var isRandomCocktail = false
    @State var scrollOffset: CGPoint = .zero
    var cocktailID: String

    //MARK: - BODY
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                if let cocktail = cocktailInfo.cocktail {
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
                        //TITLE + CATEGORY
                        TitleView(cocktail: cocktail)
                        //INSTRUCTIONS + INGREDIENTS:
                        RecipeView(cocktail: cocktail)
                        //VIDEO
                        if let videoLink = cocktail.video {
                            VideoLinkView(link: videoLink)
                        } else {
                            EmptyView()
                        }
                    } //:VSTACK
                    .background(GeometryReader { geometry in
                        Color.clear
                        .preference(key: ScrollOffsetPreferenceKey.self, value: geometry.frame(in: .named("scroll")).origin)
                    })
                    .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                        self.scrollOffset = value
                    }
                }
            } //:SCROLL
            .edgesIgnoringSafeArea(.top)
            .coordinateSpace(name: "scroll")
            .navigationTitle(scrollOffset.y < -100 ? "Your cocktail" : "")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbarBackground(AppColors.bronzeOlive.opacity(0.6), for: .navigationBar)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                        BackButtonView()
                }
            } //:TOOLBAR
        } //:NAVIGATION
        .onAppear {
            cocktailInfo.fetchCocktailInfo(with: cocktailID)
        }
    }
}

 //MARK: - PREVIEW
struct DetailCocktailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailCocktailView(cocktailID: "11007")
    }
}
