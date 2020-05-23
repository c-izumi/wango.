//
//  AddViewController.swift
//  wango.
//
//  Created by 泉 千種 on 2020/05/23.
//  Copyright © 2020 Izumi zu-mi-. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var memoTextField: UITextField!
    
    var placeArray: [Dictionary<String, String>] = []
    
    let saveData = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if saveData.array(forKey: "PLACE") != nil{
            placeArray = saveData.array(forKey: "PLACE") as! [Dictionary<String, String>]
        }
    }
        
    @IBAction func savePlace() {
            
            let placeDictionary = ["name": nameTextField.text!, "memo": memoTextField.text!]
            
            placeArray.append(placeDictionary)
            saveData.set(placeArray, forKey: "PLACE")
            
            let alert = UIAlertController(
                title: "保存完了",
                message: "保存が完了しました",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil
            ))
            present(alert, animated: true, completion: nil)
            nameTextField.text = ""
            memoTextField.text = ""
        }
        
    
        // Do any additional setup after loading the view.
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
