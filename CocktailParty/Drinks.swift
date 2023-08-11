//
//  Drinks.swift
//  CocktailParty
//
//  Created by Юлия Филимонова on 11.08.2023.
//

import Foundation

struct Drinks: Codable {
    let drinks: [Cocktail]
}

struct Cocktail: Codable {
    var id: String?
    var name: String?
    var image: String?
    var tags: String?
    var video: String?
    var category: String?
    var isAlcoholic: String?
    var glassType: String?
    var instructions: String?
    var ingredientOne: String?
    var ingredientTwo: String?
    var ingredientThree: String?
    var ingredientFour: String?
    var ingredientFive: String?
    var ingredientSix: String?
    var ingredientSeven: String?
    var ingredientEight: String?
    var ingredientNine: String?
    var ingredientTen: String?
    var ingredientEleven: String?
    var ingredientTwelve: String?
    var ingredientThirteen: String?
    var ingredientFourteen: String?
    var ingredientFifteen: String?
    var measureOne: String?
    var measureTwo: String?
    var measureThree: String?
    var measureFour: String?
    var measureFive: String?
    var measureSix: String?
    var measureSeven: String?
    var measureEight: String?
    var measureNine: String?
    var measureTen: String?
    var measureEleven: String?
    var measureTwelve: String?
    var measureThirteen: String?
    var measureFourteen: String?
    var measureFifteen: String?
    var ingredientInfo: [(ingridient: String, measure: String)]?

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try? values.decode(String.self, forKey: .id)
        name = try? values.decode(String.self, forKey: .name)
        image = try? values.decode(String.self, forKey: .image)
        tags = try? values.decode(String.self, forKey: .tags)
        video = try? values.decode(String.self, forKey: .video)
        category = try? values.decode(String.self, forKey: .category)
        isAlcoholic = try? values.decode(String.self, forKey: .isAlcoholic)
        glassType = try? values.decode(String.self, forKey: .glassType)
        instructions = try? values.decode(String.self, forKey: .instructions)
        ingredientOne = try? values.decode(String.self, forKey: .ingredientOne)
        measureOne = try? values.decode(String.self, forKey: .measureOne)
        ingredientTwo = try? values.decode(String.self, forKey: .ingredientTwo)
        measureTwo = try? values.decode(String.self, forKey: .measureTwo)
        ingredientThree = try? values.decode(String.self, forKey: .ingredientThree)
        measureThree = try? values.decode(String.self, forKey: . measureThree)
        ingredientFour = try? values.decode(String.self, forKey: .ingredientFour)
        measureFour = try? values.decode(String.self, forKey: .measureFour)
        ingredientFive = try? values.decode(String.self, forKey: .ingredientFive)
        measureFive = try? values.decode(String.self, forKey: .measureFive)
        ingredientSix = try? values.decode(String.self, forKey: .ingredientSix)
        measureSix = try? values.decode(String.self, forKey: .  measureSix)
        ingredientSeven = try? values.decode(String.self, forKey: .ingredientSeven)
        measureSeven = try? values.decode(String.self, forKey: .measureSeven)
        ingredientEight = try? values.decode(String.self, forKey: .ingredientEight)
        measureEight = try? values.decode(String.self, forKey: .measureEight)
        ingredientNine = try? values.decode(String.self, forKey: .ingredientNine)
        measureNine = try? values.decode(String.self, forKey: .measureNine)
        ingredientTen = try? values.decode(String.self, forKey: .ingredientTen)
        measureTen = try? values.decode(String.self, forKey: .measureTen)
        ingredientEleven = try? values.decode(String.self, forKey: .ingredientEleven)
        measureEleven = try? values.decode(String.self, forKey: . measureEleven)
        ingredientTwelve = try? values.decode(String.self, forKey: .ingredientTwelve)
        measureTwelve = try? values.decode(String.self, forKey: . measureTwelve)
        ingredientThirteen = try? values.decode(String.self, forKey: .ingredientThirteen)
        measureThirteen = try? values.decode(String.self, forKey: .  measureThirteen)
        ingredientFourteen = try? values.decode(String.self, forKey: .ingredientFourteen)
        measureFourteen = try? values.decode(String.self, forKey: .  measureFourteen)
        ingredientFifteen = try? values.decode(String.self, forKey: .ingredientFifteen)
        measureFifteen = try? values.decode(String.self, forKey: .  measureFifteen)

        ingredientInfo = []
        addIngridient(ingredientOne, measureOne)
        addIngridient(ingredientTwo, measureTwo)
        addIngridient(ingredientThree, measureThree)
        addIngridient(ingredientFour, measureFour)
        addIngridient(ingredientFive, measureFive)
        addIngridient(ingredientSix, measureSix)
        addIngridient(ingredientSeven, measureSeven)
        addIngridient(ingredientEight, measureEight)
        addIngridient(ingredientNine, measureNine)
        addIngridient(ingredientTen, measureTen)
        addIngridient(ingredientEleven, measureEleven)
        addIngridient(ingredientTwelve, measureTwelve)
        addIngridient(ingredientThirteen, measureThirteen)
        addIngridient(ingredientFourteen, measureFourteen)
        addIngridient(ingredientFifteen, measureFifteen)
    }

    init(id: String, name: String, image: String) {
        self.id = id
        self.name = name
        self.image = image
    }

    mutating func addIngridient(_ ingridient: String?,_ measure: String?) {
        guard let ingridient = ingridient, let measure = measure else { return }
        ingredientInfo?.append((ingridient: ingridient, measure: measure))
    }

    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case name = "strDrink"
        case image = "strDrinkThumb"
        case tags = "strTags"
        case video = "strVideo"
        case category = "strCategory"
        case isAlcoholic = "strAlcoholic"
        case glassType = "strGlass"
        case instructions = "strInstructions"
        case ingredientOne = "strIngredient1"
        case ingredientTwo = "strIngredient2"
        case ingredientThree = "strIngredient3"
        case ingredientFour = "strIngredient4"
        case ingredientFive = "strIngredient5"
        case ingredientSix = "strIngredient6"
        case ingredientSeven = "strIngredient7"
        case ingredientEight = "strIngredient8"
        case ingredientNine = "strIngredient9"
        case ingredientTen = "strIngredient10"
        case ingredientEleven = "strIngredient11"
        case ingredientTwelve = "strIngredient12"
        case ingredientThirteen = "strIngredient13"
        case ingredientFourteen = "strIngredient14"
        case ingredientFifteen = "strIngredient15"
        case measureOne = "strMeasure1"
        case measureTwo = "strMeasure2"
        case measureThree = "strMeasure3"
        case measureFour = "strMeasure4"
        case measureFive = "strMeasure5"
        case measureSix = "strMeasure6"
        case measureSeven = "strMeasure7"
        case measureEight = "strMeasure8"
        case measureNine = "strMeasure9"
        case measureTen = "strMeasure10"
        case measureEleven = "strMeasure11"
        case measureTwelve = "strMeasure12"
        case measureThirteen = "strMeasure13"
        case measureFourteen = "strMeasure14"
        case measureFifteen = "strMeasure15"
    }


    static func exampleOne() -> Cocktail {
        Cocktail(id: "11009", name: "Moscow Mule", image: "https://www.thecocktaildb.com/images/media/drink/3pylqc1504370988.jpg")
    }

    static func exampleTwo() -> Cocktail {
        Cocktail(id: "11014", name: "Alexander", image: "https://www.thecocktaildb.com/images/media/drink/0clus51606772388.jpg")
    }

}


//Cocktail(id: "11009", name: "Moscow Mule", image: "https://www.thecocktaildb.com/images/media/drink/3pylqc1504370988.jpg", tags: "IBA,ContemporaryClassic", video: nil, category: "Punch / Party Drink", isAlcoholic: "Alcoholic", glassType: "Copper Mug", instructions: "Combine vodka and ginger beer in a highball glass filled with ice. Add lime juice. Stir gently. Garnish.", ingridientOne: "Vodka", ingridientTwo: "Lime juice", ingridientThree: "Ginger ale", ingridientFour: nil, ingridientFive: nil, ingridientSix: nil, ingridientSeven: nil, ingridientEight: nil, ingridientNine: nil, ingridientTen: nil, ingridientEleven: nil, ingridientTwelve: nil, ingridientThirteen: nil, ingridientFourteen: nil, ingridientFifteen: nil, measureOne: "2 oz ", measureTwo: "2 oz ", measureThree: "8 oz ", measureFour: nil, measureFive: nil, measureSix: nil, measureSeven: nil, measureEight: nil, measureNine: nil, measureTen: nil, measureEleven: nil, measureTwelve: nil, measureThirteen: nil, measureFourteen: nil, measureFifteen: nil)
//Cocktail(id: "11014", name: "Alexander", image: "https://www.thecocktaildb.com/images/media/drink/0clus51606772388.jpg", tags: "IBA,Classic,Dairy", video: "https://www.youtube.com/watch?v=qEhRK_v2w2g", category: "Ordinary Drink", isAlcoholic: "Alcoholic", glassType: "Cocktail glass", instructions: "Shake all ingredients with ice and strain contents into a cocktail glass. Sprinkle nutmeg on top and serve.", ingridientOne: "Gin", ingridientTwo: "Creme de Cacao", ingridientThree: "Light cream", ingridientFour: "Nutmeg", ingridientFive: nil, ingridientSix: nil, ingridientSeven: nil, ingridientEight: nil, ingridientNine: nil, ingridientTen: nil, ingridientEleven: nil, ingridientTwelve: nil, ingridientThirteen: nil, ingridientFourteen: nil, ingridientFifteen: nil, measureOne: "1/2 oz ", measureTwo: "1/2 oz white ", measureThree: "2 oz ", measureFour: nil, measureFive: nil, measureSix: nil, measureSeven: nil, measureEight: nil, measureNine: nil, measureTen: nil, measureEleven: nil, measureTwelve: nil, measureThirteen: nil, measureFourteen: nil, measureFifteen: nil)
