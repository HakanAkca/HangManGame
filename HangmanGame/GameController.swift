//
//  GameController.swift
//  HangmanGame
//
//  Created by SUP'Internet 08 on 20/11/2018.
//  Copyright © 2018 SUP'Internet 08. All rights reserved.
//

import UIKit

class GameController: UIViewController {
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

    
    @IBOutlet weak var endText: UITextView!
    @IBOutlet weak var textGame: UITextView!
    @IBAction func btnLetters(_ sender: AnyObject) {
        let characters = Array(word.uppercased())
        let letters = dataButton[sender.tag!]
        var contain = false
        for x in 0...(characters.count - 1){
            if(String(characters[x]) == letters){
                contain = true
                break;
            }
        }
        if(!contain){
            print("tu as tord")
            toLoose()
        }
    }
    func toLoose(){
        endText.text="You suck, le texte était \"\(word!)\"."
    }
    func toWin(){
        endText.text = "You win"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textGame.text = word
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
