//
//  FetchGameTexts.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-05-12.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import Foundation
import Firebase
import Firebase

//When opening application load game texts from Firebase

struct FetchGameTexts {
    var ref: DatabaseReference!
    
    var jagHarAldrig = ["haft trekant", "badat naken med de motsatta könet", "haft sex när de varit någon annan i rummet", "använt en sexleksak", "haft en crush på en lärare", "haft sex med fler än en person på en kväll", "knarkat eller rökt på", "skickat nakenbilder", "tjuvlyssnat när andra har haft sex", "haft sex med en kompis ex", "dumpat någon på sms", "blivit tagen av polisen", "suttit i fyllecell", "använt någon annans leg för att komma in på krogen", "haft sex i en bil", "ljugit om hur många jag har haft sex med", "haft sex med någon som varit 10+ äldre än mig", "fejkat en orgasm", "haft en könssjukdom", "haft en kk", "haft analsex", "tänkt på någon annan under sex", "haft sex med någon av samma kön", "hoppat bungyjump", "gått igenom ett breakup", "startat ett slagsmål", "smugit ut ur huset", "snattat", "fantiserat om att vara en delfin", "ljugit om min ålder för ett ragg", "gjort en lap dance", "legat med någon som jag känt mindre än två timmar", "gett ut fel telefonnummer med mening", "dygnat","haft Corona", "varit gipsad", "haft sex med någon i rummet", "haft sex utomhus", "haft sex i en jacuzzi", "haft sex med samma person som min allra bästa kompis", "fantiserat om någon i detta rum", "fantiserat om att slå min chef på käften", "somnat när jag lagar fyllekäk", "råkat gilla en bild när jag stalkat någon på Instagram", "vaknat upp dagen efter en utekväll utan att minnas hur jag kom dit", "flörtat med en person som varit upptagen", "tyckt att personer som använder ordet ”hen” är efterblivna", "släkt lampan under sex för att slippa se den andra", "kört bil utan körkort", "fantiserat om någon av samma kön", "onanerat mer än fem gånger på en dag", "glömt att betala tillbaka någon med flit", "fått fel mat men varit för blyg/konflikträdd för att klaga", "Asgarvat vid fel tillfälle", "begått ett skattebrott", "blivit så rädd av en skräckfilm att jag inte kunnat sova", "bestämt mig för att aldrig mer dricka alkohol, men sen gjort de dagen efter", "tagit mer än 100kg i bänkpress", "pekat finger åt någon i trafiken", "snott någon annans dricka på en fest", "glömt kvar någon hos ett ligg som jag aldrig fått tillbaka", "deltagit i gruppsex", "pruttat och försökt dölja de med en hostning", "ätit upp en ciggfimp under fyllan", "aldrig fått arga blickar från asiaten i kassan när jag tagit mat för tredje gången på en thaibuffe"]
    
    var array = [String]()
    
    init() {
        ref = Database.database().reference()
        //        for i in 0 ... jagHarAldrig.count-1 {
        //            ref.child("GameTexts").child("JagHarAldrig").child("\(i)").setValue(["\(i)": jagHarAldrig[i]])
        //        }
        ref.child("GameTexts").child("JagHarAldrig").observe(.childAdded) { (snapshot) in
            if let userDict = snapshot.value as? [String:Any] {
                let userDictValue = userDict.values
                
                print("\(userDictValue.first!)")
                
                //array.append(userDict.)
            }
        }
    }
    
    
}
