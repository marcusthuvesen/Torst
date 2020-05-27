//
//  ProvideGameRules.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-05-23.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import Foundation


struct ProvideGameRules {
    
    
    func jagHarAldrigRules() -> String {
        let jagHarAldrigRules = "Alla deltagare ska placera sig så att ni ser varandra.\n\nSpelaren med telefonen läser upp påståendena som startar med \("Jag har aldrig...") alla som gjort det som läses upp ska dricka, om endast en person dricker måste man förklara/beskriva händelsen."
        return jagHarAldrigRules
    }
    
    func peklekenRules() -> String {
        let peklekenRules = "Alla deltagare skall placera sig så att ni ser varandra.\n\nSpelaren med telefonen läser upp påståenden. Sedan ska alla deltagare enskilt välja den person de tycker passar in bäst på påståendet och peka på denna. Den person som fått flest pek dricker."
        
        return peklekenRules
    }
    
    func ryggMotRyggRules() -> String{
        let ryggMotRyggRules = "Två spelare sitter på stolar med ryggarna mot varandra så att de inte kan se varandra.\n\nEn annan person med telefonen läser upp påståenden och spelarna på stolen ska peka på den person som de tycker att det stämmer bäst in på. Om båda pekar på samma ska resten av deltagarna dricka, annars dricker de två spelarna."
        return ryggMotRyggRules
    }
    
    func utmaningarRules() -> String{
        let utmaningarRules = "Alla deltagare skall placera sig så att ni ser varandra.\n\nSpelaren med telefonen läser upp utmaningar till den första personen till vänster och fortsätter sedan runt i gruppen. Personen som får utmaningen måste göra denna eller dricka 5 klunkar."
        return utmaningarRules
    }
    
    func mixRules() -> String {
        let mixRules = "mixregler"
        return mixRules
    }
    
    
}
