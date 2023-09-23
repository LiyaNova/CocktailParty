//
//  BaseViewModel.swift
//  for CocktailParty
//
//  Created by Iuliia Filimonova on 22.09.2023
//
    
import Foundation

protocol BaseViewModelProtocol: ObservableObject {
    var isLoading: Bool { get set }
    var errorMessage: String? { get set }
    var apiService: APIServiceProtocol { get set }
}
