import Foundation

class Calculator {
    func divide(x: Double, y: Double) throws -> Double {
        if y == 0 {
            throw CalculatorError.divisionByZero
        }
        return (x / y)
    }
}

enum CalculatorError: Error {
    case divisionByZero
}

let calculator = Calculator()
do {
    let successfulResult = try calculator.divide(x: 5, y: 4)
    print(successfulResult)
    let invalidResult = try calculator.divide(x: 5, y: 0)
} catch CalculatorError.divisionByZero {
    print("Division by zero detected and not allowed.")
}

