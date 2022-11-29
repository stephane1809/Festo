//
//  Calculator.swift
//  Festo
//
//  Created by Marília de Sousa on 23/11/22.
//

import Foundation

struct FoodCalculator {
    var numberGuests: Int = 30
    var salgadinho = FoodModel(name: "Salgado", unitWeight: 30)

    func calculator(numberGuests: Int, selectFood: [FoodModel] ) -> [FoodGuest] {

        let totalWeightGuest = 400
        var weightTipe: Double = Double(400 / selectFood.count)
        
        var units: [Int] =  selectFood.map { food in
            Int(weightTipe)/Int(food.unitWeight)
        }
        var unitWeights: [Double] = selectFood.map { weight in Double(weight.unitWeight)}
        
        var rests: [Int] = selectFood.map { food in
            Int(weightTipe) % Int(food.unitWeight)
        }
        
        for index in 0..<units.count {
            let unitWeight = unitWeights[index]
            let rest = rests[index]
            
            let minPercent = 0.6
            let acceptUnitWeight = unitWeight * minPercent
           
            if Double(rest) >= Double(acceptUnitWeight) {
                units[index] += 1
            }

            
        }
        return []
    }

}
