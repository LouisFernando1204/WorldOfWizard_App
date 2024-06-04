//
//  ImmortalityCard.swift
//  AFL2_MAD_LouisFernando_0706012210006
//
//  Created by student on 05/04/24.
//

import Foundation

// ===================== CLASS LUCKYCARD (keturunan dari AbilityCard) =====================

class ImmortalityCard: AbilityCard {
  static var totalImmortalityPower: Double = 0.0
   // digunakan untuk menghitung seluruh total immortalityPower yang  didapat jika player membeli kartu yang sama berturut-turut (hasilnya akan selalu bertambah)
  var immortalityPower: Double = 0.0
  // untuk menghitung menampung hasil immortalityPower per satu kali pembelian


  // proses perhitungan hasil immortality berbeda sesuai Reqular Wizard atau Supreme Wizard
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
          let newImmortality =
            (Double(amount) * 20) + (0.2 * Double(player.mp) + 0.2 * Double(player.mp))
          self.immortalityPower += newImmortality
          ImmortalityCard.totalImmortalityPower += newImmortality
        } else if player.currentStatus == "Supreme Wizard" {
          let newImmortality =
            ((Double(amount) * 20) + (0.2 * Double(player.mp) + 0.2 * Double(player.mp))) * 2
          self.immortalityPower += newImmortality
          ImmortalityCard.totalImmortalityPower += newImmortality
        }
        print(
          "You have succesfully bought \(amount) Immortality Cards, now your immortality power is \(ImmortalityCard.totalImmortalityPower)."
        )
      } else {
        print("You don't have enough wizzy to buy this Immortality Card.")
      }
    } else {
      print("You can't buy 0 Immortality Cards.")
    }
  }
}
