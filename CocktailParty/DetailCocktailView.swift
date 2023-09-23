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
    @State var scrollOffset: CGPoint = .zero
    var cocktailID: String? 

    //MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            ScrollView(showsIndicators: false) {
                if let cocktail = cocktailInfo.cocktail {
                    VStack(alignment: .center, spacing: Constants.vStackSpacing) {
                        //IMAGE
                        if let image = cocktail.image {
                            AsyncImage(url: URL(string: image)) { phase in
                                if let image = phase.image {
                                    image.resizable().scaledToFill()
                                } else {
                                    ProgressView().frame(width: Constants.imageWidth, height: Constants.imageWidth)
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
                            .preference(key: ScrollOffsetPreferenceKey.self, value: geometry.frame(in: .named(ScrollOffsetPreferenceKey.detailCocktailViewScrollName)).origin)
                    })
                    .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                        scrollOffset = value
                    }
                }
            } //:SCROLL
            .edgesIgnoringSafeArea(.top)
            .coordinateSpace(name: ScrollOffsetPreferenceKey.detailCocktailViewScrollName)
            .navigationTitle(scrollOffset.y < -geometry.safeAreaInsets.top ? Constants.title : "")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbarBackground(AppColors.bronzeOlive.opacity(Constants.opacity), for: .navigationBar)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    BackButtonView()
                }
            } //:TOOLBAR
        } //:SCROLL GEOMETRY
        .onAppear {
            cocktailInfo.fetchCocktailInfo(with: cocktailID)
        }
    }

    //MARK: - CONSTANTS
    private struct Constants {
        static let vStackSpacing: CGFloat = 20
        static let buttonVStackWidth: CGFloat = 250
        static let imageWidth: CGFloat = 380
        static let opacity: CGFloat = 0.6

        static let title = "Your cocktail"
    }
}

//MARK: - PREVIEW
struct DetailCocktailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailCocktailView(cocktailID: "11007")
        }
    }
}
