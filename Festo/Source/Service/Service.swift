//
//  Service.swift
//  Festo
//
//  Created by Stephane Girão Linhares on 24/11/22.
//

import Foundation

var foods: [FoodModel] = [FoodModel(name: "Salgadinho", unitWeight: 30, imageFood: "salgados"),
                          FoodModel(name: "Pizza", unitWeight: 75, imageFood: "pizza"),
                          FoodModel(name: "Mini Pizza", unitWeight: 40, imageFood: "miniPizza"),
                          FoodModel(name: "Mini Hot-dog", unitWeight: 40, imageFood: "hotdog"),
                          FoodModel(name: "Mini Burger", unitWeight: 40, imageFood: "hamburger"),
                          FoodModel(name: "Esfirra", unitWeight: 75, imageFood: "esfiha")]

var drinks: [DrinkModel] = [DrinkModel(name: "Refri", percentForGuestWithOther: 0.73, imageDrink: "refrigerante"),
                            DrinkModel(name: "Suco", percentForGuestWithOther: 0.27, imageDrink: "suco"),
                            DrinkModel(name: "Água", percentForGuestWithOther: 1, imageDrink: "agua")]

var alcoholicDrinks: [AlcoholicModel] = [AlcoholicModel(name: "Cervejinha", category: "Cevada", imageAlcoholic: "cerveja"),
                                        AlcoholicModel(name: "Vodka", category: "Destilado", imageAlcoholic: "vodka"),
                                        AlcoholicModel(name: "Cachaça", category: "Destilado", imageAlcoholic: "cachaca"),
                                        AlcoholicModel(name: "Gin", category: "Destilado", imageAlcoholic: "gin")]

var candies: [FoodModel] = [FoodModel(name: "Bolo", unitWeight: 0, imageFood: "bolo"),
                            FoodModel(name: "Docinhos", unitWeight: 0, imageFood: "docinhos")]
