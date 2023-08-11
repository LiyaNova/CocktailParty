//
//  ContentView.swift
//  CocktailParty
//
//  Created by Юлия Филимонова on 11.08.2023.
//

import SwiftUI

struct ContentView: View {

    let dataFetcher = DataFetcher()

    var body: some View {
        VStack {
            Text("ContentView")
        }
        .padding()
        .onAppear{
            dataFetcher.fetchCocktails()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
