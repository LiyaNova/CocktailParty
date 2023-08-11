//
//  DataFetcher.swift
//  CocktailParty
//
//  Created by Юлия Филимонова on 11.08.2023.
//

import Foundation

class DataFetcher: ObservableObject {

    @Published var cocktails = [Cocktail]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let apiService: APIServiceProtocol

    init(service: APIServiceProtocol = APIService()) {
        self.apiService = service
    }

    func fetchCocktails() {
        isLoading = true
        errorMessage = nil
        
        apiService.fetchData(type: DrinkIngredient.self, url: URLPath.ingridientInfoByName + "Elderflower") { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                     print(error.description)
                    print(error)
                case .success(let cocktails):
//                    self?.cocktails = cocktails.drinks
                    print(cocktails)
                }
            }
        }
    }


    //MARK: preview helpers

    static func errorState() -> DataFetcher {
        let fetcher = DataFetcher()
        fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }

    static func successState() -> DataFetcher {
        let fetcher = DataFetcher ()
//        fetcher.cocktails = [Cocktail.exampleOne(), Cocktail.exampleTwo()]
        return fetcher
    }
}
