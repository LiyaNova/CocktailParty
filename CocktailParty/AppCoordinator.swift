//
//  AppCoordinator.swift
//  for CocktailParty
//
//  Created by Iuliia Filimonova on 21.09.2023
//

import SwiftUI

class AppCoordinator: CoordinatorProtocol {

    @Published var path = NavigationPath()
    @Published var presentedScreen: ContentLink?
    @Published var coverScreen: ContentLink?

    //MARK: Button action funcs

    func push(_ screen: ContentLink) {
        path.append(screen)
    }

    func presentModally(_ screen: ContentLink) {
        presentedScreen = screen
    }

    func presentFullSreen(_ screen: ContentLink) {
        coverScreen = screen
    }

    func pop() {
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }

    func dismissModalScreen() {
        presentedScreen = nil
    }

    func dismissFullScreen() {
        coverScreen = nil
    }

    //MARK: - ViewBuilder
    @ViewBuilder
    func build(_ screen: ContentLink) -> some View {
        switch screen {
        case .welcomView:
            WelcomeView()
        case .mainView(let value):
            MainCocktailsView(isAlcoholic: value)
        case .detailView(let id):
            DetailCocktailView(cocktailID: id)
        default:
            EmptyView()
        }
    }
}

//MARK: - ContentLink (App screens enum)
enum ContentLink: Hashable, Identifiable {
    case welcomView
    case mainView(withAlcohol: Bool)
    case detailView(id: String? = nil)
    case sheetLink
    case coverLink

    var id: String { String(describing: self) }
}
