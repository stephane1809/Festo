//
//  FoodGest.swift
//  Festo
//
//  Created by Marília de Sousa on 23/11/22.
//

import Foundation

struct FoodGuest {

    var foodName: String
    var unitForGuest: Int
    var totalUnit: Int

    init(foodName: String, unitForGuest: Int, totalUnit: Int) {
        self.foodName = foodName
        self.unitForGuest = unitForGuest
        self.totalUnit = totalUnit
    }

}
