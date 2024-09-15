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
        let jagHarAldrigRules = "En person läser påståendena, och de som känner igen sig utför en bestämd konsekvens.\n\nOm bara en person har erfarenheten, blir det story time."
        return jagHarAldrigRules
    }
    
    func peklekenRules() -> String {
        let peklekenRules = "Alla deltagare ska sitta så att de ser varandra. Spelaren med telefonen läser påståendena och alla pekar på den de tycker passar bäst.\n\nDen som får flest pekningar får göra en överenskommen konsekvens."
        
        return peklekenRules
    }
    
    func ryggMotRyggRules() -> String {
        let ryggMotRyggRules = "Två spelare sitter rygg mot rygg. En tredje person läser påståenden, och spelarna pekar på sig själva eller den andra beroende på vem påståendet stämmer in bäst på.\n\nOm spelarna pekar samma får de rätt, och publiken gör en konsekvens. Om de pekar olika får spelarna själva utföra en konsekvens."
        return ryggMotRyggRules
    }
    
    func utmaningarRules() -> String {
        let utmaningarRules = "Deltagaren med telefonen läser upp en utmaning till personen till vänster och fortsätter sedan runt i gruppen."
        return utmaningarRules
    }
    
    func mixRules() -> String {
        let mixRules = "Spelen \"Jag har aldrig\", \"Pekleken\" och \"Utmaningar\" blandas slumpmässigt, tillsammans med två nya spel: \"Kategori\" och \"Handuppräckning\". I \"Kategori\" nämner alla något inom en given kategori, och den som tar för lång tid eller upprepar sig får en konsekvens. I \"Handuppräckning\" läses ett dilemma upp, och alla röstar samtidigt. Minoriteten får en konsekvens."
        return mixRules
    }
    
    
}
