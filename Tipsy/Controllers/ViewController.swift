//
//  ViewController.swift
//  Tipsy
//
//  Created by Matthew Cheung on 25/1/2023.0
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
class ViewController: UIViewController {
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        calculatorBrain.getTips(sender.currentTitle ?? "0%")
        tipsSelected()
        sender.isSelected = true
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {

        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    @IBAction func calculatePressed(_ sender: UIButton){
        calculatorBrain.calculateTips(Float(billTextField.text ?? "") ?? 123.56, Int(splitNumberLabel.text ?? "") ?? 2)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let desintationVC = segue.destination as! ResultViewController
            desintationVC.total = calculatorBrain.getTotal()
            desintationVC.setting = calculatorBrain.getSetting()
        }
    }
    func tipsSelected(){
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
}

