//
//  ViewController.swift
//  Calculator
//
//  Created by Yejin Hong on 2021/04/13.

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calculatorWorkings: UILabel!
    @IBOutlet weak var calculatorResults: UILabel!
    
    var workings: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
        // Do any additional setup after loading the view.
    }
    
    func clearAll(){
        workings = ""
        calculatorWorkings.text = ""
        calculatorResults.text = "0"
    }
    
    //AC 버튼
    @IBAction func allClearTap(_ sender: Any) {
        clearAll()
    }
    
    //글자 삭제
    @IBAction func backTap(_ sender: Any) {
        if(!workings.isEmpty){
            workings.removeLast()
            calculatorWorkings.text = workings
        }
    }
    
    func addToWorkings(value: String){
        workings = workings + value
        calculatorWorkings.text = workings
    }
    
    @IBAction func equalsTap(_ sender: Any) {
        if(validInput()){
            let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            //        let expression = NSExpression(format:workings)
            let expression = NSExpression(format:checkedWorkingsForPercent)
            let result = expression.expressionValue(with:nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            calculatorResults.text = resultString
        } else {
            let alert = UIAlertController(title: "Invalid Input", message: "Calculator unable to do math based on input", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func validInput() -> Bool {
        var count = 0
        var funcCharIndexes = [Int]()
        
        //연산함수의 위치를 파악
        for char in workings{
            if(specialCharacter(char: char)){
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        //연산함수가 맨 처음과 맨 마지막에 올 수 없도록
        for index in funcCharIndexes{
            if(index == 0){
                return false
            }
            if(index == workings.count - 1){
                return false
            }
            if (previous != -1) {
                if (index - previous == 1){
                    return false
                }
            }
            previous = index
        }
        return true
    }
    
    func specialCharacter(char: Character) -> Bool {
        if(char == "*"){
            return true
        }
        if(char == "/"){
            return true
        }
        if(char == "+"){
            return true
        }
        return false
    }
    
    func formatResult(result: Double) -> String{
        if(result.truncatingRemainder(dividingBy: 1) == 0){
            return String(format: "%.0f", result)
        } else {
            return String(format: "%.2f", result)
        }
    }
    @IBAction func precentTap(_ sender: Any) {
        addToWorkings(value: "%")
    }
    @IBAction func divideTap(_ sender: Any) {
        addToWorkings(value: "/")
    }
    @IBAction func timesTap(_ sender: Any) {
        addToWorkings(value: "*")
    }
    @IBAction func minusTap(_ sender: Any) {
        addToWorkings(value: "-")
    }
    @IBAction func plusTap(_ sender: Any) {
        addToWorkings(value: "+")
    }
    
    @IBAction func decimalTap(_ sender: Any) {
        addToWorkings(value: ".")
    }
    
    //숫자 부분
    @IBAction func zeroTap(_ sender: Any) {
        addToWorkings(value: "0")
    }
    @IBAction func oneTap(_ sender: Any) {
        addToWorkings(value: "1")
    }
    @IBAction func twoTap(_ sender: Any) {
        addToWorkings(value: "2")
    }
    @IBAction func threeTap(_ sender: Any) {
        addToWorkings(value: "3")
    }
    @IBAction func fourTap(_ sender: Any) {
        addToWorkings(value: "4")
    }
    @IBAction func fiveTap(_ sender: Any) {
        addToWorkings(value: "5")
    }
    @IBAction func sixTap(_ sender: Any) {
        addToWorkings(value: "6")
    }
    @IBAction func sevenTap(_ sender: Any) {
        addToWorkings(value: "7")
    }
    @IBAction func eightTap(_ sender: Any) {
        addToWorkings(value: "8")
    }
    @IBAction func nineTap(_ sender: Any) {
        addToWorkings(value: "9")
    }
}

