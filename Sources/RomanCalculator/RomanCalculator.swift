
internal protocol RomanCalculatorStrategy {
  func calculate(_ roman: String) throws -> Int
}

public class RomanCalculator {
  
  private let strategy: RomanCalculatorStrategy
  
  public enum Error: Swift.Error, Equatable {
    case invalid(char: Character)
  }
  
  public static func nextStrategy() -> RomanCalculator {
    return RomanCalculator(calculator: RomanCalculatorNextStrategy(values: RomanNumeralValues()))
  }
  
  public static func currentStrategy() -> RomanCalculator {
    return RomanCalculator(calculator: RomanCalculatorCurrentStrategy(values: RomanNumeralValues()))
  }
  
  internal init(calculator: RomanCalculatorStrategy) {
    self.strategy = calculator
  }
  
  public func calculate(_ roman: String) throws -> Int {
    return try self.strategy.calculate(roman)
  }
}
