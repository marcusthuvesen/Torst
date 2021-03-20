//
//  FetchGameTexts.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2020-05-12.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import Foundation
import FirebaseDatabase

//When opening application load game texts from Firebase

struct FetchGameTexts {
    var ref: DatabaseReference!
    
    init() {
        ref = Database.database().reference()
    }
    
    func pushData() {
      //For pushing more statements  self.ref.child("GameTexts").child("RyggMotRygg").setValue(ryggMotRygg)
    }
    
    func fetchGameTexts(gameType : String, completion: @escaping ([String])->Void) {
        var fetchedArray = [String]()
        
        ref.child("GameTexts").child(gameType).observeSingleEvent(of: .value){ (snapshot, error) in
            if snapshot.exists() {
                     fetchedArray = snapshot.value as? [String] ?? []
            }
            completion(fetchedArray)
        }
        
    }
    
}

