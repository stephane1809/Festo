//
//  Service.swift
//  Festo
//
//  Created by Stephane Girão Linhares on 24/11/22.
//

import Foundation

var foods: [FoodModel] = [
    FoodModel(name: "Salgadinho", unitWeight: 30, foodCategory: "salgado", imageFood: "salgados"),
    FoodModel(name: "Pizza", unitWeight: 120, foodCategory: "salgado", imageFood: "pizza"),
    FoodModel(name: "Mini Pizza", unitWeight: 40, foodCategory: "salgado", imageFood: "miniPizza"),
    FoodModel(name: "Mini Hot-dog", unitWeight: 40, foodCategory: "salgado", imageFood: "hotdog"),
    FoodModel(name: "Mini Burger", unitWeight: 40, foodCategory: "salgado", imageFood: "hamburger"),
    FoodModel(name: "Esfirra", unitWeight: 75, foodCategory: "salgado", imageFood: "esfiha"),
]

var drinks: [DrinkModel] = [DrinkModel(name: "Refri", percentForGuestWithOther: 0.73, imageDrink: "refrigerante"),
                            DrinkModel(name: "Suco", percentForGuestWithOther: 0.27, imageDrink: "suco"),
                            DrinkModel(name: "Água", percentForGuestWithOther: 1, imageDrink: "agua")]

var alcoholicDrinks: [AlcoholicModel] = [AlcoholicModel(name: "Cervejinha", category: "Cevada", imageAlcoholic: "cerveja"),
                                        AlcoholicModel(name: "Vodka", category: "Destilado", imageAlcoholic: "vodka"),
                                        AlcoholicModel(name: "Cachaça", category: "Destilado", imageAlcoholic: "cachaca"),
                                        AlcoholicModel(name: "Gin", category: "Destilado", imageAlcoholic: "gin")]


var candies: [FoodModel] = [
    FoodModel(name: "Bolo", unitWeight: 100, foodCategory: "doce", imageFood: "bolo"),
    FoodModel(name: "Docinhos", unitWeight: 16, foodCategory: "doce", imageFood: "docinhos")
]

