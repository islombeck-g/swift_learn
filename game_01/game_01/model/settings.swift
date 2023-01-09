//
//  settings.swift
//  game_01
//
//  Created by Islombek Gofurov on 03.01.2023.
//

import Foundation


final class GameSettings: ObservableObject {
    @Published var countAllPlayers: Int = 3
    @Published var countOfMafia: Int = 1
    @Published var DonMafia: Bool = false
    @Published var Maniac: Bool = false
    @Published var Doctor: Bool = false
    @Published var Journalist: Bool = false
    var freePlaces: Int = 2
    
    
//    init() {
//        self.countAllPlayers = 3
//        self.countOfMafia = 1
//        self.DonMafia = false
//        self.Maniac = false
//        self.Doctor = false
//        self.Journalist = false
//        self.freePlaces = 2
//    }
    
    
    func addCountAllPlayers(){
        self.countAllPlayers = self.countAllPlayers + 1
        self.freePlaces = self.freePlaces + 1
    }
    func minusCountAllPlayers(){
        if self.countAllPlayers != 3{
            
            self.countAllPlayers = self.countAllPlayers - 1
            self.freePlaces = self.freePlaces - 1
            if self.countAllPlayers/3 < self.countOfMafia{
                minuscountOfMafia()
            }
            if self.freePlaces < 0{
                if self.DonMafia{
                    self.donMafiaInGame()
                }else if self.Maniac{
                    self.maniacInGame()
                }else if self.Doctor{
                    self.doctorInGame()
                }else{
                    self.journalistInGame()
                }
            }
        }
    }
    func printPeople() ->String{
        return String(self.countAllPlayers)
    }
    func printMafia() ->String{
        return String(self.countOfMafia)
    }
    func addCountOfMafia(){
        if self.countAllPlayers/3 > self.countOfMafia{
            self.countOfMafia = self.countOfMafia + 1
            self.freePlaces = self.freePlaces - 1
        }
    }
    func minuscountOfMafia(){
        if self.countOfMafia != 1{
            self.countOfMafia = Int(self.countOfMafia) - 1
            self.freePlaces = self.freePlaces + 1
        }
    }
    
    
    
    
    
    func donMafiaInGame(){
        if self.DonMafia {
            self.freePlaces = self.freePlaces + 1
            self.DonMafia = false
            
        }
        else{
            if self.freePlaces > 0{
                self.freePlaces = self.freePlaces - 1
                self.DonMafia = true
                return
            }
            self.DonMafia = false
        }
    }
    func doctorInGame(){
        if self.Doctor{
            self.freePlaces = self.freePlaces + 1
            self.Doctor = false
            
        }else{
            if self.freePlaces > 0{
                self.freePlaces = self.freePlaces - 1
                self.Doctor = true
                return
            }
            self.Doctor = false
            
        }
    }
    func maniacInGame(){
        if self.Maniac{
            self.freePlaces = self.freePlaces + 1
            self.Maniac = false
            
        }else{
            if self.freePlaces > 0{
                self.freePlaces = self.freePlaces - 1
                self.Maniac = true
                return
            }
            self.Maniac = false
            
        }
    }
    func journalistInGame(){
        if self.Journalist{
            self.freePlaces = self.freePlaces + 1
            self.Journalist = false
            
        }else{
            if self.freePlaces > 0{
                self.freePlaces = self.freePlaces - 1
                self.Journalist = true
                return
            }
            self.Journalist = false
            
        }
    }
}
