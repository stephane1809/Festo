//
//  Calculator.swift
//  Festo
//
//  Created by Marília de Sousa on 23/11/22.
//

import Foundation

struct FoodCalculator {
    let totalWeightGuestSalgado = 400
    let totalWeightGuestDoce = 200

    func foodCalculator(numberGuests: Int, selectFood: [FoodModel] ) -> [FoodGuest] {

        if(selectFood.count == 0){
            return []
        }

        var foodGuests: [FoodGuest] = []
        var doceCount: Int = 0
        var salgadoeCount: Int = 0
        for index in 0..<selectFood.count {

            if selectFood[index].foodCategory == "doce" {
                doceCount == doceCount + 1
            } else if selectFood[index].foodCategory == "salgado" {
                salgadoeCount == salgadoeCount + 1
            }
        }

        for index in 0..<selectFood.count{
            if selectFood[index].foodCategory == "doce"{
                var weightTipe: Double = Double(totalWeightGuestDoce / doceCount)

                var units: [Int] =  selectFood.map { food in
                    Int(weightTipe)/Int(food.unitWeight)
                }
                var unitWeights: [Double] = selectFood.map { weight in Double(weight.unitWeight)}
                var names: [String] = selectFood.map { name in String(name.name)}

                var rests: [Int] = selectFood.map { food in
                    Int(weightTipe) % Int(food.unitWeight)
                }



                    let name = names[index]
                    let unitWeight = unitWeights[index]
                    let rest = rests[index]

                    let minPercent = 0.6
                    let acceptUnitWeight = unitWeight * minPercent

                    if Double(rest) >= Double(acceptUnitWeight) {
                        units[index] += 1
                    }
                    var totalUnitsForFood = units[index] * numberGuests
                    var foodGuest = FoodGuest(foodName: names[index], unitForGuest: units[index], totalUnit: totalUnitsForFood)
                    foodGuests.append(foodGuest)


            } else if selectFood[index].foodCategory == "salgado"{
                var weightTipe: Double = Double(totalWeightGuestSalgado / salgadoeCount)

                var units: [Int] =  selectFood.map { food in
                    Int(weightTipe)/Int(food.unitWeight)
                }
                var unitWeights: [Double] = selectFood.map { weight in Double(weight.unitWeight)}
                var names: [String] = selectFood.map { name in String(name.name)}

                var rests: [Int] = selectFood.map { food in
                    Int(weightTipe) % Int(food.unitWeight)
                }

                    let name = names[index]
                    let unitWeight = unitWeights[index]
                    let rest = rests[index]

                    let minPercent = 0.6
                    let acceptUnitWeight = unitWeight * minPercent

                    if Double(rest) >= Double(acceptUnitWeight) {
                        units[index] += 1
                    }
                    var totalUnitsForFood = units[index] * numberGuests
                    var foodGuest = FoodGuest(foodName: names[index], unitForGuest: units[index], totalUnit: totalUnitsForFood)
                    foodGuests.append(foodGuest)
            }
        }

        return foodGuests
    }

}
