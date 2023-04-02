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
    
    @IBAction func login_button(_ sender: Any) {
        guard let username = username_outlet.text else {return}
        guard let password = password_outlet.text else {return}
        
        print("\(authenticateUser(username: username, password: password))")
        
        performSegue(withIdentifier: "goToDashboard", sender: self)
    }
    
        func csv(data: String) -> [[String]] {
            var result: [[String]] = []
            let rows = data.components(separatedBy: "\n")
            for row in rows {
                let columns = row.components(separatedBy: ",")
                result.append(columns)
            }
            return result
        }

    func cleanRows(file:String)->String{
        var cleanFile = file
        cleanFile = cleanFile.replacingOccurrences(of: "\r", with: "\n")
        cleanFile = cleanFile.replacingOccurrences(of: "\n\n", with: "\n")

        return cleanFile
    }
    
    func readDataFromCSV(fileName: String)-> String! {
        let fileURL = Bundle.main.url(forResource: "dummy_auth", withExtension: "csv")
        
            do {
                var contents = try String(contentsOf: fileURL!, encoding: .utf8)
                contents = cleanRows(file: contents)
                return contents
            } catch {
                return "File Read Error for file \(fileName)"
            }
        }
    func authenticateUser(username: String, password: String) -> String {
        
        var data = readDataFromCSV(fileName: "dummy_auth.csv")
        data = cleanRows(file: data!)
        let csvRows = csv(data: data!)
        let database = csvRows[1...]
        
        for info in database {
            if info[0] == username {
                if info[1] == password {
                    return "Welcome!"
                } else {
                    return "Error"
                }
            }
        }
        return "Error"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDashboard" {
            guard let vc = segue.destination as? DashboardViewController else {return}
            self.present(vc, animated: true)
        }
    }
}

