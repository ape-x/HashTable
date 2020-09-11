//
//  LinkedList.swift
//  HashTable
//
//  Created by Mihnea Stefan on 11/09/2020.
//  Copyright © 2020 Mihnea Stefan. All rights reserved.
//

import Foundation


class Node {
    var person : Person
    var nextNode : Node?
    
    init(person : Person, next_node node : Node?){
        self.person = person
        nextNode = node
    }
}

class LinkedList {
    
    var listHead : Node?
    init(person : Person){
        self.listHead = Node(person: person, next_node: nil)
    }
    
    func insertPerson(person : Person){
        var traverseNode = listHead!
        let newNode = Node(person: person, next_node: nil)
        while traverseNode.nextNode != nil{
            traverseNode = traverseNode.nextNode!
        }
        traverseNode.nextNode = newNode
    }
    
    func searchForPerson(person : String)->Person?{
        var traverseNode : Node? = listHead
        while traverseNode != nil &&
        traverseNode?.person.name != person{
            traverseNode = traverseNode?.nextNode
        }
        if traverseNode?.nextNode == nil &&
            traverseNode?.person.name != person{
            return nil
        }
        return traverseNode?.person
    }
    
    func removePerson(person : String)->Bool{
        var traverseNode = listHead!
        
        if traverseNode.person.name == person &&
        traverseNode.nextNode != nil{
            listHead = traverseNode.nextNode!
            return true
        }else if traverseNode.person.name == person &&
        traverseNode.nextNode == nil{
            listHead = nil
            return true
        }
        
        while traverseNode.nextNode != nil &&
            traverseNode.nextNode?.person.name != person{
            traverseNode = traverseNode.nextNode!
        }
        if traverseNode.nextNode == nil &&
        traverseNode.person.name != person{
            return false
        }
        traverseNode.nextNode = traverseNode.nextNode!.nextNode
        return true
    }
    
    func printList(){
        var traverseNode : Node? = listHead
        while traverseNode != nil{
            print(traverseNode!.person)
            traverseNode = traverseNode?.nextNode
        }
    }
}
