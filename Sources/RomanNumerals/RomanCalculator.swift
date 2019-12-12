
internal protocol RomanNumeralsStrategy {
  func calculate(_ roman: String) throws -> Int
}

public class RomanCalculator {
  
  private let strategy: RomanNumeralsStrategy
  
  public enum Error: Swift.Error, Equatable {
    case invalid(char: Character)
  }
  
  public static func nextStrategy() -> RomanCalculator {
    return RomanCalculator(calculator: RomanCalculatorNextStrategy(values: RomanNumeralValues()))
  }
  
  public static func defaultStrategy() -> RomanCalculator {
    return RomanCalculator(calculator: RomanCalculatorCurrentStrategy(values: RomanNumeralValues()))
  }
  
  internal init(calculator: RomanNumeralsStrategy) {
    self.strategy = calculator
  }
  
  public func calculate(_ roman: String) throws -> Int {
    return try self.strategy.calculate(roman)
  }
}
