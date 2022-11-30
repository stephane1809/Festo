//
//  AlcoholicCalculator.swift
//  Festo
//
//  Created by Stephane Girão Linhares on 30/11/22.
//

import Foundation

struct AlcoholicCalculator {
    var numberGuests: Int = 30
    var cerveja = AlcoholicModel(name: "cerveja", percentForGuestWithBeer: 0.85)

    func alcoholicCalculator(numberGuests: Int, selectAlcoholicDrinks: [AlcoholicModel] ) -> [DrinkGuest] {

        var mlTipe: [Double] = []
        var mlTotalForDrinks: [Double] = []
        var percentsMlWithBeer: [Double] = selectAlcoholicDrinks.map {percent in Double(percent.percentForGuestWithBeer)}

        var names: [String] = selectAlcoholicDrinks.map { name in String(name.name)}
        var drinksGuest: [DrinkGuest] = []

        for index in 0..<selectAlcoholicDrinks.count {
            let percent = percentsMlWithBeer[index]
            let name = names[index]

            if((names[index] == "Cerveja") && (selectAlcoholicDrinks.count == 1)){
                let totalMlGuest = 1500
                mlTipe[index] = Double(totalMlGuest)
            }
            else if((names[index] == "Cerveja") && (selectAlcoholicDrinks.count > 1)) {
                let totalMlGuest = 1760
                mlTipe[index] = Double(totalMlGuest) * Double(percentsMlWithBeer[index])
            }
            else if(names[index] != "Cerveja"){
                let totalMlGuest = 260
                mlTipe[index] = Double(totalMlGuest / selectAlcoholicDrinks.count)
            }

            var mlTotalForDrink = Double(mlTipe[index]) * Double(numberGuests)

            mlTotalForDrinks.append(mlTotalForDrink)

            var drinkGuest = DrinkGuest(drinkName: names[index], mlForGuest: Double(mlTipe[index]), totalMl: Double(mlTotalForDrinks[index]))
            drinksGuest.append(drinkGuest)
        }
        return []
    }
}
