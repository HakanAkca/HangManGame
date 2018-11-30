//
//  FormController.swift
//  HangmanGame
//
//  Created by SUP'Internet 08 on 20/11/2018.
//  Copyright © 2018 SUP'Internet 08. All rights reserved.
//

import UIKit

class FormController: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pw: UITextField!
    
    @IBOutlet weak var btnValidate: UIButton!
    
    @IBAction func btnForm(_ sender: Any) {
        // POST
        
        let url = URL(string: "http://edu2.shareyourtime.fr/api/auth")!
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let postString = "email=\(email.text!)&password=\(pw.text!)"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print(error)
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print(response)
}
            do{
                let jsonResponse:[String:Any] = (try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any])!
                if let obj = jsonResponse["data"] as? NSDictionary{
                    let token = obj["token"] as! String!
                    let defaults = UserDefaults.standard
                    defaults.set("token", forKey: token!)
                    
                    // GET
                    let url_get = URL(string: "http://edu2.shareyourtime.fr/api/secret")!
                    var request_get = URLRequest(url: url_get)
                    request_get.setValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
                    request_get.httpMethod = "GET"
                    let task_get = URLSession.shared.dataTask(with: request_get) { data, response, error in
                        guard let data = data, error == nil else {
                            //print(error)
                            return
                        }
                        if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                            print("statusCode should be 200, but is \(httpStatus.statusCode)")
                            print(response)
                        }else{
                            print(response)
                        }
                    }
                    task_get.resume()
                    
}
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "loagedIdentif", sender: nil)
                }
                
                
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        email.borderStyle = .none
        email.layer.backgroundColor = UIColor.white.cgColor
        
        email.layer.masksToBounds = false
        email.layer.shadowColor = UIColor.gray.cgColor
        //        email.layer.shadowColor = UIColor(red: 96, green: 0, blue: 46, alpha: 1).cgColor
        email.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        email.layer.shadowOpacity = 1.0
        email.layer.shadowRadius = 0.0
        
        pw.borderStyle = .none
        pw.layer.backgroundColor = UIColor.white.cgColor
        
        pw.layer.masksToBounds = false
        pw.layer.shadowColor = UIColor.gray.cgColor
        pw.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        pw.layer.shadowOpacity = 1.0
        pw.layer.shadowRadius = 0.0

        //btnValidate.backgroundColor = .clear
        //btnValidate.layer.cornerRadius = 0
        //btnValidate.layer.borderWidth = 1
        //btnValidate.layer.borderColor = UIColor(red: 244, green: 0, blue: 118, alpha: 0.5).cgColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
}
