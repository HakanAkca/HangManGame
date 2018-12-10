//
//  TableViewController.swift
//  HangmanGame
//
//  Created by SUP'Internet 13 on 10/12/2018.
//  Copyright © 2018 SUP'Internet 08. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController{

    @IBAction func backToMenu(_ sender: Any) {
        dismiss(animated: true , completion: nil)
    }
    var TableArray = ["armoire", "bureau", "tulipe", "chocolat", "sonnette", "coloriage", "mangue", "bibliotheque", "elephant", "magnetoscope", "entonnoir", "multiprise", "trampoline", "serpentin", "gymnastique", "echasse"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "- " + TableArray[indexPath.row]
        return cell
    }

}
