public class Roman {
  
  public enum Error: Swift.Error, Equatable {
    case invalid(char: Character)
  }
  
  public init() {}
  
  public func calculate(_ roman: String) throws -> Int {
    guard !roman.isEmpty else {
      return 0
    }
    
    var total = 0
    
    for (index, char) in roman.enumerated() {
      let value = try self.value(char: char)
      
      if index + 1 < roman.count {
        let nextIndex = roman.index(roman.startIndex, offsetBy: index + 1)
        let nextChar = roman[nextIndex]
        let nextValue = try self.value(char: nextChar)
        
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
  
  // MARK: - Private
  
  private let values: [Character: Int] = [
    "I": 1,
    "V": 5,
    "X": 10,
    "L": 50,
    "C": 100,
    "D": 500,
    "M": 1000,
  ]
  
  private func value(char: Character) throws -> Int {
    guard let value = self.values[char] else {
      throw Error.invalid(char: char)
    }
    
    return value
  }
}
