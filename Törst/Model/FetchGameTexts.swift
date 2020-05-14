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
    
    init() {
        ref = Database.database().reference()
        //        for i in 0 ... jagHarAldrig.count-1 {
        //            ref.child("GameTexts").child("JagHarAldrig").child("\(i)").setValue(["\(i)": jagHarAldrig[i]])
        //        }
        
    }
    
    func fetchGameTexts(gameType : String, completion: @escaping ([String]) -> ()){
        var fetchedArray = [String]()
        
        ref.child("GameTexts").child(gameType).observe(.value) { (snapshot, error) in
            
            for child in snapshot.children {
                fetchedArray.append("\(child)")
            }
            completion(fetchedArray)
        }
    }
    
    
}
