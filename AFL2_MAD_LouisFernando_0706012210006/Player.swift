// ===================== CLASS PLAYER =====================
// berikut class Player yang akan berisi seluruh atribut player serta beberapa function yang akan digunakan untuk setiap menu di Journey Screen (Gameplay.swift).

class Player {
  var name: String = ""
  var hp: Int = 500
  var mp: Int = 50
  var magics: [String:[Int]] = ["Physical Attack" : [0, 40], "Meteor" : [15, 100], "Shield" : [10, 0]]
  let magicsOrder = ["Physical Attack", "Meteor", "Shield"]
  // magicsOrder digunakan ketika looping untuk menampilkan daftar magics yang adad
  var items: [String:[Int]] = ["Potion" : [10, 20], "Elixir" : [5, 10]]
  var currentStatus: String = "Regular Wizard"
  // currentStatus yaitu berupa title yang akan ada dua tipe yaitu Regular Wizard dan Supreme Wizard, dimana title Supreme Wizard akan dicapai ketika player berhasil mengalahkan 1 round dari Forest Of Troll atau Mountain Of Golem.
  var money_wizzy: Int = 5000
  var speedCardCollection: [SpeedCard] = []
  // untuk menyimpan koleksi speed card yang telah diberli dimana terdiri dari 3 macam yaitu Speed Of Light, Speed Of Sound, dan Speed Of Thunder.
  var luckyCardCollection: [LuckyCard] = []
   // untuk menyimpan koleksi lucky card yang telah dibeli (hanya 1 macam saja)
  var immortalityCardCollection: [ImmortalityCard] = []
  // untuk menyimpan koleksi immortality card yang telah dibeli (hanya 1 macam saja)
  
  init(name: String){
      self.name = name
  }

  // untuk menampilkan dan memproses menu [C]heck your health and stats
  func getPlayerStats(){
    print("")
    print("=========================================")
    print("Player name:", name)
    print("")
    print("HP: \(hp)/500")
    print("")
    print("MP: \(mp)/50")
    print("")
    print("Wizzy (money): \(money_wizzy)")
    print("")
    print("Magic:")
    for magicName in magicsOrder{
      if let magicValue = magics[magicName]{
        if magicName == "Physical Attack"{
           print("- \(magicName). No mana required. Deal \(magicValue[1])pt of damage.")
        }
        if magicName == "Meteor"{
           print("- \(magicName). Use \(magicValue[0])pt of MP. Deal \(magicValue[1])pt of damage.")
        }
        if magicName == "Shield"{
         print("- \(magicName). Use \(magicValue[0])pt of MP. Block enemy's attack in 1 turn.")
        }
      }
    }
    print("")
    print("Items:")
    for (itemName, itemValue) in items{
      if itemName == "Potion"{
         print("- \(itemName) x\(itemValue[0]). Heal \(itemValue[1])pt of your HP.")
      }
      if itemName == "Elixir"{
         print("- \(itemName) x\(itemValue[0]). Add \(itemValue[1])pt of your MP.")
      }
    }
  }
  
  // untuk menampilkan dan memproses menu [H]eal your wounds with potion
  func healWound(toggleInputChoice: inout Bool) {
      var inputUsePotion: String = ""
      var inputBackFromHealWound: String = "string"
      var toggleInputUsePotion: Bool = false
      var countHeal: Int = 0
      if items["Potion"]?[0] ?? 0 > 0 {
          while !toggleInputUsePotion {
              print("")
              print("=========================================")
              print("Your HP is \(hp).")
              print("You have \(items["Potion"]?[0] ?? 0) Potion(s)")
              print("")
            if countHeal > 0 {
              print("Still want to use 1 potion to heal wound again? [Y/N] ", terminator: "")
            }
            else{
               print("Are you sure want to use 1 potion to heal wound? [Y/N] ", terminator: "")
            }
              inputUsePotion = readLine()?.lowercased() ?? ""
              if inputUsePotion == "y" {
                if items["Potion"]?[0] ?? 0 > 0{
                  if hp < 500{
                    let finalhp = hp + 20
                    if finalhp > 500{
                      hp = 500
                    }
                    else{
                      hp = finalhp
                    }
                  }
                  items["Potion"]?[0] -= 1
                  countHeal += 1
                }
                else{
                  toggleInputUsePotion = true
                  while inputBackFromHealWound != "" {
                      print("")
                      print("You don't have any potion left. Be careful of your next journey.")
                      print("Press [return] to go back: ", terminator: "")
                      inputBackFromHealWound = readLine() ?? ""
                      if inputBackFromHealWound == "" {
                          toggleInputChoice = false
                      }
                  }
                }
              } else if inputUsePotion == "n" {
                  toggleInputUsePotion = true
                  toggleInputChoice = false
              }
          }
      } else {
          while inputBackFromHealWound != "" {
              print("")
              print("You don't have any potion left. Be careful of your next journey.")
              print("Press [return] to go back: ", terminator: "")
              inputBackFromHealWound = readLine() ?? ""
              if inputBackFromHealWound == "" {
                  toggleInputChoice = false
              }
          }
      }
  }

  // untuk menampilkan dan memproses menu [7] Use Elixir to add mp (terdapat di dalam setiap  battle Forrest of Troll dan Mountain of Golem) dimana player dapat menggunakan elixir untuk menambah mp
  func addMP(toggleInputChoice: inout Bool, toggleInputMenuBattle: inout Bool) {
      var inputUseElixir: String = ""
      var inputBackFromAddMP: String = "string"
      var toggleInputUseElixir: Bool = false
      var countAdd: Int = 0
      if items["Elixir"]?[0] ?? 0 > 0 {
          while !toggleInputUseElixir {
              print("")
              print("=========================================")
              print("Your mp is \(mp).")
              print("You have \(items["Elixir"]?[0] ?? 0) Elixirs(s)")
              print("")
            if countAdd > 0 {
              print("Still want to use 1 elixir to add mp again? [Y/N] ", terminator: "")
            }
            else{
               print("Are you sure want to use 1 elixir to add mp? [Y/N] ", terminator: "")
            }
            inputUseElixir = readLine()?.lowercased() ?? ""
              if inputUseElixir == "y" {
                if items["Elixir"]?[0] ?? 0 > 0{
                  if mp < 50{
                    let finalmp = mp + 10
                    if finalmp > 50{
                      mp = 50
                    }
                    else{
                      mp = finalmp
                    }
                  }
                  items["Elixir"]?[0] -= 1
                  countAdd += 1
                }
                else{
                  toggleInputUseElixir = true
                  while inputBackFromAddMP != "" {
                      print("")
                      print("You don't have any elixir left. Be careful of your next journey.")
                      print("Press [return] to go back: ", terminator: "")
                      inputBackFromAddMP = readLine() ?? ""
                      if inputBackFromAddMP == "" {
                        toggleInputMenuBattle = false
                      }
                  }
                }
              } else if inputUseElixir == "n" {
                  toggleInputUseElixir = true
                toggleInputMenuBattle = false
              }
          }
      } else {
          while inputBackFromAddMP != "" {
              print("")
              print("You don't have any elixir left. Be careful of your next journey.")
              print("Press [return] to go back: ", terminator: "")
            inputBackFromAddMP = readLine() ?? ""
              if inputBackFromAddMP == "" {
                toggleInputMenuBattle = false
              }
          }
      }
  }

  // untuk menampilkan dan memproses menu [G]o to Secret Wizard's Shop
  // pengecualian ketika membeli Speed Card maka akan muncul 3 pilihan lagi yaitu Speed Of Light, Speed Of Sound, dan Speed Of Thunder.
  func goToShop(player: Player, toggleInputChoice: inout Bool){
    var toggleChoiceAbilityCard = false
    var toggleBuyProcess = false
    while !toggleChoiceAbilityCard{
      print("")
      print("=========================================")
      print("Welcome to the shop!")
      print("Here you can buy an ability card to help you defeating the monster on your journey!")
      print("")
      print("1. Speed Card")
      print("2. Lucky Card")
      print("3. Immortality Card")
      print("4. Potion")
      print("5. Elixir")
      print("6. Exit")
      print("")
      print("Choose which you want to buy [number]: ", terminator: "")
      let inputChoiceAbilityCard = readLine() ?? ""
      if Int(inputChoiceAbilityCard) == 1 {
        toggleChoiceAbilityCard = true
        var toggleChoiceTypeSpeed = false
        while !toggleChoiceTypeSpeed {
          print("")
          print("=========================================")
          print("There's many type of Speed Cards you can buy!")
          print("Speed Card is used to avoid the enemy.")
          print("1. Speed of Light - 100 wizzy for 20 pt of speed")
          print("2. Speed of Thunder - 70 wizzy for 10 pt of speed")
          print("3. Speed of Sound - 40 wizzy for 5 pt of speed")
          print("")
          print("Choose type of speed [light/thunder/sound/exit]: ", terminator: "")
          let inputTypeSpeed = readLine()?.lowercased() ?? ""
        if inputTypeSpeed == "light" || inputTypeSpeed == "thunder" || inputTypeSpeed == "sound" {
            toggleChoiceTypeSpeed = true
            var amount: Int = 0
            while true {
                print("")
                print("Amount [number/exit]: ", terminator: "")
                if let inputAmount = readLine() {
                    if inputAmount.lowercased() == "exit" {
                        toggleChoiceTypeSpeed = false
                        break
                    } else if let inputAmount_Int = Int(inputAmount) {
                        amount = inputAmount_Int
                        if inputTypeSpeed == "light" {
                            calculateSpeedCard(cost: 100, amount: amount, inputTypeSpeed: inputTypeSpeed, player: player, toggleBuyProcess: &toggleBuyProcess, toggleChoiceTypeSpeed: &toggleChoiceTypeSpeed)
                        } else if inputTypeSpeed == "thunder" {
                            calculateSpeedCard(cost: 70, amount: amount, inputTypeSpeed: inputTypeSpeed, player: player, toggleBuyProcess: &toggleBuyProcess, toggleChoiceTypeSpeed: &toggleChoiceTypeSpeed)
                        } else if inputTypeSpeed == "sound" {
                            calculateSpeedCard(cost: 40, amount: amount, inputTypeSpeed: inputTypeSpeed, player: player, toggleBuyProcess: &toggleBuyProcess, toggleChoiceTypeSpeed: &toggleChoiceTypeSpeed)
                        }
                        break
                    } else {
                        print("Please choose whether input a number or 'exit'.")
                    }
                }
            }
        }
          else if inputTypeSpeed == "exit"{
            toggleChoiceTypeSpeed = true
            toggleChoiceAbilityCard = false
          }
        }
      }
      else if Int(inputChoiceAbilityCard) == 2{
        toggleChoiceAbilityCard = true
        var amount : Int = 0
        while true {
          print("")
          print("=========================================")
          print("Lucky Card - 120 wizzy for 10% chance to gain more hp")
          print("")
          print("Amount [number/exit]: ", terminator: "")
          if let inputAmount = readLine() {
          if inputAmount.lowercased() == "exit" {
            toggleChoiceAbilityCard = false
            break
          }
           else if let inputAmount_Int = Int(inputAmount) {
             amount = inputAmount_Int
             let luckyCard = LuckyCard(name: "lucky", cost: 120, amount: amount)
             luckyCard.buyAbilityCard(player: player, speedType: "", toggleBuyProcess: &toggleBuyProcess)
             if toggleBuyProcess == true{
               luckyCardCollection.append(luckyCard)
             }
             toggleChoiceAbilityCard = false
             break
           }
          else {
              print("Please choose whether input a number or 'exit'.")
          }
          }
        }
      }
      else if Int(inputChoiceAbilityCard) == 3 {
        toggleChoiceAbilityCard = true
        var amount : Int = 0
        while true {
          print("")
          print("=========================================")
          print("Immortality Card - 80 wizzy for 20 power of immortality to withstand enemy attacks")
          print("")
          print("Amount [number/exit]: ", terminator: "")
          if let inputAmount = readLine() {
          if inputAmount.lowercased() == "exit" {
            toggleChoiceAbilityCard = false
            break
          }
           else if let inputAmount_Int = Int(inputAmount) {
             amount = inputAmount_Int
             let immortalityCard = ImmortalityCard(name: "immortality", cost: 80, amount: amount)
             immortalityCard.buyAbilityCard(player: player, speedType: "", toggleBuyProcess: &toggleBuyProcess)
             if toggleBuyProcess == true{
               immortalityCardCollection.append(immortalityCard)
             }
             toggleChoiceAbilityCard = false
             break
           }
          else {
              print("Please choose whether input a number or 'exit'.")
          }
          }
        }
      }
      else if Int(inputChoiceAbilityCard) == 4{
        toggleChoiceAbilityCard = true
        var amount : Int = 0
        while true {
          print("")
          print("=========================================")
          print("Potion - 5 wizzy for 1 potion")
          print("")
          print("Amount [number/exit]: ", terminator: "")
          if let inputAmount = readLine() {
          if inputAmount.lowercased() == "exit" {
            toggleChoiceAbilityCard = false
            break
          }
           else if let inputAmount_Int = Int(inputAmount) {
            amount = inputAmount_Int
             let finalCost = amount * 5
             if amount > 0{
               if money_wizzy >= finalCost{
                 money_wizzy -= finalCost
                 items["Potion"]?[0] += amount
                 print("")
                 print("You have succesfully bought \(amount) Potion(s).")
               }
               else{
                 print("")
                 print("You don't have enough wizzy to buy this Potion.")
               }
             }
             else{
               print("")
                print("You can't buy 0 Potion.")
             }
            toggleChoiceAbilityCard = false
            break
           }
          else {
              print("")
              print("Please choose whether input a number or 'exit'.")
          }
          }
        }
      }
      else if Int(inputChoiceAbilityCard) == 5{
        toggleChoiceAbilityCard = true
        var amount : Int = 0
        while true {
          print("")
          print("=========================================")
          print("Elixir - 7 wizzy for 1 elixir")
          print("")
          print("Amount [number/exit]: ", terminator: "")
          if let inputAmount = readLine() {
          if inputAmount.lowercased() == "exit" {
            toggleChoiceAbilityCard = false
            break
          }
           else if let inputAmount_Int = Int(inputAmount) {
            amount = inputAmount_Int
             let finalCost = amount * 7
             if amount > 0{
               if money_wizzy >= finalCost{
                 money_wizzy -= finalCost
                 items["Elixir"]?[0] += amount
                 print("")
                 print("You have succesfully bought \(amount) Elixir(s).")
               }
               else{
                 print("")
                 print("You don't have enough wizzy to buy this Elixir.")
               }
             }
             else{
               print("")
                print("You can't buy 0 Elixir.")
             }
            toggleChoiceAbilityCard = false
            break
           }
          else {
              print("")
              print("Please choose whether input a number or 'exit'.")
          }
          }
        }
      }
      else if Int(inputChoiceAbilityCard) == 6 {
        toggleChoiceAbilityCard = true
        toggleInputChoice = false
      }
      else{
        print("")
        print("Your choice isn't there. Please choose wisely.")
      }
    }
  }

  // untuk menampilkan dan memproses menu [S]how collections of ability card, menampilkan total masing" value dari card yang dimiliki (yang sebelumnya sudah dibeli)
  func showCollectionsAbilityCard(toggleInputChoice: inout Bool){
    print("")
    print("These are your collections of ability card!")
    print("=========================================")
    toggleInputChoice = false
    if speedCardCollection.isEmpty && luckyCardCollection.isEmpty && immortalityCardCollection.isEmpty{
      print("Oops you have no ability card yet.")
      print("You can buy ability card on Secret Wizard's Shop!")
    }
    else{
        let cardNames : [String] = ["light", "thunder", "sound"]
        for (index, value) in cardNames.enumerated(){
          let totalSpeedPt = speedCardCollection.filter { $0.name == value }.reduce(0.0) { $0 + $1.speedPt }
          print("\(index + 1). Speed of \(value.prefix(1).uppercased() + value.dropFirst()) - You have \(totalSpeedPt) speed point(s) of this card.")
        }
      
       let totalLuckyChance = luckyCardCollection.filter { $0.name == "lucky" }.reduce(0.0) { $0 + $1.luckyChance }
         print("4. Lucky Cards - You have \(totalLuckyChance) lucky chance(s) of this card.")

      let totalImmortalityPower = immortalityCardCollection.filter { $0.name == "immortality" }.reduce(0.0) { $0 + $1.immortalityPower }
       print("5. Immortality Cards - You have \(totalImmortalityPower) immortality power(s) of this card.")
      
      }
    }

  // untuk melakukaan proses penghitungan ketika pembelian speed card agaar tersimpan juga di speedCardCollection milik player
  func calculateSpeedCard(cost: Int, amount: Int, inputTypeSpeed: String, player: Player, toggleBuyProcess: inout Bool, toggleChoiceTypeSpeed: inout Bool){
    let speedCard = SpeedCard(name: inputTypeSpeed, cost: cost, amount: amount)
        speedCard.buyAbilityCard(player: player, speedType: inputTypeSpeed, toggleBuyProcess: &toggleBuyProcess)
        if toggleBuyProcess == true{
          speedCardCollection.append(speedCard)
        }
    toggleChoiceTypeSpeed = false
  }

  // untuk menampilkan dan memproses menu [F]orest of Troll dan [M]ountain of Golem, tergantung player memilih F atau M
  func getEnemyBattleField(toggleInputChoice: inout Bool, enemy: Enemy, enemyType: String){
    var toggleInputMenuBattle: Bool = false
    while !toggleInputMenuBattle {
        print("")
        print("=========================================")
        print("As you enter the forest, you feel a sense of unease wash over you. Suddenly, you hear the sound of twings snapping behind you. You quickly spin around, and find a Troll emerging from the shadows.")
        print("")
        print("Name: \(enemy.name) - Type: \(enemyType)")
        print("Health:", enemy.health)
        print("")
        print("Choose your action:")
        for magicName in magicsOrder{
          if let magicValue = magics[magicName]{
            if magicName == "Physical Attack"{
               print("[1] \(magicName). No mana required. Deal \(magicValue[1])pt of damage.")
            }
            if magicName == "Meteor"{
               print("[2] \(magicName). Use \(magicValue[0])pt of MP. Deal \(magicValue[1])pt of damage.")
            }
            if magicName == "Shield"{
             print("[3] \(magicName). Use \(magicValue[0])pt of MP. Block enemy's attack in 1 turn.")
            }
          }
        }
        print("")
        print("[4] Use Potion to heal wound.")
        print("[5] Scan enemy's vital.")
        print("[6] Flee from battle.")
        print("[7] Use Elixir to add mp.")
        print("")
        print("Your choice? ", terminator: "")
        if let inputChoiceBattleMenu = readLine(), let inputBattle = Int(inputChoiceBattleMenu){
          if inputBattle == 1{
            toggleInputMenuBattle = true
            var playerPosition: Int = 0
            var enemyTargetedPosition: Int = 0
            var cardSelected: Int = 0
            var togglePlayerPosition = false
            var toggleEnemyTargetedPosition = false
            var toggleCardSelected = false
            while !(playerPosition >= 1 && playerPosition <= 3) && !togglePlayerPosition{
              print("")
              print("Choose your default position [1 - 3]: ", terminator: "")
              if let inputPosition = readLine(), let inputPosition_Int = Int(inputPosition){
                togglePlayerPosition = true
                playerPosition = inputPosition_Int
                while !(enemyTargetedPosition >= 1 && enemyTargetedPosition <= 5) && !toggleEnemyTargetedPosition{
                  print("")
                  print("Choose enemy position [1 - 3] to be attacked: ", terminator: "")
                  if let inputEnemyPosition = readLine(), let inputEnemyPosition_Int = Int(inputEnemyPosition){
                    toggleEnemyTargetedPosition = true
                    enemyTargetedPosition = inputEnemyPosition_Int
                    if speedCardCollection.isEmpty && luckyCardCollection.isEmpty && immortalityCardCollection.isEmpty{
                      enemy.calculateTheBattle(playerMagics_MP: magics["Physical Attack"]?[0] ?? 0, playerMagics_Damage: magics["Physical Attack"]?[1] ?? 0, playerHP: &hp, playerMP: &mp, playerPosition: playerPosition, enemyTargetedPosition: enemyTargetedPosition, toggleInputChoice: &toggleInputChoice, cardSelected: 0,  currentPlayerStatus: &currentStatus)
                       getEnemyBattleField(toggleInputChoice: &toggleInputChoice, enemy: enemy, enemyType: enemyType)
                    }
                    else{
                      while !(cardSelected >= 1 && cardSelected <= 6) && !toggleCardSelected{
                        print("")
                        print("You can use you ability cards that you have: ")
                        print("")
                        let cardNames : [String] = ["light", "thunder", "sound"]
                          for (index, value) in cardNames.enumerated(){
                            let totalSpeedPt = speedCardCollection.filter { $0.name == value }.reduce(0) { $0 + $1.speedPt }
                            print("\(index + 1). Speed of \(value.prefix(1).uppercased() + value.dropFirst()) - You have \(totalSpeedPt) speed point(s) of this card.")
                          }

                         let totalLuckyChance = luckyCardCollection.filter { $0.name == "lucky" }.reduce(0) { $0 + $1.luckyChance }
                           print("4. Lucky Cards - You have \(totalLuckyChance) lucky chance(s) of this card.")

                        let totalImmortalityPower = immortalityCardCollection.filter { $0.name == "immortality" }.reduce(0) { $0 + $1.immortalityPower }
                         print("5. Immortality Cards - You have \(totalImmortalityPower) immortality power(s) of this card.")
                        print("For one used, your speedPt/luckyChance/immortalityPower will be substracted by 10.")
                        print("")
                        print("Choose your ability card [1/2/3/4/5/6(cancel)]: ", terminator: "")
                        if let inputSelectionCard = readLine(), let inputSelectionCard_Int = Int(inputSelectionCard){
                          toggleCardSelected = true
                          cardSelected = inputSelectionCard_Int
                          if cardSelected == 6{
                            enemy.calculateTheBattle(playerMagics_MP: magics["Physical Attack"]?[0] ?? 0, playerMagics_Damage: magics["Physical Attack"]?[1] ?? 0, playerHP: &hp, playerMP: &mp, playerPosition: playerPosition, enemyTargetedPosition: enemyTargetedPosition, toggleInputChoice: &toggleInputChoice, cardSelected: cardSelected, currentPlayerStatus: &currentStatus)
                            getEnemyBattleField(toggleInputChoice: &toggleInputChoice, enemy: enemy, enemyType: enemyType)
                          }
                          else if cardSelected == 1 || cardSelected == 2 || cardSelected == 3 || cardSelected == 4 || cardSelected == 5{
                            if cardSelected == 1 {
                              for speedCard in speedCardCollection {
                                  if speedCard.name == "light" {
                                      speedCard.speedPt -= 10
                                  }
                              }
                            }
                            else if cardSelected == 2 {
                              for speedCard in speedCardCollection {
                                  if speedCard.name == "thunder" {
                                      speedCard.speedPt -= 10
                                  }
                              }
                            }
                            else if cardSelected == 3 {
                              for speedCard in speedCardCollection {
                                  if speedCard.name == "sound" {
                                      speedCard.speedPt -= 10
                                  }
                              }
                            }
                            else if cardSelected == 4 {
                              for luckyCard in luckyCardCollection {
                                  if luckyCard.name == "lucky" {
                                      luckyCard.luckyChance -= 10
                                  }
                              }
                            }
                            else if cardSelected == 5 {
                              for immortalityCard in immortalityCardCollection {
                                  if immortalityCard.name == "lucky" {
                                  immortalityCard.immortalityPower -= 10
                                  }
                              }
                            }
                         enemy.calculateTheBattle(playerMagics_MP: magics["Physical Attack"]?[0] ?? 0, playerMagics_Damage: magics["Physical Attack"]?[1] ?? 0, playerHP: &hp, playerMP: &mp, playerPosition: playerPosition, enemyTargetedPosition: enemyTargetedPosition, toggleInputChoice: &toggleInputChoice, cardSelected: cardSelected, currentPlayerStatus: &currentStatus)
                            getEnemyBattleField(toggleInputChoice: &toggleInputChoice, enemy: enemy, enemyType: enemyType)
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
          else if inputBattle == 2{
            toggleInputMenuBattle = true
            var playerPosition: Int = 0
            var enemyTargetedPosition: Int = 0
            var cardSelected: Int = 0
            var togglePlayerPosition = false
            var toggleEnemyTargetedPosition = false
            var toggleCardSelected = false
            while !(playerPosition >= 1 && playerPosition <= 3) && !togglePlayerPosition{
              print("")
              print("Choose your default position [1 - 3]: ", terminator: "")
              if let inputPosition = readLine(), let inputPosition_Int = Int(inputPosition){
                togglePlayerPosition = true
                playerPosition = inputPosition_Int
                while !(enemyTargetedPosition >= 1 && enemyTargetedPosition <= 5) && !toggleEnemyTargetedPosition{
                  print("")
                  print("Choose enemy position [1 - 3] to be attacked: ", terminator: "")
                  if let inputEnemyPosition = readLine(), let inputEnemyPosition_Int = Int(inputEnemyPosition){
                    toggleEnemyTargetedPosition = true
                    enemyTargetedPosition = inputEnemyPosition_Int
                    if speedCardCollection.isEmpty && luckyCardCollection.isEmpty && immortalityCardCollection.isEmpty{
                      enemy.calculateTheBattle(playerMagics_MP: magics["Meteor"]?[0] ?? 0, playerMagics_Damage: magics["Meteor"]?[1] ?? 0, playerHP: &hp, playerMP: &mp, playerPosition: playerPosition, enemyTargetedPosition: enemyTargetedPosition, toggleInputChoice: &toggleInputChoice, cardSelected: 0,  currentPlayerStatus: &currentStatus)
                       getEnemyBattleField(toggleInputChoice: &toggleInputChoice, enemy: enemy, enemyType: enemyType)
                    }
                    else{
                      while !(cardSelected >= 1 && cardSelected <= 6) && !toggleCardSelected{
                        print("")
                        print("You can use you ability cards that you have: ")
                        print("")
                        let cardNames : [String] = ["light", "thunder", "sound"]
                          for (index, value) in cardNames.enumerated(){
                            let totalSpeedPt = speedCardCollection.filter { $0.name == value }.reduce(0) { $0 + $1.speedPt }
                            print("\(index + 1). Speed of \(value.prefix(1).uppercased() + value.dropFirst()) - You have \(totalSpeedPt) speed point(s) of this card.")
                          }

                         let totalLuckyChance = luckyCardCollection.filter { $0.name == "lucky" }.reduce(0) { $0 + $1.luckyChance }
                           print("4. Lucky Cards - You have \(totalLuckyChance) lucky chance(s) of this card.")

                        let totalImmortalityPower = immortalityCardCollection.filter { $0.name == "immortality" }.reduce(0) { $0 + $1.immortalityPower }
                         print("5. Immortality Cards - You have \(totalImmortalityPower) immortality power(s) of this card.")
                        print("For one used, your speedPt/luckyChance/immortalityPower will be substracted by 10.")
                        print("")
                        print("Choose your ability card [1/2/3/4/5/6(cancel)]: ", terminator: "")
                        if let inputSelectionCard = readLine(), let inputSelectionCard_Int = Int(inputSelectionCard){
                          toggleCardSelected = true
                          cardSelected = inputSelectionCard_Int
                          if cardSelected == 6{
                            enemy.calculateTheBattle(playerMagics_MP: magics["Meteor"]?[0] ?? 0, playerMagics_Damage: magics["Meteor"]?[1] ?? 0, playerHP: &hp, playerMP: &mp, playerPosition: playerPosition, enemyTargetedPosition: enemyTargetedPosition, toggleInputChoice: &toggleInputChoice, cardSelected: cardSelected, currentPlayerStatus: &currentStatus)
                            getEnemyBattleField(toggleInputChoice: &toggleInputChoice, enemy: enemy, enemyType: enemyType)
                          }
                          else if cardSelected == 1 || cardSelected == 2 || cardSelected == 3 || cardSelected == 4 || cardSelected == 5{
                            if cardSelected == 1 {
                              for speedCard in speedCardCollection {
                                  if speedCard.name == "light" {
                                      speedCard.speedPt -= 10
                                  }
                              }
                            }
                            else if cardSelected == 2 {
                              for speedCard in speedCardCollection {
                                  if speedCard.name == "thunder" {
                                      speedCard.speedPt -= 10
                                  }
                              }
                            }
                            else if cardSelected == 3 {
                              for speedCard in speedCardCollection {
                                  if speedCard.name == "sound" {
                                      speedCard.speedPt -= 10
                                  }
                              }
                            }
                            else if cardSelected == 4 {
                              for luckyCard in luckyCardCollection {
                                  if luckyCard.name == "lucky" {
                                      luckyCard.luckyChance -= 10
                                  }
                              }
                            }
                            else if cardSelected == 5 {
                              for immortalityCard in immortalityCardCollection {
                                  if immortalityCard.name == "lucky" {
                                  immortalityCard.immortalityPower -= 10
                                  }
                              }
                            }
                         enemy.calculateTheBattle(playerMagics_MP: magics["Meteor"]?[0] ?? 0, playerMagics_Damage: magics["Meteor"]?[1] ?? 0, playerHP: &hp, playerMP: &mp, playerPosition: playerPosition, enemyTargetedPosition: enemyTargetedPosition, toggleInputChoice: &toggleInputChoice, cardSelected: cardSelected, currentPlayerStatus: &currentStatus)
                            getEnemyBattleField(toggleInputChoice: &toggleInputChoice, enemy: enemy, enemyType: enemyType)
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
          else if inputBattle == 3{
            toggleInputMenuBattle = true
            print("")
            if mp < magics["Shield"]?[0] ?? 0{
              print("You don't have enough MP to use Shield.")
            }
            else{
               mp -= magics["Shield"]?[0] ?? 0
               print("You succeeded in blocking \(enemy.name)!")
            }
            print("Your only have \(mp) MP left.")
            toggleInputMenuBattle = false
          }
          else if inputBattle == 4{
            toggleInputMenuBattle = true
            var inputUsePotion: String = ""
            var inputBackFromHealWound: String = "string"
            var toggleInputUsePotion: Bool = false
            var countHeal: Int = 0
            if items["Potion"]?[0] ?? 0 > 0 {
                while !toggleInputUsePotion {
                    print("")
                    print("=========================================")
                    print("Your HP is \(hp).")
                    print("You have \(items["Potion"]?[0] ?? 0) Potion(s)")
                    print("")
                  if countHeal > 0 {
                    print("Still want to use 1 potion to heal wound again? [Y/N] ", terminator: "")
                  }
                  else{
                     print("Are you sure want to use 1 potion to heal wound? [Y/N] ", terminator: "")
                  }
                    inputUsePotion = readLine()?.lowercased() ?? ""
                    if inputUsePotion == "y" {
                      if items["Potion"]?[0] ?? 0 > 0{
                        if hp < 500{
                          let finalhp = hp + 20
                          if finalhp > 500{
                            hp = 500
                          }
                          else{
                            hp = finalhp
                          }
                        }
                        items["Potion"]?[0] -= 1
                        countHeal += 1
                      }
                      else{
                        toggleInputUsePotion = true
                        while inputBackFromHealWound != "" {
                            print("")
                            print("You don't have any potion left. Be careful of your next journey.")
                            print("Press [return] to go back: ", terminator: "")
                            inputBackFromHealWound = readLine() ?? ""
                            if inputBackFromHealWound == "" {
                              toggleInputMenuBattle = false
                            }
                        }
                      }
                    } else if inputUsePotion == "n" {
                        toggleInputUsePotion = true
                      toggleInputMenuBattle = false
                    }
                }
            } else {
                while inputBackFromHealWound != "" {
                    print("")
                    print("You don't have any potion left. Be careful of your next journey.")
                    print("Press [return] to go back: ", terminator: "")
                    inputBackFromHealWound = readLine() ?? ""
                    if inputBackFromHealWound == "" {
                      toggleInputMenuBattle = false
                    }
                }
            }
          }
          else if inputBattle == 5{
            toggleInputMenuBattle = true
            print("")
            print("Enemy's HP: ", enemy.health)
            toggleInputMenuBattle = false
          }
          else if inputBattle == 6{
            toggleInputMenuBattle = true
            var inputBackFromBattleMenu: String = "string"
            while inputBackFromBattleMenu != ""{
              print("")
              print("=========================================")
              print("You feel that if you don't escape soon, you won't be able to continue the fight.")
              print("You look around frantically, searching for a way out. You sprint towards the exit, your heart pounding in your chest.")
              print("")
              print("You're safe, for now.")
              print("Press [return] to continue: ", terminator: "")
              inputBackFromBattleMenu = readLine() ?? ""
              if inputBackFromBattleMenu == ""{
                toggleInputChoice = false
                toggleInputMenuBattle = true
              }
            }
          }
          else if inputBattle == 7{
              toggleInputMenuBattle = true
             addMP(toggleInputChoice: &toggleInputChoice, toggleInputMenuBattle: &toggleInputMenuBattle)
          }
        }
    }
  }
}
