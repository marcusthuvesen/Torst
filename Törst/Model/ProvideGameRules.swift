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
        let jagHarAldrigRules = "Personen med telefonen läser upp påståendena som startar med \"jag har aldrig\".\n\nAlla som gjort det som läses kan dricka valfri dricka, om endast en person dricker måste man förklara/beskriva händelsen."
        return jagHarAldrigRules
    }
    
    func peklekenRules() -> String {
        let peklekenRules = "Alla deltagare ska placera sig så att de ser varandra.\n\nSpelaren med telefonen läser upp påståendena. Alla deltagare väljer den person de tycker passar bäst in på påståendet och pekar på den. Du kan sedan dricka av valfri dryck samma antal klunkar som pek du fått."
        
        return peklekenRules
    }
    
    func ryggMotRyggRules() -> String {
        let ryggMotRyggRules = "Två av spelarna sitter på varsin stol med ryggarna mot varandra.\n\nEn annan person håller telefonen och läser upp påståendena. Spelarna på stolarna ska därefter peka på den person som de tycker påståendet stämmer bäst in på. Tycker man sig själv, pekar man på sig själv. Tycker man den andra, pekar man rakt fram. Om båda pekar på samma kan resten av deltagarna dricka valfri dryck, annars dricker de två spelarna."
        return ryggMotRyggRules
    }
    
    func utmaningarRules() -> String {
        let utmaningarRules = "Deltagaren med telefonen läser upp en utmaning till personen till vänster och fortsätter sedan runt i gruppen."
        return utmaningarRules
    }
    
    //\n\nOm deltagaren inte vill/kan göra utmaningen kan den dricka 5 klunkar.
    
    func mixRules() -> String {
        let mixRules = "Spelen \"jag har aldrig\", \"pekleken\" och \"utmaningar\" kommer slumpmässigt blandas. Det kommer även blandas in två nya spel, vilka är \"kategori\" och \"handuppräckning\".\n\nI \"kategori\" kommer en kategori att presenteras (t.ex. bilmärken) sedan går man varvet runt och nämner en sak inom kategorin. Tar de för lång tid eller om någon upprepar sig får den dricka.\n\nHanduppräckning går ut på att ett dilemma läses upp och alla ska rösta på vad man föredrar samtidigt, minoriteten kan dricka valfri dryck.\nHand upp = första alternativet\nHand ner = andra alternativet\n\nUtmaningarna ska utföras av en specifik person som bestäms i medurs turordning."
        return mixRules
    }
    
    
}
