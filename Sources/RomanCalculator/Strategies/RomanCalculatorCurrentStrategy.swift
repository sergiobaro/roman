import Foundation

internal class RomanCalculatorCurrentStrategy: RomanCalculatorStrategy {
  
  private let values: RomanNumeralValues
  
  internal init(values: RomanNumeralValues) {
    self.values = values
  }
  
  func calculate(_ roman: String) throws -> Int {
    guard !roman.isEmpty else {
      return 0
    }
    
    var total = 0
    
    for (index, char) in roman.enumerated() {
      let value = try self.values.value(char: char)
      
      if index + 1 < roman.count {
        let nextIndex = roman.index(roman.startIndex, offsetBy: index + 1)
        let nextChar = roman[nextIndex]
        let nextValue = try self.values.value(char: nextChar)
        
        if nextValue > value {
          total -= value
        } else {
          total += value
        }
      } else {
        total += value
      }
    }
    
    return total
  }
  
}

import Foundation
