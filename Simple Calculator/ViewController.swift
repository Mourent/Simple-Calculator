//
//  ViewController.swift
//  Simple Calculator
//
//  Created by MacBook Pro on 29/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var calWork: UILabel!
    @IBOutlet var calResult: UILabel!
    
    
    var working:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calWork.text = ""
        calResult.text = ""
    }
    
    func clearAll() {
        working = ""
        calWork.text = ""
        calResult.text = ""
    }
    
    var tesError: Bool?
    func operatorError(){
        let pisahHuruf = Array(working)
        let panjangWorking: Int = working.count - 1
        
        if(pisahHuruf[panjangWorking] == "+" || pisahHuruf[panjangWorking] == "-" || pisahHuruf[panjangWorking] == "*" || pisahHuruf[panjangWorking] == "/"){
                let alert = UIAlertController(
                title: "Invalid Input", message: "Calculator unable to do math based on input", preferredStyle: .alert
                )
                alert.addAction(UIAlertAction(title: "Okay", style: .default))
                self.present(alert, animated: true, completion: nil)
            
            tesError = true
        }
        else {
            tesError = false
        }
    }
    
    @IBOutlet weak var btnAllClear: UIButton!
    func jadiClear(){
        if(!working.isEmpty){
            let fontSize: CGFloat = 48.0
            
            let attributes: [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: fontSize)
            ]
            
            let attributedTitle = NSAttributedString(string: "C", attributes: attributes)
            btnAllClear.setAttributedTitle(attributedTitle, for: .normal)
        }
        else{
            let fontSize: CGFloat = 48.0
            
            let attributes: [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: fontSize)
            ]
            
            let attributedTitle = NSAttributedString(string: "AC", attributes: attributes)
            btnAllClear.setAttributedTitle(attributedTitle, for: .normal)
        }
    }
    
    func addToWork(value: String){
        working = working + value
        calWork.text = working
    }
    
    @IBAction func btnAllClear(_ sender: Any) {
        if let buttonTitle = btnAllClear.titleLabel?.text, buttonTitle == "C"{
            var pisahHuruf = Array(working)
            let panjangWorking: Int = working.count - 1
            var index: Int?
            
            if(working.contains("+")){
                index = pisahHuruf.firstIndex(of: "+")
            }
            else if(working.contains("-")){
                index = pisahHuruf.firstIndex(of: "-")
            }
            else if(working.contains("*")){
                index = pisahHuruf.firstIndex(of: "*")
            }
            else if(working.contains("/")){
                index = pisahHuruf.firstIndex(of: "/")
            }
            else {
                index = 0
            }
            
            if let unwrappedIndex = index{
                pisahHuruf.removeSubrange(unwrappedIndex...panjangWorking)
            }
            working = ""
            for n in pisahHuruf{
                working += String(n)
            }
            calWork.text = working
            
            
            let fontSize: CGFloat = 48.0
            
            let attributes: [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: fontSize)
            ]
            
            let attributedTitle = NSAttributedString(string: "AC", attributes: attributes)
            btnAllClear.setAttributedTitle(attributedTitle, for: .normal)
        }
        else if let buttonTitle = btnAllClear.titleLabel?.text, buttonTitle == "AC"{
            clearAll()
            jadiClear()
        }
    }
    @IBAction func btnPlusMinus(_ sender: Any) {
        let pisahHuruf = Array(working)
        if(!working.isEmpty){
            if(pisahHuruf[0] == "-"){
                working.removeFirst()
                calWork.text = working
            }
            else if(pisahHuruf[0] != "-"){
                working = "-" + working
                calWork.text = working
            }
        }
    }
    
    @IBAction func btnPercent(_ sender: Any) {
        if(!working.isEmpty){
            let ambilAngka = Int(working)
            let jadiPersen = Double(ambilAngka ?? 0) * 0.01
            
            calResult.text = String(jadiPersen)
            calWork.text = ""
            working = String(jadiPersen)
        }
        jadiClear()
    }
    @IBAction func btnBagi(_ sender: Any) {
        operatorError()
        if(tesError == false) {
            addToWork(value: "/")
        }
        jadiClear()
    }
    
    @IBAction func btnSatu(_ sender: Any) {
        addToWork(value: "1")
        jadiClear()
    }
    @IBAction func btnDua(_ sender: Any) {
        addToWork(value: "2")
        jadiClear()
    }
    @IBAction func btnTiga(_ sender: Any) {
        addToWork(value: "3")
        jadiClear()
    }
    @IBAction func btnEmpat(_ sender: Any) {
        addToWork(value: "4")
        jadiClear()
    }
    @IBAction func btnLima(_ sender: Any) {
        addToWork(value: "5")
        jadiClear()
    }
    @IBAction func btnEnam(_ sender: Any) {
        addToWork(value: "6")
        jadiClear()
    }
    @IBAction func btnTujuh(_ sender: Any) {
        addToWork(value: "7")
        jadiClear()
    }
    @IBAction func btnDelapan(_ sender: Any) {
        addToWork(value: "8")
        jadiClear()
    }
    @IBAction func btnSembilan(_ sender: Any) {
        addToWork(value: "9")
        jadiClear()
    }
    @IBAction func btnKoma(_ sender: Any) {
        addToWork(value: ".")
        jadiClear()
    }
    @IBAction func btnNol(_ sender: Any) {
        addToWork(value: "0")
        jadiClear()
    }
    @IBAction func btnKali(_ sender: Any) {
        operatorError()
        if(tesError == false) {
            addToWork(value: "*")
        }
        jadiClear()
    }
    @IBAction func btnMin(_ sender: Any) {
        operatorError()
        if(tesError == false) {
            addToWork(value: "-")
        }
        jadiClear()
    }
    @IBAction func btnPlus(_ sender: Any) {
        operatorError()
        if(tesError == false) {
            addToWork(value: "+")
        }
        jadiClear()
    }
    
    func formatResult(result: Double) -> String {
        if(result.truncatingRemainder(dividingBy: 1) == 0){
            return String(format: "%.0f", result)
        }
        else {
            return String(format: "%.2f", result)
        }
    }
    
    
    @IBAction func btnSamaDengan(_ sender: Any) {
        if(working.isEmpty){
            
        }
        else {
            let expression = NSExpression(format: working)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            calResult.text = resultString
            
            calWork.text = ""
            working = resultString
        }
        jadiClear()
    }
    
}
