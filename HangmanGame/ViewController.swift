//
//  ViewController.swift
//  HangmanGame
//
//  Created by SUP'Internet 08 on 20/11/2018.
//  Copyright © 2018 SUP'Internet 08. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textDataWord: UITextField!
    
    @IBAction func btnDataWord(_ sender: Any) {
        let word = textDataWord.text
        if !(word?.isEmpty)!{
         self.performSegue(withIdentifier: "GameModal", sender: word)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if(segue.identifier == "GameModal"){
            let word = textDataWord.text
            let controller = segue.destination as! GameController
            controller.word = word
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textDataWord.borderStyle = .none
        textDataWord.layer.backgroundColor = UIColor.white.cgColor
        
        textDataWord.layer.masksToBounds = false
        textDataWord.layer.shadowColor = UIColor.gray.cgColor
        textDataWord.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        textDataWord.layer.shadowOpacity = 1.0
        textDataWord.layer.shadowRadius = 0.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

