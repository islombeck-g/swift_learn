
import Foundation

class GameSettingsViewModel:ObservableObject {
    
    var settings: GameSettings
    
    init(){
        self.settings = GameSettings(countPlayers: 3, countMafia: 1, DonMafia: false, Maniac: false, Doctor: false, Journalist: false, freePlaces: 2, whoiswhoList: ["GoodPeople" : "person.fill"])
    }
    
    func addCountPlayers(){
        self.settings.countPlayers += 1
        self.settings.freePlaces += 1
    }
    
    func minusCountPlayers(){
        if self.settings.countPlayers != 3 {
            self.settings.countPlayers -= 1
            self.settings.freePlaces -= 1
            if self.settings.countPlayers/3 < self.settings.countMafia{
                minusCountMafia()
            }
            if self.settings.freePlaces < 0 {
                if self.settings.DonMafia{
                    donMafiaIngame()
                } else if self.settings.Maniac{
                    maniacInGame()
                }else if self.settings.Doctor{
                    doctorInGame()
                }else{
                    journalistInGame()
                }
            }
        }
    }
    func printPeople() ->String{
        return String(self.settings.countPlayers)
    }
    
    func printMafia() ->String{
        return String(self.settings.countMafia)
    }
    
    func addCountMafia(){
        if self.settings.countPlayers/3 > self.settings.countMafia{
            self.settings.countMafia += 1
            self.settings.freePlaces -= 1
        }
    }
    
    func minusCountMafia(){
        if self.settings.countMafia != 1{
            self.settings.countMafia -= 1
            self.settings.freePlaces += 1
        }
    }
    
    func donMafiaIngame(){
        if self.settings.DonMafia {
            self.settings.freePlaces += 1
            self.settings.DonMafia = false
            
        }
        else{
            if self.settings.freePlaces > 0{
                self.settings.freePlaces -= 1
                self.settings.DonMafia = true
                return
            }
            self.settings.DonMafia = false
        }
    }
    
    func doctorInGame(){
        if self.settings.Doctor{
            self.settings.freePlaces += 1
            self.settings.Doctor = false
        }else{
            if self.settings.freePlaces > 0{
                self.settings.freePlaces -= 1
                self.settings.Doctor = true
                return
            }
            self.settings.Doctor = false
        }
    }
    func maniacInGame(){
        if self.settings.Maniac{
            self.settings.freePlaces += 1
            self.settings.Maniac = false
        }else{
            if self.settings.freePlaces > 0{
                self.settings.freePlaces -= 1
                self.settings.Maniac = true
                return
            }
            self.settings.Maniac = false
        }
    }
    func journalistInGame(){
        if self.settings.Journalist{
            self.settings.freePlaces += 1
            self.settings.Journalist = false
        }else{
            if self.settings.freePlaces > 0{
                self.settings.freePlaces -= 1
                self.settings.Journalist = true
                return
            }
            self.settings.Journalist = false
        }
    }
    
    func boolDonMafia()->Bool{
        return self.settings.DonMafia
    }
    func boolManiac()->Bool{
        return self.settings.Maniac
    }
    func boolDoctor()->Bool{
        return self.settings.Doctor
    }
    func boolJournalist()->Bool{
        return self.settings.Journalist
    }
    func countAllGamers()->Int{
        return self.settings.countPlayers
    }
    
    func addNameGamers(me:[String]){
        self.settings.peopleName = me
    }
    
    
    func whoiswhoRand(){
        var i = 0
        var t = ""
        if self.boolDonMafia(){
            
            self.settings.whoiswhoList["DonMafia \(self.settings.peopleName[i])"] = "hat"
            i += 1
        }
        if self.boolDoctor(){
            self.settings.whoiswhoList["Doctor \(self.settings.peopleName[i])"] = "doctor"
            i += 1
        }
        if self.boolDonMafia(){
            self.settings.whoiswhoList["Maniac \(self.settings.peopleName[i])"] = "knife"
            i += 1
        }
        if self.boolJournalist(){
            self.settings.whoiswhoList["Journalist \(self.settings.peopleName[i])"] = "camera.fill"
            i += 1
        }
        while self.settings.countMafia != 0{
            self.settings.whoiswhoList["Mafia \(self.settings.peopleName[i])"] = "knife"
        }
        
    }
    
}














