//
//  APIService.swift
//  CocktailParty
//
//  Created by Юлия Филимонова on 11.08.2023.
//

import Foundation

struct APIService: APIServiceProtocol {

    func fetchData<T>(type: T.Type, url: String, completion: @escaping (Result<T, APIError>) -> Void) where T : Decodable {
        guard let url = URL(string: URLPath.baseURL + url) else {
            let error = APIError.badURL
            completion(.failure(error))
            return
        }
        let task = URLSession.shared.dataTask(with: url) {(data , response, error) in
            if let error = error as? URLError {
                completion(.failure(.url(error)))
            } else if  let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(.failure(.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(type, from: data)
                    completion(.success(result))
                }catch {
                    completion(.failure(.parsing(error as? DecodingError)))
                }
            }
        }
        task.resume()
    }
    
}

struct URLPath {
    static let baseURL = "https://www.thecocktaildb.com/api/json/v1/1/"
    static let alcoholicCocktail = "filter.php?a=Alcoholic"
    static let nonAlcoholicCocktail = "filter.php?a=Non_Alcoholic"
    static let randomeCocktail = "random.php"
    static let detailInfo = "lookup.php?i="
    static let searchByName = "search.php?s="
    static let ingridientInfoByName = "search.php?i="
    static let searchByIngridientName = "filter.php?i="
}
