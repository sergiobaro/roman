import Foundation

class RomanNumeralValues {
  
  private let values: [Character: Int] = [
    "I": 1,
    "V": 5,
    "X": 10,
    "L": 50,
    "C": 100,
    "D": 500,
    "M": 1000,
  ]
  
  func value(char: Character) throws -> Int {
    guard let value = self.values[char] else {
      throw Roman.Error.invalid(char: char)
    }
    
    return value
  }
}
