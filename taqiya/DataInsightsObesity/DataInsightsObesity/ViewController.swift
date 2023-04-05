//
//  ViewController.swift
//  DataInsightsObesity
//
//  Created by Taqiya Ehsan on 3/26/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nni_logo: UIImageView!
    @IBOutlet weak var username_in: UITextField!
    @IBOutlet weak var password_in: UITextField!
    @IBOutlet weak var login: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func login(_ sender: Any) {
        guard let password = password_in.text else {return}
        guard let username = username_in.text else {return}
        
        authenticateUser(username: username, password: password)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDashboard" {
            guard let vc = segue.destination as? DashboardViewController else {return}
            self.present(vc, animated: true)
        }
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
    
    func authenticateUser(username: String, password: String) -> Void {

        var data = readDataFromCSV(fileName: "dummy_auth.csv")
        data = cleanRows(file: data!)
        let csvRows = csv(data: data!)
        let database = csvRows[1...]

        for info in database {
            if info[0] == username {
                if info[1] == password {
                    performSegue(withIdentifier: "goToDashboard", sender: self)
                    
                } else {
                    print("Error")
                    return
                }
            }
        }
        print("Error")
        return
    }
    
}

