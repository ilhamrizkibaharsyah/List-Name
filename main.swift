//
//  main.swift
//  List-Name
//
//  Created by Ilham Rizki Baharsyah on 17/03/22.
//

import Foundation

var listName = [String]()
var isRunning = true

func getInput(message: String) -> String? {
    print(message, terminator: " ")
    return readLine()
}

func getInputInt(message: String) -> Int? {
    if let inputString = getInput(message: message){
        return Int(inputString)
    } else {
        return nil
    }
}

func showAllName(){
    if listName.isEmpty {
        print("Not available name on the list.\n")
    } else {
        for (index, value) in listName.enumerated() {
            print("[\(index+1)] \(value)")
    }
}
}

func insertName(){
    if let name = getInput(message: "Input your new member name:") {
        listName.append(name)
    } else {
        insertName()
        print("Input not valid.")
    }
}

func editName(){
    showAllName()
    if let position = getInputInt(message: "Choose name position do you wanna change:") {
        if position <= listName.count && position > 0 {
            if let name = getInput(message: "Input your new member name:") {
                listName[position-1] = name
            }
        } else {
            showMenu()
        }
    } else {
        editName()
        print("Input not valid.")
    }
}

func deleteName(){
    showAllName()
    if let position = getInputInt(message: "Choose name position do you wanna delete:") {
        if position <= listName.count && position > 0 {
            listName.remove(at: position-1)
        } else {
            showMenu()
        }
    } else {
        deleteName()
        print("Input not valid.")
    }
}

func showMenu() {
    print("\n---------------------------")
    print("Welcome to Dicoding Academy")
    print("---------------------------")
    print("[1] Show all member")
    print("[2] Add new member")
    print("[3] Change name of member")
    print("[4] Delete member")
    print("[5] Quit")
    if let position = getInputInt(message: "\nPlease select the menu:") {
        switch position {
        case 1:
            showAllName()
        case 2:
            insertName()
        case 3:
            editName()
        case 4:
            deleteName()
        case 5:
            isRunning = false
            print("Thank you, see you again.\n")
        default:
            print("Choose not valid.")
        }
    } else {
        print("Name not valid.")
    }
}
while isRunning {
    showMenu()
}
