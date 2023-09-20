//
//  WelcomeView.swift
//  CocktailParty
//
//  Created by Юлия Филимонова on 11.08.2023.
//

import SwiftUI

struct WelcomeView: View {
    //MARK: - PROPERTIES

    //MARK: - BODY
    var body: some View {
        NavigationStack {
            ZStack {
                MotionView()

                Group {
                    VStack(alignment: .center, spacing: Constants.mainVStackSpacing) {
                        //LOGO
                        Image(Constants.logoImage)
                            .resizable()
                            .frame(width: Constants.imageWidth, height: Constants.imageWidth)
                            .clipShape(Circle())
                            .overlay {
                                Circle().strokeBorder(Color.accentColor,lineWidth: Constants.borderlineWidth)}
                        //TITLE
                        Text(Constants.titleText.uppercased())
                            .font(.title)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(Color.accentColor)
                        //BUTTONS STACK
                        VStack(alignment: .center, spacing: Constants.buttonVStackSpacing) {
                            //UPPER BUTTON
                            NavigationLink {
                                MainCocktailsView(isAlcoholic: true)
                            } label: {
                                EntranceButton(label: Constants.alcoholParty)
                            }
                            //CENTER BUTTON
                            NavigationLink {
                                MainCocktailsView(isAlcoholic: false)
                            } label: {
                                EntranceButton(label: Constants.alcoholFreeParty)
                            }
                            //LOWER BUTTON
                            NavigationLink {
                                //TODO
                            } label: {
                                EntranceButton(label: Constants.randomCocktail)
                            }
                        }//:VSTACK
                        .frame(width: Constants.buttonVStackWidth)
                    } //:VSTACK
                } //:GROUP
            } //:ZSTACK
        } //: NAVIGATION
    }
    //MARK: - CONSTANTS
    private struct Constants {
        static let mainVStackSpacing: CGFloat = 23
        static let buttonVStackSpacing: CGFloat = 12
        static let buttonVStackWidth: CGFloat = 250
        static let imageWidth: CGFloat = 150
        static let borderlineWidth: CGFloat = 3

        static let logoImage = "cocktailParty"
        static let alcoholParty = "Alcohol"
        static let alcoholFreeParty = "Alcohol-free"
        static let randomCocktail = "Random"
        static let titleText = """
                               Choose
                               cocktail party
                               """
    }
}

//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
