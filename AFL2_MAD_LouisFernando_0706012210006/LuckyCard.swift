//
//  LuckyCard.swift
//  AFL2_MAD_LouisFernando_0706012210006
//
//  Created by student on 05/04/24.
//

import Foundation

// ===================== CLASS LUCKYCARD (keturunan dari AbilityCard) =====================

class LuckyCard: AbilityCard {
  static var totalLuckyChance: Double = 0.0
   // digunakan untuk menghitung seluruh total luckyChance yang  didapat jika player membeli kartu yang sama berturut-turut (hasilnya akan selalu bertambah)
  var luckyChance: Double = 0.0
  // untuk menghitung menampung hasil luckyChance per satu kali pembelian

  // proses perhitungan hasil luckyChance berbeda sesuai Reqular Wizard atau Supreme Wizard
  override func buyAbilityCard(
    player: Player, speedType: String? = "", toggleBuyProcess: inout Bool
  ) {
    print("")
    let finalCost = (cost * amount)
    if amount > 0 {
      if player.money_wizzy >= finalCost {
        toggleBuyProcess = true
        player.money_wizzy -= finalCost
        if player.currentStatus == "Regular Wizard" {
          let newLucky = (Double(amount) * (0.1 * Double(player.mp)))
          self.luckyChance += newLucky
          LuckyCard.totalLuckyChance += newLucky
        } else if player.currentStatus == "Supreme Wizard" {
          let initialLucky = (Double(amount) * (0.1 * Double(player.mp)))
          let extraLucky = (0.1 * Double(player.mp))
          let totalLucky = initialLucky + extraLucky
          self.luckyChance += totalLucky
          LuckyCard.totalLuckyChance += totalLucky
        }
        print(
          "You have succesfully bought \(amount) Lucky Cards, now your lucky chance is \(LuckyCard.totalLuckyChance)."
        )
      } else {
        print("You don't have enough wizzy to buy this Lucky Card.")
      }
    } else {
      print("You can't buy 0 Lucky Cards.")
    }
  }
}
