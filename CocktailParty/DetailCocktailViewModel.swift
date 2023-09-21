//
//  DetailCocktailViewModel.swift
//  CocktailParty
//
//  Created by Юлия Филимонова on 27.08.2023.
//

import Foundation

class DetailCocktailViewModel: ObservableObject {

    @Published var cocktail: Cocktail?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let apiService: APIServiceProtocol

    init(service: APIServiceProtocol = APIService()) {
        self.apiService = service
    }

    func fetchCocktailInfo(with id: String?) {
        let url = (id != nil) ? URLPath.detailInfo + id! : URLPath.randomeCocktail
        isLoading = true
        errorMessage = nil
        
        apiService.fetchData(type: Drinks.self, url: url) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    print(error.description)
                case .success(let cocktail):
                    self?.cocktail = cocktail.drinks.first
                }
            }
        }
    }

    //MARK: preview helpers

    static func errorState() -> DetailCocktailViewModel {
        let fetcher = DetailCocktailViewModel()
        fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }

    static func successState() -> DetailCocktailViewModel {
        let fetcher = DetailCocktailViewModel()
        fetcher.cocktail = Cocktail.exampleFullOne()
        return fetcher
    }
}
