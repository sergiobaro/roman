import XCTest
import RomanCalculator

final class RomanCalculatorTests: XCTestCase {
  let calculator = RomanCalculator.defaultStrategy()
  
  func test_Calculate() {
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
    ]
    
    for test in tests {
      var result: Int?
      XCTAssertNoThrow(result = try calculator.calculate(test.roman))
      XCTAssertEqual(result, test.value, test.roman)
    }
  }
  
  func test_InvalidCharacter_ShouldThrowError() {
    XCTAssertThrowsError(try calculator.calculate("@")) { error in
      XCTAssertEqual(error as? RomanCalculator.Error, RomanCalculator.Error.invalid(char: "@"))
    }
    
    XCTAssertThrowsError(try calculator.calculate("II@")) { error in
      XCTAssertEqual(error as? RomanCalculator.Error, RomanCalculator.Error.invalid(char: "@"))
    }
  }
}
