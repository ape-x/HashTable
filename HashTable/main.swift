//
//  main.swift
//  HashTable
//
//  Created by Mihnea Stefan on 10/09/2020.
//  Copyright © 2020 Mihnea Stefan. All rights reserved.
//

import Foundation


var obj = HashTable(number_of_people: 1000)
obj.insertUser(person: Person(name: "John Smith", nationality: "American", age: 37))
obj.insertUser(person: Person(name: "Almond Gal", nationality: "American", age: 38))
obj.insertUser(person: Person(name: "Almond Gap", nationality: "French", age: 52)) // Collision with previous inserted user, chaining handles it
obj.insertUser(person: Person(name: "Michael Phillip", nationality: "American", age: 34))
obj.insertUser(person: Person(name: "Elliot Alderson", nationality: "American", age: 28))
obj.insertUser(person: Person(name: "Andrew Woods", nationality: "American", age: 56))
obj.insertUser(person: Person(name: "Davy Jones", nationality: "American", age: 99))

obj.removeUser(person_name: "Almond Gal")
obj.searchForUser(person_name: "Almond Gap")
