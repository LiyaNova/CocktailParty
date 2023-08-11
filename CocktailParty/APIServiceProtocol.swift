//
//  APIServiceProtocol.swift
//  CocktailParty
//
//  Created by Юлия Филимонова on 11.08.2023.
//

import Foundation

protocol APIServiceProtocol {
    func fetchData<T: Decodable>(type: T.Type, url: String, completion: @escaping (Result<T, APIError>) -> Void)
}
