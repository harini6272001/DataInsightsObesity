//
//  ViewController.swift
//  DataInsightsObesity
//
//  Created by Taqiya Ehsan on 3/26/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var nniLogo: UIImageView!
    @IBOutlet weak var password_outlet: UITextField!
    @IBOutlet weak var login_button: UIButton!
    @IBOutlet weak var username_outlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: Any) {
        print("Logged in!")
        
    }
}

