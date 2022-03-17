//
//  ViewController.swift
//  Calculator
//
//  Created by changhun kim on 2022/03/17.
//

import UIKit

enum Operation {
  case Add
  case Subtract
  case Divide
  case Multiply
  case unknown
}

class ViewController: UIViewController {
  @IBOutlet weak var numberOutputLabel: UILabel!
  
  var displayNumber = ""
  var firstOperand = ""
  var secondOperand = ""
  var reseult = ""
  var currentOperation: Operation = .unknown
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  @IBAction func tapNumberButton(_ sender: UIButton) {
    guard let numberValue = sender.title(for: .normal) else { return }
    if self.displayNumber.count < 9 {
      self.displayNumber += numberValue
      self.numberOutputLabel.text = self.displayNumber
    }
  }
  @IBAction func tapClearButton(_ sender: UIButton) {
    self.displayNumber = ""
    self.firstOperand = ""
    self.secondOperand = ""
    self.reseult = ""
    self.currentOperation = .unknown
    self.numberOutputLabel.text = "0"
  }
  
  @IBAction func tapDotButton(_ sender: UIButton) {
    if self.displayNumber.count < 8, !self.displayNumber.contains(".") {
      self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
      self.numberOutputLabel.text = self.displayNumber
    }
  }
  
  @IBAction func tapDivideButton(_ sender: UIButton) {
    self.operation(.Divide)
  }
  @IBAction func tapMultiplyButton(_ sender: UIButton) {
    self.operation(.Multiply)
  }
  @IBAction func tapSubtractButton(_ sender: UIButton) {
    self.operation(.Subtract)
  }
  @IBAction func tapAddButton(_ sender: UIButton) {
    self.operation(.Add)
  }
  @IBAction func tapResultButton(_ sender: UIButton) {
    self.operation(self.currentOperation)
  }
  
  func operation(_ opartion: Operation) {
    if self.currentOperation != .unknown {
      if !self.displayNumber.isEmpty {
        self.secondOperand = self.displayNumber
        self.displayNumber = ""
        
        guard let firstOperand = Double(self.firstOperand) else {return}
        guard let secondOperand = Double(self.secondOperand) else {return}
        
        switch self.currentOperation {
        case .Add:
          self.reseult = "\(firstOperand + secondOperand)"
        case .Subtract:
          self.reseult = "\(firstOperand - secondOperand)"
        case .Divide:
          self.reseult = "\(firstOperand / secondOperand)"
        case .Multiply:
          self.reseult = "\(firstOperand * secondOperand)"
        
        default:
          break
        }
        
        if let result = Double(self.reseult), result.truncatingRemainder(dividingBy: 1) == 0 {
          self.reseult = "\(Int(result))"
        }
        
        self.firstOperand = self.reseult
        self.numberOutputLabel.text = self.reseult
      }
      self.currentOperation = opartion
    } else {
      self.firstOperand = self.displayNumber
      self.currentOperation = opartion
      self.displayNumber = ""
    }
  }
  
}

