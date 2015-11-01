//
//  ViewController.swift
//  Hangman
//
//  Created by Ewoud Hermans on 30-10-15.
//  Copyright © 2015 Ewoud Hermans. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Creates global variables
    var length : Int = 0
    var word: String?
    var wordArray = [Character]()
    var answer: Array<Character> = Array(count: 10 , repeatedValue: "\t")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func makeWord(sender: AnyObject) {
        
        // Array with possible words
        let words: [String] = ["bomen", "struik", "wortels", "blad", "hars", "klimop", "barst", "nerf", "stronk", "jaren", "hout", "hond", "balou", "loebas"]
        // Selects word randomly
        var random = Int(arc4random_uniform(11))
        word = words[random]
        print(word)
        // Calculates lenth of random word
        length = word!.characters.count
        // Label displays how many letters in word
        letterCount.text = "The word has \(length) letters"
        print (length)
        wordLabel.text = ""
        // Clear characters from array en fill with tabs
        answer = Array(count: length, repeatedValue: "?")
        print (answer)
        let stringRepresentation = String(answer)
        wordLabel.text = stringRepresentation
    }
    
    @IBAction func submitLetter(sender: AnyObject) {
        
        var stringRepresentation : String?
        let letter = typeLetter.text!
        // Selects typed in letter (first)
        let searchCharacter: Character = letter[letter.startIndex]
        // Puts random word in array
        wordArray = Array(word!.characters)
        print (wordArray)
        // Searches for letter in random word array
        if wordArray.contains(searchCharacter) {
            print (searchCharacter)
            // Locates where letter belongs in the word
            let index : Int = wordArray.indexOf(searchCharacter)!
            print (index)
            // Removes character from array where de letter belongs
            answer.removeAtIndex(index)
            // Inserts the letter at the right spot
            answer.insert(searchCharacter, atIndex: index)
            print (answer)
            // Makes string from array
            stringRepresentation = String(answer)
            print (stringRepresentation)
            // Label displays string
            wordLabel.text = stringRepresentation
            // Clears letter from text field
            typeLetter.text = ""
        }
        if stringRepresentation == word {
            letterCount.text = "Gefeliciteerd! Je hebt het woord gevonden!"
        }
    }
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var typeLetter: UITextField!
    @IBOutlet weak var letterCount: UILabel!
}

