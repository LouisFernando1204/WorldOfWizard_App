//
//  Giant.swift
//  AFL2_MAD_LouisFernando_0706012210006
//
//  Created by student on 05/04/24.
//

import Foundation

// ===================== CLASS GIANT (keturunan dari Enemy) =====================
// berikut class Giant yang akan memiliki atribut tambahan yaitu giantSuperPower yang akan berpengaruh pada damage yang diberikan oleh enemy dengan tipe Giant
// catatan penting : baik itu Forest of Troll ataupun Mountain of Golem bisa berupa giant

class Giant: Enemy {
  var giantSuperPower: Int = 50

  // akan dilakukn pengecekan terlebih dahulu apakah user mengenai giant atau tidak, dan apakah posisi player yang ditaargetkan oleh giant sesuai dengan posisi player atau tidak
  // dengan adanya atribut tambahan giantSuperPower damage yang dikenai ke player akan berbeda perhitungannya
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
            let enemyDamage =
              attack + (giantSuperPower * 2) + playerMP + (randomPlayerTargetedPosition * 4)
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
            let enemyDamage =
              attack + (giantSuperPower * 2) + playerMP + (randomPlayerTargetedPosition * 4)
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
          let enemyDamage =
            attack + (giantSuperPower * 2) + playerMP + (randomPlayerTargetedPosition * 4)
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
