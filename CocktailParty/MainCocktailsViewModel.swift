//
//  MainCocktailsViewModel.swift
//  CocktailParty
//
//  Created by Юлия Филимонова on 11.08.2023.
//

import Foundation

class MainCocktailsViewModel: BaseViewModelProtocol {

    @Published var cocktails = [Cocktail]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    var apiService: APIServiceProtocol

    init(service: APIServiceProtocol = APIService()) {
        self.apiService = service
    }

    func fetchCocktails(withAlcohol: Bool) {
        var url: String { withAlcohol ? URLPath.alcoholicCocktail : URLPath.nonAlcoholicCocktail }
        isLoading = true
        errorMessage = nil
        
        apiService.fetchData(type: Drinks.self, url: url) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    print(error.description)
                case .success(let cocktails):
                    self?.cocktails = cocktails.drinks
                }
            }
        }
    }

    //MARK: preview helpers

    static func errorState() -> MainCocktailsViewModel {
        let fetcher = MainCocktailsViewModel()
        fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }

    static func successState() -> MainCocktailsViewModel {
        let fetcher = MainCocktailsViewModel()
        fetcher.cocktails = [Cocktail.exampleOne(), Cocktail.exampleTwo()]
        return fetcher
    }
}
