import XCTest
import RomanCalculator

final class RomanCalculatorTests: XCTestCase {
  let tests: [(roman: String, value: Int)] = [
    ("", 0),
    ("I", 1),
    ("II", 2),
    ("III", 3),
    ("IV", 4),
    ("V", 5),
    ("VI", 6),
    ("IX", 9),
    ("X", 10),
    ("XL", 40),
    ("L", 50),
    ("XC", 90),
    ("C", 100),
    ("CD", 400),
    ("D", 500),
    ("CM", 900),
    ("M", 1000),
    ("XXXIX", 39),
    ("CCCLXXXVII", 387),
    ("MDCCCLXXXVII", 1887)
  ]
  
  func test_CurrentStrategy() {
    let calculator = RomanCalculator.currentStrategy()
    
    for test in self.tests {
      var result: Int?
      XCTAssertNoThrow(result = try calculator.calculate(test.roman))
      XCTAssertEqual(result, test.value, test.roman)
    }
    
    XCTAssertThrowsError(try calculator.calculate("II@")) { error in
      XCTAssertEqual(error as? RomanCalculator.Error, RomanCalculator.Error.invalid(char: "@"))
    }
  }
  
  func test_NextStrategy() {
    let calculator = RomanCalculator.nextStrategy()
    
    for test in self.tests {
      var result: Int?
      XCTAssertNoThrow(result = try calculator.calculate(test.roman))
      XCTAssertEqual(result, test.value, test.roman)
    }
    
    XCTAssertThrowsError(try calculator.calculate("II@")) { error in
      XCTAssertEqual(error as? RomanCalculator.Error, RomanCalculator.Error.invalid(char: "@"))
    }
  }
}
