//
//  DrinkGuest.swift
//  Festo
//
//  Created by Stephane Girão Linhares on 30/11/22.
//

import Foundation
struct DrinkGuest {

    var drinkName: String
    var mlForGuest: Double
    var totalMl: Double

    init(drinkName: String, mlForGuest: Double, totalMl: Double) {
        self.drinkName = drinkName
        self.mlForGuest = mlForGuest
        self.totalMl = totalMl
    }

}
