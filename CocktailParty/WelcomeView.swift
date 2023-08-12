//
//  WelcomeView.swift
//  CocktailParty
//
//  Created by Юлия Филимонова on 11.08.2023.
//

import SwiftUI

struct WelcomeView: View {
    //MARK: - PROPERTIES
    let dataFetcher = DataFetcher()

    //MARK: - BODY
    var body: some View {
        ZStack {
            Image("welcome")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea([.top,.bottom])

            Group {
                VStack(alignment: .center, spacing: 10) {
                    // Button properties
                    let buttonShape = Capsule()
                        .strokeBorder(AppColors.islandSpice,lineWidth: 1.25)
                        .background(Capsule().fill(AppColors.zeus).opacity(0.7))
                    let buttonFont = Font.system(size: 33, weight: .light, design: .serif)

                    //Upper button
                    Button {
                        dataFetcher.fetchCocktails(withAlcohol: true)
                    } label: {
                        Text("Alcohol")
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .font(buttonFont)
                            .background(buttonShape)
                    }

                    // Lower button
                    Button {
                        dataFetcher.fetchCocktails(withAlcohol: false)
                    } label: {
                        Text("Alcohol-free")
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .font(buttonFont)
                            .background(buttonShape)
                    }
                } //:VSTACK
                .frame(maxHeight: .infinity, alignment: .bottom)
            } //:GROUP
        } //:ZSTACK
    }
}

 //MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
