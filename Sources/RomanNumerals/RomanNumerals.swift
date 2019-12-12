
internal protocol RomanNumeralsStrategy {
  func calculate(_ roman: String) throws -> Int
}

public class Roman {
  
  private let strategy: RomanNumeralsStrategy
  
  public enum Error: Swift.Error, Equatable {
    case invalid(char: Character)
  }
  
  public static func nextStrategy() -> Roman {
    return Roman(calculator: RomanNumeralNextStrategy(values: RomanNumeralValues()))
  }
  
  public static func defaultStrategy() -> Roman {
    return Roman(calculator: RomanNumeralCurrentStrategy(values: RomanNumeralValues()))
  }
  
  internal init(calculator: RomanNumeralsStrategy) {
    self.strategy = calculator
  }
  
  public func calculate(_ roman: String) throws -> Int {
    return try self.strategy.calculate(roman)
  }
}
