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
    var lastValue = 0
    
    for char in roman {
      let value = try self.values.value(char: char)
      
      if lastValue > 0 && lastValue < value {
        total -= (lastValue * 2)
      }
      total += value
      
      lastValue = value
    }
    
    return total
  }
  
}

import Foundation
