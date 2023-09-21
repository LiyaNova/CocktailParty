//
//  CoordinatorProtocol.swift
//  for CocktailParty
//
//  Created by Iuliia Filimonova on 21.09.2023
//
    

import SwiftUI

protocol CoordinatorProtocol: ObservableObject {
    var path: NavigationPath { get set }
    var presentedScreen: ContentLink? { get set }
    var coverScreen: ContentLink? { get set }
}
