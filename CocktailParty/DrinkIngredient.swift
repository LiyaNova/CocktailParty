//
//  DrinkIngredient.swift
//  CocktailParty
//
//  Created by Юлия Филимонова on 11.08.2023.
//

import Foundation

struct DrinkIngredient: Codable {
    let ingredients: [Ingredient]
}

struct Ingredient: Codable {
    var id: String?
    var ingredient: String?
    var description: String?
    var type: String?
    var isAlcohol: String?
    var abv: String?

    enum CodingKeys: String, CodingKey {
        case id = "idIngredient"
        case ingredient = "strIngredient"
        case description = "strDescription"
        case type = "strType"
        case isAlcohol = "strAlcohol"
        case abv = "strABV"
    }

    static func example() -> Ingredient {
        Ingredient(id: "552", ingredient: "Elderflower cordial", description: "Elderflower cordial is a soft drink made largely from a refined sugar and water solution and uses the flowers of the European elderberry. Historically the cordial has been popular in North Western Europe where it has a strong Victorian heritage.", type: "Cordial", isAlcohol: "No", abv: nil)
    }

}

//[{"idIngredient": "552","strIngredient": "Elderflower cordial","strDescription": "Elderflower cordial is a soft drink made largely from a refined sugar and water solution and uses the flowers of the European elderberry. Historically the cordial has been popular in North Western Europe where it has a strong Victorian heritage.","strType": "Cordial","strAlcohol": "No","strABV": null}]
