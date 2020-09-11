//
//  main.swift
//  HashTable
//
//  Created by Mihnea Stefan on 10/09/2020.
//  Copyright © 2020 Mihnea Stefan. All rights reserved.
//

import Foundation


var obj = HashTable(number_of_people: 1000)
obj.insertPerson(person: Person(name: "John Smith", nationality: "American", age: 37))
obj.insertPerson(person: Person(name: "Michael Phillip", nationality: "American", age: 34))
obj.insertPerson(person: Person(name: "Elliot Alderson", nationality: "American", age: 28))
obj.insertPerson(person: Person(name: "Andrew Woods", nationality: "American", age: 56))
obj.insertPerson(person: Person(name: "Davy Jones", nationality: "American", age: 99))

obj.searchForPerson(person_name: "John Smith")

