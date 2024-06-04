//
//  SpeedCard.swift
//  AFL2_MAD_LouisFernando_0706012210006
//
//  Created by student on 05/04/24.
//

import Foundation

// ===================== CLASS SPEEDCARD (keturunan dari AbilityCard) =====================

class SpeedCard: AbilityCard {
  static var totalSpeedPt: Double = 0.0
  // digunakan untuk menghitung seluruh total speedPt yang  didapat jika player membeli kartu yang sama berturut-turut (hasilnya akan selalu bertambah)
  let speedCollections: [String: Int] = ["light": 20, "thunder": 10, "sound": 5]
  // digunakan saat looping pengecekan kartu SpeedCard yang diinputkan oleh player
  var speedPt: Double = 0.0
  // untuk menghitung menampung hasil speedPt per satu kali pembelian

  // proses perhitungan hasil speedPT berbeda sesuai Reqular Wizard atau Supreme Wizard
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
          for (speedName, speedValue) in speedCollections {
            if speedName == speedType {
              let newSpeed = ((Double(amount) * Double(speedValue)) + (0.05 * Double(player.hp)))
              speedPt += newSpeed
              SpeedCard.totalSpeedPt += newSpeed
            }
          }
        } else if player.currentStatus == "Supreme Wizard" {
          for (speedName, speedValue) in speedCollections {
            if speedName == speedType {
              let newSpeed = ((Double(amount) * Double(speedValue)) + (0.1 * Double(player.hp)))
              speedPt += newSpeed
              SpeedCard.totalSpeedPt += newSpeed
            }
          }
        }
        print(
          "You have succesfully bought \(amount) Speed of \(speedType ?? "") cards, now your speed point is \(SpeedCard.totalSpeedPt)."
        )
      } else {
        print("You don't have enough wizzy to buy this Speed Card.")
      }
    } else {
      print("You can't buy 0 Speed Cards.")
    }
  }
}
