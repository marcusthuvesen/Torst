//
//  FetchGameTexts.swift
//  Törst
//
//  Created by Marcus Thuvesen on 2024-09-01.
//  Copyright © 2024 Marcus Thuvesen. All rights reserved.
//

import Foundation
import FirebaseDatabase

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
