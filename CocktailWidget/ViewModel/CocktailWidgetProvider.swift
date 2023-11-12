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
        CocktailWidgetEntry(date: Date(), cocktail: (name: "Cocktail Party", image: UIImage(named: "logo")))
    }

    func getSnapshot(in context: Context, completion: @escaping (CocktailWidgetEntry) -> ()) {
        createSnapshotEntry(date: Date(), completion: completion)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<CocktailWidgetEntry>) -> ()) {
        createEntryTimeline(date: Date(), completion: completion)
    }

    //MARK: - FetchData
    let apiService: APIServiceProtocol

    init(apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }

    private func createSnapshotEntry(date: Date, completion:  @escaping (CocktailWidgetEntry) -> ()) {
        fetchCocktail { cocktail in
            let entry = CocktailWidgetEntry(date: date, cocktail: (name: getName(of: cocktail),
                                                                   image: getImage(of: cocktail)))
            completion(entry)
        }
    }

    private func createEntryTimeline(date: Date, completion: @escaping (Timeline<CocktailWidgetEntry>) -> ()) {
        fetchCocktail { cocktail in
            var entries = [CocktailWidgetEntry]()
            for dayOffset in 0..<7 {
                let entryDate = Calendar.current.date(byAdding: .day, value: dayOffset, to: Date())!
                let startOfDate = Calendar.current.startOfDay(for: entryDate)
                let entry = CocktailWidgetEntry(date: startOfDate, cocktail: (name: getName(of: cocktail),
                                                                              image: getImage(of: cocktail)))
                entries.append(entry)
            }
            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
    }

    private func fetchCocktail(completion: @escaping (Drinks) -> ()) {
        apiService.fetchData(type: Drinks.self, url: URLPath.randomeCocktail) { result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error.description)
                case .success(let cocktail):
                    completion(cocktail)
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
