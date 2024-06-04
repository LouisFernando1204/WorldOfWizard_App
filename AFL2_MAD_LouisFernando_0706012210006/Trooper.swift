//
//  Trooper.swift
//  AFL2_MAD_LouisFernando_0706012210006
//
//  Created by student on 05/04/24.
//

import Foundation

// ===================== CLASS TROOPER (keturunan dari Enemy) =====================
// berikut class Trooper yang akan memiliki atribut tambahan yaitu trooperSpecialAbility yang akan berpengaruh paada damage yang diberikan oleh enemy dengan tipe Trooper
// catatan penting : baik itu Forest of Troll ataupun Mountain of Golem bisa berupa trooper

class Trooper: Enemy {
  var trooperSpecialAbility: Int = 20

  // akan dilakukn pengecekan terlebih dahulu apakah user mengenai trooper atau tidak, dan apakah posisi player yang ditaargetkan oleh trooper sesuai dengan posisi player atau tidak
  // dengan adanya atribut tambahan trooperSpeialAbility damage yang dikenai ke player akan berbeda perhitungannya
  override func calculateTheBattle(
    playerMagics_MP: Int, playerMagics_Damage: Int, playerHP: inout Int, playerMP: inout Int,
    playerPosition: Int, enemyTargetedPosition: Int, toggleInputChoice: inout Bool,
    cardSelected: Int, currentPlayerStatus: inout String
  ) {
    if playerMP < playerMagics_MP {
      print("You don't have enough MP to use Physical Attack.")
      print("You only have \(playerMP) MP left.")
    } else {
      playerMP -= playerMagics_MP
      let randomPlayerTargetedPosition = Int.random(in: 1...3)
      if enemyTargetedPosition == randomPlayerTargetedPosition {
        if health <= playerMagics_Damage {
          health -= playerMagics_Damage
          if cardSelected == 1 || cardSelected == 2 || cardSelected == 3 || cardSelected == 5 {
            print("You just avoided the \(name).")
          } else {
            let enemyDamage = attack + (trooperSpecialAbility * 2) + playerMP
            if randomPlayerTargetedPosition == playerPosition {
              if cardSelected == 4 {
                playerHP += 50
              }
              let finalPlayerHP = playerHP - enemyDamage
              if finalPlayerHP <= 0 {
                playerHP = 0
              } else {
                playerHP = finalPlayerHP
              }
              print("Congrats! You have already defeated the \(name).")
              currentPlayerStatus = "Supreme Wizard"
              toggleInputChoice = false
            } else {
              print("Enemy just missed their attacks, keep Going!")
            }
          }
        } else {
          health -= playerMagics_Damage
          if cardSelected == 1 || cardSelected == 2 || cardSelected == 3 || cardSelected == 5 {
            print("You just avoided the \(name).")
          } else {
            let enemyDamage = attack + (trooperSpecialAbility * 2) + playerMP
            if randomPlayerTargetedPosition == playerPosition {
              if cardSelected == 4 {
                playerHP += 50
              }
              let finalPlayerHP = playerHP - enemyDamage
              if finalPlayerHP <= 0 {
                playerHP = 0
              } else {
                playerHP = finalPlayerHP
              }
              print("You got hit by the enemy!")
              if playerHP <= 0 {
                print("Oops... You have been defeated by the \(name)!")
                toggleInputChoice = false
              } else {
                print("Hang On! You only have \(playerHP) HP and \(playerMP) MP left.")
              }
              print("Damage taken: \(enemyDamage)")
            } else {
              print("Enemy just missed their attacks, keep Going!")
            }
          }
        }
      } else {
        if cardSelected == 1 || cardSelected == 2 || cardSelected == 3 || cardSelected == 5 {
          print("You just avoided the \(name).")
        } else {
          let enemyDamage = attack + (trooperSpecialAbility * 2) + playerMP
          if randomPlayerTargetedPosition == playerPosition {
            if cardSelected == 4 {
              playerHP += 50
            }
            let finalPlayerHP = playerHP - enemyDamage
            if finalPlayerHP <= 0 {
              playerHP = 0
            } else {
              playerHP = finalPlayerHP
            }
          }
          print("")
          print("Oops... You've missed. The enemy is not in your chosen position.")
        }
      }
    }
  }
}
