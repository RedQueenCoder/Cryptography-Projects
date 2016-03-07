//
//  HelperFunctions.swift
//  CaesarCypher
//
//  Created by Janie Clayton-Hasz on 3/7/16.
//  Copyright © 2016 Red Queen Coder. All rights reserved.
//

import Foundation

let alphabet:[Character] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

func randomNumber() -> Int {
    return Int(arc4random_uniform(25) + 1)
}

func encryptArray(var offset:Int) -> [Character] {
    
    if offset < 1 {
        offset = 1
    }
    
    if offset > 25 {
        offset = 25
    }
    
    var array = alphabet
    let slice = array[0..<offset]
    array.removeRange(0..<offset)
    array.appendContentsOf(slice)
    
    return array
    
}

func encryptCharacter(input:Character, encryptedArray:[Character]) -> Character {
    // I want to return a letter that lines up with the corresponding encrypted array. If it's not a character, I just want to return it.
    
    if alphabet.contains(input) {
        print("input is in alphabet: \(input)")
        let index = alphabet.indexOf(input)
        return encryptedArray[index!]
    } else {
        print("Falls through the test for non-letter characters: \(input)")
        return input
    }
}

func encryptedString(stringToEncrypt:String) -> String {
    let lowercaseStringToEncrypt = stringToEncrypt.lowercaseString
    let offset = randomNumber()
    let encryptionArray = encryptArray(offset)
    let array = [Character](lowercaseStringToEncrypt.characters)
    
    // Can I do a map where I check each character and apply encrypt character on it and get a new array?
    let encryptedArray = array.map({encryptCharacter($0, encryptedArray: encryptionArray)})
    
    let encryptedString = String(encryptedArray)
    
    // Need to add some formatting to include the offset and an equivalent like A = U
    
    return "\(encryptedString)\n The offset was \(offset).\n \(alphabet[0]) = \(encryptionArray[0])"
}