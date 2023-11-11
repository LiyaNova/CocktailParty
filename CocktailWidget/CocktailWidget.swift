//
//  CocktailWidget.swift
//  for CocktailParty
//
//  Created by Iuliia Filimonova on 09.11.2023
//
    

import WidgetKit
import SwiftUI

struct CocktailWidget: Widget {
    let kind: String = Constants.kind

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: CocktailWidgetProvider(apiService: APIService())) { entry in
            if #available(iOS 17.0, *) {
                CocktailWidgetEntryView(entry: entry)
                    .containerBackground(.background, for: .widget)
            } else {
                CocktailWidgetEntryView(entry: entry)
            }
        }
        .contentMarginsDisabled()
        .configurationDisplayName(Constants.displayName)
        .description(Constants.description)
    }

    //MARK: - CONSTANTS
    private struct Constants {
        static let kind = "CocktailWidget"
        static let displayName = "CocktailParty App Widget"
        static let description = "Meet cocktail of a day!"
    }
}

