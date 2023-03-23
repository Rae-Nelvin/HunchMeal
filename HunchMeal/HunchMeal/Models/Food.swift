//
//  Food.swift
//  HunchMeal
//
//  Created by Leonardo Wijaya on 22/03/23.
//

import Foundation

struct Food: Identifiable {
    let id = UUID()
    let name: String
    let type: FoodType
    let origin: [FoodOrigin]
    let cookProcesses: FoodProcesses
    let taste: [FoodTaste]
    let ingredient: [FoodIngredient]
    var isElim: Bool = false
}

struct FoodLists {
    static let lists: [Food] = [
//        Food(name: "Kue Tete", type: FoodTypeLists.lists[4], origin: [FoodOriginLists.lists[0], FoodOriginLists.lists[1]], cookProcesses: FoodProcessesList.lists[2], taste: [FoodTasteLists.lists[0]], ingredient: [FoodIngredientLists.lists[0], FoodIngredientLists.lists[1], FoodIngredientLists.lists[2]]),
//        Food(name: "Gulai Siput", type: FoodTypeLists.lists[0], origin: [FoodOriginLists.lists[0]], cookProcesses: FoodProcessesList.lists[1], taste: [], ingredient: [FoodIngredientLists.lists[3], FoodIngredientLists.lists[2], FoodIngredientLists.lists[4], FoodIngredientLists.lists[5]]),
//        Food(name: "Papeda", type: FoodTypeLists.lists[0], origin: [FoodOriginLists.lists[2], FoodOriginLists.lists[0]], cookProcesses: FoodProcessesList.lists[1], taste: [], ingredient: [FoodIngredientLists.lists[6], FoodIngredientLists.lists[7], FoodIngredientLists.lists[4]]),
//        Food(name: "Rambut Nenek", type: FoodTypeLists.lists[4], origin: [FoodOriginLists.lists[0]], cookProcesses: "", taste: [FoodTasteLists.lists[0]], ingredient: [FoodIngredientLists.lists[8], FoodIngredientLists.lists[9]]),
//        Food(name: "Kue Putu Mayang", type: FoodTypeLists.lists[4], origin: [FoodOriginLists.lists[0]], cookProcesses: "", taste: [FoodTasteLists.lists[0]], ingredient: [FoodIngredientLists.lists[0], FoodIngredientLists.lists[2], FoodIngredientLists.lists[7]]),
//        Food(name: "Kuping Gajah", type: FoodTypeLists.lists[4], origin: [FoodOriginLists.lists[0]], cookProcesses: "", taste: [FoodTasteLists.lists[0]], ingredient: [FoodIngredientLists.lists[10], FoodIngredientLists.lists[11], FoodIngredientLists.lists[12]]),
//        Food(name: "Bola Ubi", type: FoodTypeLists.lists[4], origin: [FoodOriginLists.lists[0]], cookProcesses: FoodProcessesList.lists[0], taste: [FoodTasteLists.lists[0]], ingredient: [FoodIngredientLists.lists[13], FoodIngredientLists.lists[6], FoodIngredientLists.lists[2]]),
//        Food(name: "Es Pisang Ijo", type: FoodTypeLists.lists[2], origin: [FoodOriginLists.lists[3], FoodOriginLists.lists[0]], cookProcesses: "", taste: [FoodTasteLists.lists[0]], ingredient: [FoodIngredientLists.lists[14], FoodIngredientLists.lists[0], FoodIngredientLists.lists[2], FoodIngredientLists.lists[15]]),
//        Food(name: "Serabi", type: FoodTypeLists.lists[4], origin: [FoodOriginLists.lists[4], FoodOriginLists.lists[0]], cookProcesses: FoodProcessesList.lists[4], taste: [FoodTasteLists.lists[0]], ingredient: [FoodIngredientLists.lists[16], FoodIngredientLists.lists[15], FoodIngredientLists.lists[2], FoodIngredientLists.lists[0], FoodIngredientLists.lists[17]]),
//        Food(name: "Onde - Onde", type: FoodTypeLists.lists[4], origin: [FoodOriginLists.lists[0]], cookProcesses: "", taste: [], ingredient: [FoodIngredientLists.lists[18], FoodIngredientLists.lists[0], FoodIngredientLists.lists[2]]),
//        Food(name: "Ulat Sagu", type: FoodTypeLists.lists[4], origin: [FoodOriginLists.lists[2], FoodOriginLists.lists[0]], cookProcesses: "", taste: [], ingredient: [FoodIngredientLists.lists[10], FoodIngredientLists.lists[11], FoodIngredientLists.lists[19]]),
//        Food(name: "Belalang Goreng", type: FoodTypeLists.lists[0], origin: [FoodOriginLists.lists[5], FoodOriginLists.lists[0]], cookProcesses: FoodProcessesList.lists[0], taste: [], ingredient: [FoodIngredientLists.lists[20], FoodIngredientLists.lists[21], FoodIngredientLists.lists[22]]),
//        Food(name: "Botok Tawon", type: FoodTypeLists.lists[0], origin: [FoodOriginLists.lists[6], FoodOriginLists.lists[0]], cookProcesses: "", taste: [], ingredient: [FoodIngredientLists.lists[23], FoodIngredientLists.lists[24], FoodIngredientLists.lists[21], FoodIngredientLists.lists[22]]),
//        Food(name: "Kue Rangi", type: FoodTypeLists.lists[4], origin: [FoodOriginLists.lists[1], FoodOriginLists.lists[0]], cookProcesses: "", taste: [], ingredient: [FoodIngredientLists.lists[25], FoodIngredientLists.lists[6], FoodIngredientLists.lists[26]]),
//        Food(name: "Grontol", type: FoodTypeLists.lists[4], origin: [FoodOriginLists.lists[0]], cookProcesses: "", taste: [FoodTasteLists.lists[0]], ingredient: [FoodIngredientLists.lists[27], FoodIngredientLists.lists[15], FoodIngredientLists.lists[25]]),
//        Food(name: "Wedang Tahu", type: FoodTypeLists.lists[2], origin: [FoodOriginLists.lists[8], FoodOriginLists.lists[0]], cookProcesses: "", taste: [], ingredient: [FoodIngredientLists.lists[28], FoodIngredientLists.lists[29], FoodIngredientLists.lists[5]]),
//        Food(name: "Bacang", type: FoodTypeLists.lists[4], origin: [FoodOriginLists.lists[0]], cookProcesses: "", taste: [], ingredient: [FoodIngredientLists.lists[30], FoodIngredientLists.lists[21], FoodIngredientLists.lists[31]]),
//        Food(name: "Arem - Arem", type: FoodTypeLists.lists[1], origin: [FoodOriginLists.lists[0]], cookProcesses: "", taste: [], ingredient: [FoodIngredientLists.lists[32], FoodIngredientLists.lists[33], FoodIngredientLists.lists[16]]),
//        Food(name: "Es Goyobod", type: FoodTypeLists.lists[2], origin: [FoodOriginLists.lists[9], FoodOriginLists.lists[0]], cookProcesses: "", taste: [FoodTasteLists.lists[0]], ingredient: [FoodIngredientLists.lists[34], FoodIngredientLists.lists[35], FoodIngredientLists.lists[16]]),
//        Food(name: "Wedang Ronde", type: FoodTypeLists.lists[1], origin: [FoodOriginLists.lists[7]], cookProcesses: "", taste: [], ingredient: [FoodIngredientLists.lists[5], FoodIngredientLists.lists[36], FoodIngredientLists.lists[37]]),
//        Food(name: "Es Kuwut", type: FoodTypeLists.lists[2], origin: [FoodOriginLists.lists[0]], cookProcesses: "", taste: [], ingredient: [FoodIngredientLists.lists[38], FoodIngredientLists.lists[39], FoodIngredientLists.lists[40]]),
//        Food(name: "Brem", type: FoodTypeLists.lists[4], origin: [FoodOriginLists.lists[0]], cookProcesses: "", taste: [], ingredient: [FoodIngredientLists.lists[30], FoodIngredientLists.lists[41], FoodIngredientLists.lists[42]]),
//        Food(name: "Kue Cucur", type: FoodTypeLists.lists[4], origin: [FoodOriginLists.lists[0]], cookProcesses: "", taste: [], ingredient: [FoodIngredientLists.lists[0], FoodIngredientLists.lists[2], FoodIngredientLists.lists[15], FoodIngredientLists.lists[36]]),
//        Food(name: "Kembang Goyang", type: "", origin: [], cookProcesses: "", taste: [], ingredient: [FoodIngredientLists.lists[0], FoodIngredientLists.lists[16], FoodIngredientLists.lists[43], FoodIngredientLists.lists[10]]),
//        Food(name: "Kue Ku", type: FoodTypeLists.lists[4], origin: [FoodOriginLists.lists[7]], cookProcesses: "", taste: [], ingredient: [FoodIngredientLists.lists[18], FoodIngredientLists.lists[16], FoodIngredientLists.lists[0], FoodIngredientLists.lists[30]]),
//        Food(name: "Tahu Gejrot", type: FoodTypeLists.lists[4], origin: [FoodOriginLists.lists[10], FoodOriginLists.lists[0]], cookProcesses: FoodProcessesList.lists[0], taste: [], ingredient: [FoodIngredientLists.lists[44], FoodIngredientLists.lists[21], FoodIngredientLists.lists[24]]),
//        Food(name: "Nagasari", type: FoodTypeLists.lists[2], origin: [], cookProcesses: "", taste: [FoodTasteLists.lists[0]], ingredient: [FoodIngredientLists.lists[45], FoodIngredientLists.lists[16], FoodIngredientLists.lists[15]]),
//        Food(name: "Clorot", type: FoodTypeLists.lists[2], origin: [FoodOriginLists.lists[11], FoodOriginLists.lists[0]], cookProcesses: <#T##FoodProcesses#>, taste: [FoodTasteLists.lists[0]], ingredient: [FoodIngredientLists.lists[46], FoodIngredientLists.lists[2], FoodIngredientLists.lists[25]]),
//        Food(name: "Sekoteng", type: "", origin: [FoodOriginLists.lists[12], FoodOriginLists.lists[0]], cookProcesses: "", taste: [], ingredient: [FoodIngredientLists.lists[2], FoodIngredientLists.lists[47], FoodIngredientLists.lists[15], FoodIngredientLists.lists[5]]),
//        Food(name: "Kerupuk Melarat", type: FoodTypeLists.lists[4], origin: [], cookProcesses: FoodProcessesList.lists[0], taste: [], ingredient: [FoodIngredientLists.lists[48], FoodIngredientLists.lists[21], FoodIngredientLists.lists[4]]),
//        Food(name: "Telur Pitan", type: FoodTypeLists.lists[1], origin: [], cookProcesses: FoodProcessesList.lists[1], taste: [], ingredient: [FoodIngredientLists.lists[52], FoodIngredientLists.lists[53], FoodIngredientLists.lists[54]]),
//        Food(name: "Balakutak", type: FoodTypeLists.lists[0], origin: [FoodOriginLists.lists[13], FoodIngredientLists.lists[0]], cookProcesses: "", taste: [], ingredient: [FoodIngredientLists.lists[49], FoodIngredientLists.lists[5], FoodIngredientLists.lists[33]]),
//        Food(name: "Getuk", type: FoodTypeLists.lists[1], origin: [FoodOriginLists.lists[4], FoodOriginLists.lists[0]], cookProcesses: "", taste: [], ingredient: [FoodIngredientLists.lists[51], FoodIngredientLists.lists[25], FoodIngredientLists.lists[15]]),
//        Food(name: "Bikang Mawar", type: "", origin: [FoodOriginLists.lists[0]], cookProcesses: "", taste: [], ingredient: [FoodIngredientLists.lists[9], FoodIngredientLists.lists[2], FoodIngredientLists.lists[15], FoodIngredientLists.lists[16]])
    ]
}
