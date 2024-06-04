//
//  Enemy.swift
//  AFL2_MAD_LouisFernando_0706012210006
//
//  Created by student on 05/04/24.
//

import Foundation

// ===================== CLASS ENEMY =====================
// berikut class Enemy yang akan berisi seluruh atribut enemy secara keseluruhan serta function calculateTheBattle() yang akan digunakan class Player pada function attackFlow() -> (Player.swift)

class Enemy {
  var name: String = ""
  var health: Int = 300
  var attack: Int = 50
  var randomPosition: Int = Int.random(in: 1...3)

  init(name: String) {
    self.name = name
  }

  // untuk mengurangi hp milik player dan juga health milik enemy, namun terdapat kondisi khusus dimana posisi target enemy yang diinputkan user harus sama dengan hasil random posisi milik enemy (health enemy dikurangi) dan juga hasil random posisi player yang didtargetkan oleh enemy sama dengan posisi player saat itu (hp player dikurangi)
  func calculateTheBattle(
    playerMagics_MP: Int, playerMagics_Damage: Int, playerHP: inout Int, playerMP: inout Int,
    playerPosition: Int, enemyTargetedPosition: Int, toggleInputChoice: inout Bool,
    cardSelected: Int, currentPlayerStatus: inout String
  ) {
    // depends on the enemy's type
  }
}
