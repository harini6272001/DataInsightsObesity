//
//  SegueViewController.swift
//  DataInsightsObesity
//
//  Created by Taqiya Ehsan on 3/30/23.
//

import UIKit

class SegueViewController: UIViewController {

    @IBOutlet var myLabel: UILabel!
    
    var message: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myLabel.text = message
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
