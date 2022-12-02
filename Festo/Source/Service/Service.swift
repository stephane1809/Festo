//
//  Service.swift
//  Festo
//
//  Created by Stephane Girão Linhares on 24/11/22.
//

import Foundation

var foods: [FoodModel] = [FoodModel(name: "Salgadinho", unitWeight: 30),
                          FoodModel(name: "Mini Pizza", unitWeight: 40),
                          FoodModel(name: "Mini Hot-dog", unitWeight: 40),
                          FoodModel(name: "Mini Hambúrguer", unitWeight: 40),
                          FoodModel(name: "Esfirra", unitWeight: 75)]

var drinks: [DrinkModel] = [DrinkModel(name: "Refrigerante", percentForGuestWithOther: 0.73),
                            DrinkModel(name: "Suco", percentForGuestWithOther: 0.27),
                            DrinkModel(name: "Água", percentForGuestWithOther: 1)]

var alcoholicDrinks: [AlcoholicModel] = [AlcoholicModel(name: "Cerveja", category: "Cevada"),
                                        AlcoholicModel(name: "Vodka", category: "Destilado"),
                                        AlcoholicModel(name: "Cachaça", category: "Destilado"),
                                        AlcoholicModel(name: "Gin", category: "Destilado")]
