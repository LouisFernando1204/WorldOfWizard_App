//
//  Gameplay.swift
//  AFL2_MAD_LouisFernando_0706012210006
//
//  Created by student on 05/04/24.
//

import Foundation

// ===================== FLOW GAME =====================
// berikut adalah keseluruhan flow dari game RPG antara wizard dan monster.

// terdapat penambahan menu pada JOURNEY SCREEN yaitu,
// [G]o to Secret Wizard's Shop
// digunakan untuk melihat item yang dapat dibeli oleh player yaitu ability card, potion, dan juga elixir

// [S]how collections of ability card
// digunakan untuk menunjukkan koleksi ability card yang sudah dibeli oleh player, naamun untuk potion dan elixir bisa dilihat di menu : [C]heck your health and stats

class Gameplay {
  func startGame() {
    // OPENING SCREEN
    // inisialisasi agar loop pertama dijalankan
    var toggleInputContinue: Bool = false
    while !toggleInputContinue {
      print("Welcome to the world of magic! 🐱‍🏍👽")
      print("")
      print(
        "You have been chosen to embark on an epic journey as a young wizard on the path to becoming a master of the arcane arts. Your adventure will take you through forests 🎄, mountains 🌋, and dungeons 🛕, where you will face challenges, make allies, and fight enemies."
      )
      print("")
      print("Press [return] to continue: ", terminator: "")
      let inputContinue = readLine()
      if inputContinue == "" {
        toggleInputContinue = true
      }
      print("")
      print("=========================================")
    }

    // WELCOMING SCREEN
    var inputWizardName: String = ""
    var player: Player?

    while inputWizardName == "" {
      print("May I know your name, young wizard? ", terminator: "")
      inputWizardName = readLine() ?? ""

      if !inputWizardName.isEmpty && inputWizardName.allSatisfy({ $0.isLetter }) {
        player = Player(name: inputWizardName)
        print("")
        print("Nice to meet you, \(player!.name)!")
      } else {
        print("")
        print("Please enter only alphabet characters (a-z / A-Z).")
        print("")
        inputWizardName = ""
      }
    }

    if let player = player {
      // JOURNEY SCREEN
      var inputChoice: String = ""
      var toggleInputChoice: Bool = false
      while !toggleInputChoice {
        print("")
        print("=========================================")
        print("From here, you can...")
        print("")
        print("[C]heck your health and stats")
        print("[H]eal your wounds with potion")
        print("[G]o to Secret Wizard's Shop")
        print("[S]how collections of ability card")
        print("")
        print("...or choose where you want to go")
        print("")
        print("[F]orest of Troll")
        print("[M]ountain of Golem")
        print("[Q]uit game")
        print("")
        print("Your choice? ", terminator: "")
        inputChoice = readLine() ?? ""
        if inputChoice == "c" || inputChoice == "C" || inputChoice == "h" || inputChoice == "H"
          || inputChoice == "g" || inputChoice == "G" || inputChoice == "s" || inputChoice == "F"
          || inputChoice == "f" || inputChoice == "S" || inputChoice == "m" || inputChoice == "M"
          || inputChoice == "q" || inputChoice == "Q"
        {
          toggleInputChoice = true

          // Player Stats Screen
          if inputChoice == "c" || inputChoice == "C" {
            var inputBackFromPlayerStats: String = "string"
            while inputBackFromPlayerStats != "" {
              player.getPlayerStats()
              print("")
              print("Press [return] to go back: ", terminator: "")
              inputBackFromPlayerStats = readLine() ?? ""
              if inputBackFromPlayerStats == "" {
                toggleInputChoice = false
              }
            }
          }
          // Heal Wound Screen
          else if inputChoice == "h" || inputChoice == "H" {
            player.healWound(toggleInputChoice: &toggleInputChoice)
            // simbol (&) untuk memberikan referensi ke variabel toggleInputChoice, yang memungkinkan perubahan yang dibuat di dalam fungsi healWound untuk tercermin kembali di luar fungsi.
          }
          // Secret Wizard's Shop Screen
          else if inputChoice == "g" || inputChoice == "G" {
            player.goToShop(player: player, toggleInputChoice: &toggleInputChoice)
          }
          // Show Ability Card Screen
          else if inputChoice == "s" || inputChoice == "S" {
            player.showCollectionsAbilityCard(toggleInputChoice: &toggleInputChoice)
          }
          // Forest of Troll Screen
          else if inputChoice == "f" || inputChoice == "F" {
            if player.hp > 0 {
              // akan dilkukan random untuk menentukan tipe enemy baik itu trooper ataupun giant
              // jadi troll bisa berupa trooper ataupun giant
              let enemyTypes = ["Trooper", "Giant"]
              let randomEnemyType = enemyTypes.randomElement()
              if randomEnemyType == "Trooper" {
                let troll = Trooper(name: "Troll")
                player.getEnemyBattleField(
                  toggleInputChoice: &toggleInputChoice, enemy: troll,
                  enemyType: randomEnemyType ?? "")
              } else {
                let troll = Giant(name: "Troll")
                player.getEnemyBattleField(
                  toggleInputChoice: &toggleInputChoice, enemy: troll,
                  enemyType: randomEnemyType ?? "")
              }
            } else {
              print("")
              print("Heal yourself first!")
              toggleInputChoice = false
            }
          }
          // Mountain of Golem Screen
          else if inputChoice == "m" || inputChoice == "M" {
            if player.hp > 0 {
              // akan dilkukan random untuk menentukan tipe enemy baik itu trooper ataupun giant
              // jadi troll bisa berupa trooper ataupun giant
              let enemyTypes = ["Trooper", "Giant"]
              let randomEnemyType = enemyTypes.randomElement()
              if randomEnemyType == "Trooper" {
                let troll = Trooper(name: "Golem")
                player.getEnemyBattleField(
                  toggleInputChoice: &toggleInputChoice, enemy: troll,
                  enemyType: randomEnemyType ?? "")
              } else {
                let troll = Giant(name: "Golem")
                player.getEnemyBattleField(
                  toggleInputChoice: &toggleInputChoice, enemy: troll,
                  enemyType: randomEnemyType ?? "")
              }
            } else {
              print("")
              print("Heal yourself first!")
              toggleInputChoice = false
            }
          } else {
            print("Quit Game... Thanks for playing!")
            toggleInputChoice = true
          }
        }
      }
    }
  }
}
