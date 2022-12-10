//
//  AlcoholicCalculator.swift
//  Festo
//
//  Created by Stephane Girão Linhares on 30/11/22.
//

import Foundation

struct AlcoholicCalculator {
    var numberGuests: Int = 30
    //    var cerveja = AlcoholicModel(name: "Cerveja", category: "Cevada")
    
    func alcoholicCalculator(numberGuests: Int, selectAlcoholicDrinks: [AlcoholicModel] ) -> [DrinkGuest] {
        
        if selectAlcoholicDrinks.count == 0 {
            return []
        }
        
        var mlTipe: [Double] = selectAlcoholicDrinks.map { mlTipe in 1}
        var mlTotalForDrinks: [Double] = []
        var categorys: [String] = selectAlcoholicDrinks.map {category in String(category.category)}
        var mlForL = 1000
        
        var names: [String] = selectAlcoholicDrinks.map { name in String(name.name)}
        var verificator = 0
        var drinksGuest: [DrinkGuest] = []
        
        for index in 0..<selectAlcoholicDrinks.count {
            if categorys[index] == "Cevada" {
                verificator += 1
            }
        }
        
        for index in 0..<selectAlcoholicDrinks.count {
            if verificator == 1 {
                if selectAlcoholicDrinks.count == 1 {
                    let totalMlGuest = 1500
                    mlTipe[index] = Double(totalMlGuest)
                } else if (selectAlcoholicDrinks.count > 1) && (categorys[index] == "Cevada") {
                    let totalMlGuest = 1280
                    mlTipe[index] = 1150
                } else if (selectAlcoholicDrinks.count > 1) && (categorys[index] == "Destilado") {
                    let totalMlGuest = 1280
                    mlTipe[index] = Double(130 / (selectAlcoholicDrinks.count - 1))
                }
            } else {
                let totalMlGuest = 260
                mlTipe[index] = Double(totalMlGuest) / Double(selectAlcoholicDrinks.count)
            }
            
            var mlTotalForDrink = (Double(mlTipe[index]) * Double(numberGuests)) / Double(mlForL)
            
            mlTotalForDrinks.append(mlTotalForDrink)
            
            var drinkGuest = DrinkGuest(drinkName: names[index], mlForGuest: Double(mlTipe[index]),
                                        totalLitro: Double(mlTotalForDrinks[index]))
            
            drinksGuest.append(drinkGuest)
        }
        
        return drinksGuest
    }
}
