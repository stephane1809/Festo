//
//  Calculator.swift
//  Festo
//
//  Created by Marília de Sousa on 23/11/22.
//

import Foundation

struct FoodCalculator {
    var numberGuests: Int = 30
    var foodsModel = FoodModel(name: "Salgado", unitWeight: 30)

    func calculator(numberGuests: Int, selectFood: [FoodModel] ) -> [FoodGuest] {

        let totalWeightGuest = 400
        var weightTipe: Double = Double(400 / selectFood.count)
//        var units: Int = Int(weightTipe) / foodsModel.unitWeight
        
        var units: [Int] =  selectFood.map { food in
            Int(weightTipe)/Int(food.unitWeight)
        }
        var rest: [Int] = selectFood.map { food in
            Int(weightTipe) % Int(food.unitWeight)
        }

//        if(rest.map { rest in I} >= (Int(0.6) * foodsModel.unitWeight)) {
//            units = units + 1
//        }
        var guest = [FoodGuest(food: <#T##FoodModel#>, unitForGuest: <#T##Int?#>, weightForGuest: <#T##Int?#>, totalWeight: <#T##Int?#>, totalUnit: <#T##Int?#>)]
        return guest
    }

}
