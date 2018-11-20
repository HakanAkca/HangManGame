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
        let word = ""
        self.performSegue(withIdentifier: "GameModal", sender: word)
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
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

