//
//  Calculator.swift
//  Festo
//
//  Created by Marília de Sousa on 23/11/22.
//

import Foundation

struct FoodCalculator {
    var numberGuests: Int = 30
//    var salgadinho = FoodModel(name: "Salgado", unitWeight: 30)

    func foodCalculator(numberGuests: Int, selectFood: [FoodModel] ) -> [FoodGuest] {

        if selectFood.count == 0 {
            return []
        }

        let totalWeightGuest = 400
        let weightTipe: Double = Double(400 / selectFood.count)

        var units: [Int] =  selectFood.map { food in
            Int(weightTipe)/Int(food.unitWeight)
        }
        let unitWeights: [Double] = selectFood.map { weight in Double(weight.unitWeight)}
        let names: [String] = selectFood.map { name in String(name.name)}

        let rests: [Int] = selectFood.map { food in
            Int(weightTipe) % Int(food.unitWeight)
        }

        var foodGuests: [FoodGuest] = []

        for index in 0..<units.count {
            let unitWeight = unitWeights[index]
            let rest = rests[index]

            let minPercent = 0.6
            let acceptUnitWeight = unitWeight * minPercent

            if Double(rest) >= Double(acceptUnitWeight) {
                units[index] += 1
            }
            
            let totalUnitsForFood = units[index] * numberGuests
            let foodGuest = FoodGuest(foodName: names[index], unitForGuest: units[index], totalUnit: totalUnitsForFood)
            foodGuests.append(foodGuest)
        }

        return foodGuests
    }

}
