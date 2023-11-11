//
//  WidgetProvider.swift
//  for CocktailParty
//
//  Created by Iuliia Filimonova on 09.11.2023
//
    

import WidgetKit
import SwiftUI

struct CocktailWidgetProvider: TimelineProvider {

    func placeholder(in context: Context) -> CocktailWidgetEntry {
        CocktailWidgetEntry(date: Date(), cocktail: (name: nil, image: nil))
    }

    func getSnapshot(in context: Context, completion: @escaping (CocktailWidgetEntry) -> ()) {
        createTimelineEntry(date: Date(), completion: completion)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<CocktailWidgetEntry>) -> ()) {
        createTimeline(date: Date(), completion: completion)
    }

    //MARK: - FetchData
    let apiService: APIServiceProtocol

    private func createTimelineEntry(date: Date, completion:  @escaping (CocktailWidgetEntry) -> ()) {
        apiService.fetchData(type: Drinks.self, url: URLPath.randomeCocktail) { result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error.description)
                case .success(let cocktail):
                    let entry = CocktailWidgetEntry(date: date, cocktail: (name: getName(of: cocktail),
                                                                           image: getImage(of: cocktail)))
                    completion(entry)
                }
            }
        }
    }

    private func createTimeline(date: Date, completion: @escaping (Timeline<CocktailWidgetEntry>) -> ()) {
        apiService.fetchData(type: Drinks.self, url: URLPath.randomeCocktail) { result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error.description)
                case .success(let cocktail):
                    let entry = CocktailWidgetEntry(date: date, cocktail: (name: getName(of: cocktail),
                                                                           image: getImage(of: cocktail)))
                    let timeline = Timeline(entries: [entry], policy: .never)
                    completion(timeline)
                }
            }
        }
    }

    private func getName(of cocktail: Drinks) -> String? {
        guard let cocktail = cocktail.drinks.first else { return nil}
        return cocktail.name
    }

    private func getImage(of cocktail: Drinks) -> UIImage? {
        guard let cocktail = cocktail.drinks.first else { return nil}
        guard let image =  cocktail.image else { return nil}
        guard let imageURL = URL(string: image) else { return nil}
        do {
            let data = try Data(contentsOf: imageURL)
            return UIImage(data: data)
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }

}
