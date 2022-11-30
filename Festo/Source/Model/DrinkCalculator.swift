//
//  DrinkCalculator.swift
//  Festo
//
//  Created by Stephane Girão Linhares on 30/11/22.
//

import Foundation
struct DrinkCalculator {
    var numberGuests: Int = 30
    var refrigerante = DrinkModel(name: "refri", percentForGuestWithOther: 0.73)

    func drinkCalculator(numberGuests: Int, selectDrinks: [DrinkModel] ) -> [DrinkGuest] {

        let totalWeightGuest = 750
        var mlTipe: [Double] = []
        var mlTotalForDrinks: [Double] = []
        var percentsMlWithOther: [Double] = selectDrinks.map {percent in Double(percent.percentForGuestWithOther)}

        var names: [String] = selectDrinks.map { name in String(name.name)}
        var drinksGuest: [DrinkGuest] = []

        for index in 0..<selectDrinks.count {
            let percent = percentsMlWithOther[index]
            let name = names[index]

            if(selectDrinks.count > 1){
                mlTipe[index] = Double(totalWeightGuest) * Double(percentsMlWithOther[index])
            }
            else {
                mlTipe[index] = Double(totalWeightGuest)
            }

            var mlTotalForDrink = Double(mlTipe[index]) * Double(numberGuests)

            mlTotalForDrinks.append(mlTotalForDrink)

            var drinkGuest = DrinkGuest(drinkName: names[index], mlForGuest: Double(mlTipe[index]), totalMl: Double(mlTotalForDrinks[index]))
            drinksGuest.append(drinkGuest)
        }

        return drinksGuest
    }

}

//        var foodGuests: [FoodGuest] = []
//
//        for index in 0..<units.count {
//            let name = names[index]
//            let unitWeight = unitWeights[index]
//            let rest = rests[index]
//
//            let minPercent = 0.6
//            let acceptUnitWeight = unitWeight * minPercent
//
//            if Double(rest) >= Double(acceptUnitWeight) {
//                units[index] += 1
//            }
//
//            var foodGuest = FoodGuest(foodName: names[index], unitForGuest: Int(unitWeights[index]), totalUnit: units[index])
//            foodGuests.append(foodGuest)
//
//        }
//
//        return foodGuests
