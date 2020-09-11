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
    var tableOfUsers : UnsafeMutablePointer<LinkedList?>
    var count : Int
    public
    
    init(number_of_people number : Int){
        hasher = SHA512(seed: "")
        tableOfUsers = UnsafeMutablePointer<LinkedList?>.allocate(capacity: number)
        tableOfUsers.initialize(repeating:nil, count: number)
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
    func insertUser(person : Person){
        let user_id : Int = hash(input : person.name)
        tableOfUsers[user_id]?.listHead != nil ? (tableOfUsers[user_id]?.insertPerson(person: person)) : (tableOfUsers[user_id] = LinkedList(person: person))
        print("Inserted user \(person.name) with ID \(user_id)")

    }
    
    func removeUser(person_name name: String){
        let user_id : Int = hash(input : name)
        if (tableOfUsers[user_id]?.removePerson(person: name))!{
            print("User \(name) has been succesfully removed")
        }else{
            print("No such user")
        }
    }
    func searchForUser(person_name name : String){
        let user_id : Int = hash(input : name)
        if let user = tableOfUsers[user_id]?.searchForPerson(person: name){
            print("Found searched user \(user)")
            return
        }
        print("Could not find searched user \(name)")
    }
    
    
}
