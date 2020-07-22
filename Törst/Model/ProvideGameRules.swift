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
        let jagHarAldrigRules = "Personen med telefonen läser upp påståendena som startar med \"jag har aldrig\" alla som gjort det som läses upp ska dricka, om endast en person dricker måste man förklara/beskriva händelsen."
        return jagHarAldrigRules
    }
    
    func peklekenRules() -> String {
        let peklekenRules = "Alla deltagare ska placera sig så att de ser varandra.\n\nSpelaren med telefonen läser upp påståendena. Alla deltagare väljer den person de tycker passar bäst in på påståendet och pekar på den. Du dricker sedan samma antal klunkar som pek du fått."
        
        return peklekenRules
    }
    
    func ryggMotRyggRules() -> String {
        let ryggMotRyggRules = "Två av spelarna sitter på varsin stol med ryggarna mot varandra.\n\nEn annan person håller telefonen och läser upp påståendena. Spelarna på stolarna ska därefter peka på den person som de tycker påståendet stämmer bäst in på. Tycker man sig själv, pekar man på sig själv. Tycker man den andra, pekar man rakt fram. Om båda pekar på samma ska resten av deltagarna dricka, annars dricker de två spelarna."
        return ryggMotRyggRules
    }
    
    func utmaningarRules() -> String {
        let utmaningarRules = "Personen med telefonen läser upp en utmaning till personen till vänster och fortsätter sedan runt i gruppen. Om deltagaren inte vill/kan göra utmaningen ska den dricka 5 klunkar."
        return utmaningarRules
    }
    
    func mixRules() -> String {
        let mixRules = "mixregler"
        return mixRules
    }
    
    
}
