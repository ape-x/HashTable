//
//  Utilities.swift
//  HashTable
//
//  Created by Mihnea Stefan on 10/09/2020.
//  Copyright © 2020 Mihnea Stefan. All rights reserved.
//

import Foundation

protocol Hasher {
    func hash(input : String)->Int
}

struct Person {
    var name : String
    var nationality : String
    var age : Int
}
