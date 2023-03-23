//
//  FoodIngredient.swift
//  HunchMeal
//
//  Created by Leonardo Wijaya on 22/03/23.
//

import Foundation

struct FoodIngredient: Identifiable {
    let id = UUID()
    let ingredient: String
}

struct FoodIngredientLists {
    static let lists: [FoodIngredient] = [
        FoodIngredient(ingredient: "Tepung Beras"), //0
        FoodIngredient(ingredient: "Telur"),
        FoodIngredient(ingredient: "Gula Pasir"),
        FoodIngredient(ingredient: "Siput"),
        FoodIngredient(ingredient: "Garam"),
        FoodIngredient(ingredient: "Jahe"), //5
        FoodIngredient(ingredient: "Tepung Sagu"),
        FoodIngredient(ingredient: "Air"),
        FoodIngredient(ingredient: "Gula"),
        FoodIngredient(ingredient: "Tepung"),
        FoodIngredient(ingredient: "Tepung Terigu"), // 10
        FoodIngredient(ingredient: "Gula Halus"),
        FoodIngredient(ingredient: "Santan Kelapa"),
        FoodIngredient(ingredient: "Ubi Merah"),
        FoodIngredient(ingredient: "Pisang Hijau"),
        FoodIngredient(ingredient: "Daun Pandan"), // 15
        FoodIngredient(ingredient: "Santan"),
        FoodIngredient(ingredient: "Nanas"),
        FoodIngredient(ingredient: "Kacang Hijau"),
        FoodIngredient(ingredient: "Mentega"),
        FoodIngredient(ingredient: "Belalang Kayu"), // 20
        FoodIngredient(ingredient: "Bawang Putih"),
        FoodIngredient(ingredient: "Kemiri"),
        FoodIngredient(ingredient: "Sarang Tawon"),
        FoodIngredient(ingredient: "Bawang Merah"),
        FoodIngredient(ingredient: "Kelapa Parut"), // 25
        FoodIngredient(ingredient: "Ampas Kelapa"),
        FoodIngredient(ingredient: "Jagung Manis"),
        FoodIngredient(ingredient: "Susu Kedelai"),
        FoodIngredient(ingredient: "Agar - Agar"),
        FoodIngredient(ingredient: "Beras Ketan"), // 30
        FoodIngredient(ingredient: "Minyak Babi"),
        FoodIngredient(ingredient: "Beras"),
        FoodIngredient(ingredient: "Daun Salam"),
        FoodIngredient(ingredient: "Kolang Kaling"),
        FoodIngredient(ingredient: "Alpukat"), // 35
        FoodIngredient(ingredient: "Gula Merah"),
        FoodIngredient(ingredient: "Kentang"),
        FoodIngredient(ingredient: "Kelapa Muda"),
        FoodIngredient(ingredient: "Melon"),
        FoodIngredient(ingredient: "Selasih"), // 40
        FoodIngredient(ingredient: "Ragi Tape"),
        FoodIngredient(ingredient: "Soda Kue"),
        FoodIngredient(ingredient: "Vanila"),
        FoodIngredient(ingredient: "Tahu"),
        FoodIngredient(ingredient: "Pisang Tanduk"), // 45
        FoodIngredient(ingredient: "Gula Jawa"),
        FoodIngredient(ingredient: "Kayu Manis"),
        FoodIngredient(ingredient: "Tepung Tapioka"),
        FoodIngredient(ingredient: "Balakutak"),
        FoodIngredient(ingredient: "Lengkuas"), // 50
        FoodIngredient(ingredient: "Singkong"),
        FoodIngredient(ingredient: "Kapur Sirih"),
        FoodIngredient(ingredient: "Arang"),
        FoodIngredient(ingredient: "Telur Bebek")
    ]
}
