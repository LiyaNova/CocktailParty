//
//  AppCoordinatorView.swift
//  for CocktailParty
//
//  Created by Iuliia Filimonova on 21.09.2023
//

import SwiftUI

struct AppCoordinatorView: View {
    //MARK: - PROPERTIES
    @StateObject private var coordinator = AppCoordinator()

    //MARK: - BODY
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(.welcomView)
                .navigationDestination(for: ContentLink.self) { screen in
                    coordinator.build(screen)
                }
                .sheet(item: $coordinator.presentedScreen) { screen in
                    coordinator.build(screen)
                }
                .fullScreenCover(item: $coordinator.coverScreen) { screen in
                    coordinator.build(screen)
                }
        }
        .environmentObject(coordinator)
    }
}

