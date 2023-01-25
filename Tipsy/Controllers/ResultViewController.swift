//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Matthew Cheung on 25/1/2023.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var setttingLabel: UILabel!
    
    var total: String?
    var setting: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = total
        setttingLabel.text = setting
        
    }
    
    @IBAction func recalculatePressed() {
        dismiss(animated: true)
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
