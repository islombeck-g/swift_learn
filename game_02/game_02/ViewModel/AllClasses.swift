
import Foundation

class GameSettingsViewModel:ObservableObject {
    
    @Published var settings: GameSettings
    
    init(){
        self.settings = GameSettings(countPlayers: 3, countMafia: 1, DonMafia: false, Maniac: false, Doctor: false, Journalist: false, freePlaces: 1)
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
    
//    func addNameGamers(me:[String]){
//        self.settings.peopleName = me
//    }
    
    
    func whoiswhoRand(name:[String]){
        let randomNames = name.shuffled()
        var i = 0
        while self.settings.countMafia != 0{
            self.settings.names.append("\(randomNames[i])")
            self.settings.icons.append("mafia")
            self.settings.countMafia -= 1
            i += 1
        }
        if self.boolDonMafia(){
            self.settings.names.append("\(randomNames[i])")
            self.settings.icons.append("donMafia")
            i += 1
        }
        if self.boolManiac(){
            self.settings.names.append("\(randomNames[i])")
            self.settings.icons.append("knife")
            i += 1
        }
        if self.boolDoctor(){
            self.settings.names.append( "\(randomNames[i])")
            self.settings.icons.append("doc")
            i += 1
        }
        if self.boolJournalist(){
            self.settings.names.append("\(randomNames[i])")
            self.settings.icons.append("journalist")
            i += 1
        }
        while i<randomNames.count{
            self.settings.names.append("\(randomNames[i])")
            self.settings.icons.append("man")
            i += 1
        }
    }

    func getName(index:Int)->String{
        return self.settings.names[index]
    }
    func getIcon(index:Int)->String{
        return self.settings.icons[index]
    }
    func getListOfNames() -> [String]{
        return self.settings.names
    }
    func getListOfIcons() -> [String]{
        return self.settings.names
    }
    
}














