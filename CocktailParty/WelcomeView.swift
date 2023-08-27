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
                //IMAGE
                Image("welcome")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea([.top,.bottom])
                //BUTTON GROUP
                Group {
                    VStack(alignment: .center, spacing: 10) {
                        // UPPER BUTTON
                        NavigationLink {
                            MainCocktailsView(isAlcoholic: true)
                        } label: {
                            EntranceButton(label: "Alcohol")
                        }
                        // LOWER BUTTON
                        NavigationLink {
                            MainCocktailsView(isAlcoholic: false)
                        } label: {
                            EntranceButton(label: "Alcohol-free")
                        }
                    } //:VSTACK
                    .frame(maxHeight: .infinity, alignment: .bottom)
                } //:GROUP
            } //:ZSTACK
        } //: NAVIGATION
    }
}

//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
