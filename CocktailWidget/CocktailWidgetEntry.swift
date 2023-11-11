//
//  SimpleEntry.swift
//  for CocktailParty
//
//  Created by Iuliia Filimonova on 09.11.2023
//
    

import WidgetKit
import SwiftUI

struct CocktailWidgetEntry: TimelineEntry {
    let date: Date
    let cocktail: (name: String?, image: UIImage?)
}
