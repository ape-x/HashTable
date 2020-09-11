//
//  HashTable.swift
//  HashTable
//
//  Created by Mihnea Stefan on 10/09/2020.
//  Copyright © 2020 Mihnea Stefan. All rights reserved.
//

import Foundation

//Disclaimer : due to the computational complexity of the used hashing algorithm, linear search WILL be more efficient unless
//the table contains a large number of elements

final class HashTable : Hasher {
    
    private
    
    var hasher : SHA512
    var tableOfPersons : UnsafeMutablePointer<Person?>
    var count : Int
    public
    
    init(number_of_people number : Int){
        hasher = SHA512(seed: "")
        tableOfPersons = UnsafeMutablePointer<Person?>.allocate(capacity: number)
        count = number
    }
    
    func hash(input: String)->Int{
        hasher.setSeed(seed: input)
        hasher.hashComputation()
        let hashedName = Array(hasher.messageDigest!)
        var user_id = 0
        for i in stride(from: 0, to: 64, by: 4){
                   user_id+=(Int)(hashedName[i].asciiValue!)
                   user_id+=(Int)(hashedName[i+1].asciiValue!)*i
                   user_id+=(Int)(hashedName[i+2].asciiValue!)
                   user_id+=(Int)(hashedName[i+3].asciiValue!)+i
               }
       user_id%=count
        return user_id
    }

    
    func insertPerson(person : Person){
        let user_id : Int = hash(input: person.name)
        if tableOfPersons[user_id]?.name.count != nil {
            print("User ID already assigned")
            return
        }
        tableOfPersons[user_id] = person
        print("ID is \(user_id)")
        
    }
    
    func removePerson(perso_name name : String){
        let user_id : Int = hash(input : name)
        if tableOfPersons[user_id] == nil{
            print("No such user exists")
            return
        }
        tableOfPersons[user_id] = nil
        print("User \(user_id) has been removed from the table")
    }
    
    func searchForPerson(person_name name: String){
        let user_id : Int = hash(input: name)
        if tableOfPersons[user_id] == nil{
            print("Could not find searched user")
            return
        }
        print(tableOfPersons[user_id]!)
    }
    
    
}
