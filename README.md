# Swift-basic-Calculator
<hr/>

<h3 align="center"> 🎥 시뮬레이터 🎥 </h3>

<p align="center"> 
  <img src="https://user-images.githubusercontent.com/91595135/158855083-e08d9199-5e93-4c3e-9fbb-c2f8e177c85a.gif">
</p>
<hr/>

<h4> 🚀operation 로직🚀 </h4>
```swift
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
```
