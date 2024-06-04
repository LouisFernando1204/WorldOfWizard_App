//
//  AbilityCard.swift
//  AFL2_MAD_LouisFernando_0706012210006
//
//  Created by student on 05/04/24.
//

import Foundation

// ===================== CLASS ABILITY CARD =====================
// berikut class Ability Card yang akan berisi seluruh atribut ability card secara keseluruhan serta function buyAbilityCard() yang akan digunakan class Player pada function goToShop() -> (Player.swift)

class AbilityCard {
  var name: String = ""
  var cost: Int = 0
  var amount: Int = 0

  init(name: String, cost: Int, amount: Int) {
    self.name = name
    self.cost = cost
    self.amount = amount
  }


  // untuk proses perhitungan ability card baik itu SpeedCard, LuckyCard, ImmortalityCard akan dibedakan pada value (atribut tambahan miliki SpeedCard, LuckyCard, ImmortalityCard) yang bisa didapatkan oleh player dari pembelian berdasarkan atribut currentStatus milik player (Regular Wizard atau Supreme Wizard)
  func buyAbilityCard(player: Player, speedType: String? = "", toggleBuyProcess: inout Bool) {
    // depends on Card that player bought
  }
}
