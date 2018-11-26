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
    
    
    @IBAction func btnForm(_ sender: Any) {
        // POST
        
        let url = URL(string: "http://edu2.shareyourtime.fr/api/auth")!
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let postString = "email=sahra.vadrot@supinternet.fr&password=SUP00000"
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
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
