//
//  DrinkCalculator.swift
//  Festo
//
//  Created by Stephane Girão Linhares on 30/11/22.
//

import Foundation

struct DrinkCalculator {
    var numberGuests: Int = 30
    var refrigerante = DrinkModel(name: "Refri", percentForGuestWithOther: 0.73)
    var suco = DrinkModel(name: "Suco", percentForGuestWithOther: 0.27)
    var mlForL = 1000

    func drinkCalculator(numberGuests: Int, selectDrinks: [DrinkModel] ) -> [DrinkGuest] {

        if(selectDrinks.count == 0){
            return []
        }

        let totalMlGuest = 750
        let mlAgua = 200

        var mlTipe: [Double] = selectDrinks.map{mlTipe in mlTipe.percentForGuestWithOther * Double(totalMlGuest)}
        var litroTotalForDrinks: [Double] = []
        var percentsMlWithOther: [Double] = selectDrinks.map {percent in Double(percent.percentForGuestWithOther)}

        var names: [String] = selectDrinks.map { name in String(name.name)}
        var drinksGuest: [DrinkGuest] = []
        var verificator = 0

        for index in 0..<selectDrinks.count {
            if(names[index] == "Água"){
                verificator += 1
            }
        }

        for index in 0..<selectDrinks.count {
            if((verificator == 1) && (names[index] == "Água")){
                mlTipe[index] = Double(mlAgua)
            } else if((verificator == 1) && (names[index] != "Água") && (selectDrinks.count == 2)){
                mlTipe[index] = Double(totalMlGuest)
            } else if((verificator == 1) && (names[index] != "Água") && (selectDrinks.count > 2)){
                mlTipe[index] = Double(totalMlGuest) * Double(percentsMlWithOther[index])
            } else if((verificator == 0) && (selectDrinks.count > 1)) {
                mlTipe[index] = Double(totalMlGuest) * Double(percentsMlWithOther[index])
            } else if((verificator == 0) && (selectDrinks.count == 1)) {
                mlTipe[index] = Double(totalMlGuest)
            }
            var litroTotalForDrink = (Double(mlTipe[index]) * Double(numberGuests)) / Double(mlForL)

            litroTotalForDrinks.append(litroTotalForDrink)

            var drinkGuest = DrinkGuest(drinkName: names[index], mlForGuest: Double(mlTipe[index]), totalLitro: Double(litroTotalForDrinks[index]))
            drinksGuest.append(drinkGuest)
        }

        return drinksGuest
    }

}

//struct DrinkCalculator {
//    var numberGuests: Int = 30
//    var refrigerante = DrinkModel(name: "Refri", percentForGuestWithOther: 0.73)
//    var suco = DrinkModel(name: "Suco", percentForGuestWithOther: 0.27)
//
//    func drinkCalculator(numberGuests: Int, selectDrinks: [DrinkModel] ) -> [DrinkGuest] {
//
//        if(selectDrinks.count == 0){
//            return []
//        }
//
//        let totalMlGuest = 750
//        let mlAgua = 200
//        var mlTipe: [Double] = selectDrinks.map {mlTipe in mlTipe.percentForGuestWithOther * Double(totalMlGuest)}
//        var mlTotalForDrinks: [Double] = []
//        var percentsMlWithOther: [Double] = selectDrinks.map {percent in Double(percent.percentForGuestWithOther)}
//
//        var names: [String] = selectDrinks.map { name in String(name.name)}
//        var drinksGuest: [DrinkGuest] = []
//        var verificator = 0
//
//        for index in 0..<selectDrinks.count {
//            if(names[index] == "Água"){
//                verificator += 1
//            }
//        }
//
//        for index in 0..<selectDrinks.count {
//            if((verificator == 1) && (names[index] == "Água")){
//                mlTipe[index] = Double(mlAgua)
//            } else if((verificator == 1) && (names[index] != "Água") && (selectDrinks.count == 2)){
//                mlTipe[index] = Double(totalMlGuest)
//            } else if((verificator == 1) && (names[index] != "Água") && (selectDrinks.count > 2)){
//                mlTipe[index] = Double(totalMlGuest) * Double(percentsMlWithOther[index])
//            } else if((verificator == 0) && (selectDrinks.count > 1)) {
//                mlTipe[index] = Double(totalMlGuest) * Double(percentsMlWithOther[index])
//            } else if((verificator == 0) && (selectDrinks.count == 1)) {
//                mlTipe[index] = Double(totalMlGuest)
//            }
//            var mlTotalForDrink = Double(mlTipe[index]) * Double(numberGuests)
//
//            mlTotalForDrinks.append(mlTotalForDrink)
//
//            var drinkGuest = DrinkGuest(drinkName: names[index], mlForGuest: Double(mlTipe[index]), totalMl: Double(mlTotalForDrinks[index]))
//            drinksGuest.append(drinkGuest)
//        }
//
//        return drinksGuest
//    }
//
//}
