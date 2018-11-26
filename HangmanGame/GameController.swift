//
//  GameController.swift
//  HangmanGame
//
//  Created by SUP'Internet 08 on 20/11/2018.
//  Copyright © 2018 SUP'Internet 08. All rights reserved.
//

import UIKit

class GameController: UIViewController {
    var guessedLetters: [String] = []
    var incorrectGuesses = 0
    var correctGuesses = 0
    var dataButton = [
        1: "A",
        2: "B",
        3: "C",
        4: "D",
        5: "E",
        6: "F",
        7: "G",
        8: "H",
        9: "I",
        10: "J",
        11: "K",
        12: "L",
        13: "M",
        14: "N",
        15: "O",
        16: "P",
        17: "Q",
        18: "R",
        19: "S",
        20: "T",
        21: "U",
        22: "V",
        23: "W",
        24: "X",
        25: "Y",
        26: "Z"
    ]
    
    var word: String!
    var i = 0

    @IBOutlet weak var endGameButton: UIButton!
    @IBOutlet weak var endText: UITextView!
    
    @IBOutlet weak var textGame: UITextView!
    
    @IBAction func endGameBtn(_ sender: UIButton) {
        self.performSegue(withIdentifier: "backToView", sender: nil)
    }
    
    @IBAction func btnLetters(_ sender: AnyObject) {
        let characters = Array(word.uppercased())
        let letters = dataButton[sender.tag!]
        var disableButton = sender as? UIButton
        guessedLetters.append(letters!)
        updateWordInput()
        var contain = true
        disableButton?.isEnabled = false
        disableButton?.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        for x in 0...(characters.count - 1){
            if(String(characters[x]) == letters){
                contain = true
                break;
            }else{
                contain = false
            }
        }
        if(!contain){
            i = i+1
            if(i == 11){
                toLoose()
            }
        }
    }
    
    func updateWordInput(){
        var input = ""
        var letters = Array(word.uppercased())
        var underscore = 0
        for x in 0...(letters.count - 1){
            if(guessedLetters.contains(String(letters[x]))) {
                input += String(letters[x]) + " "
            } else {
                input += "_ "
                underscore = underscore + 1
            }
        }
        print(input)
        textGame.text = input
        if(underscore == 0){
            toWin()
        }
    }
    
    func toLoose(){
        endText.text="You suck, le texte était \"\(word!)\"."
        self.endGameButton.isHidden = false
    }
    
    func toWin(){
        endText.text = "You win"
        self.endGameButton.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateWordInput()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
