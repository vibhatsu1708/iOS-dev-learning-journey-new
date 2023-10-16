//MARK: - subscript syntax

//subscript(index: Int) -> Int {
//    get {
//        
//    }
//    set(newValue) {
//        
//    }
//}

//MARK: - example of a read only subscript implementation

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
threeTimesTable[4]
let fiveTimesTable = TimesTable(multiplier: 5)
fiveTimesTable[21]

//MARK: - another example of a read only subscript implementation

struct Calculator {
    let num1: Int, num2: Int
    subscript(operation: Character) -> String {
        var answer = ""
        switch operation {
        case "+":
            answer = String(num1 + num2)
        case "-":
            answer = String(num1 - num2)
        case "*":
            answer = String(num1 * num2)
        case "/":
            answer = String(num1 / num2)
        case "%":
            answer = String(num1 % num2)
        default:
            answer = "invalid"
        }
        return answer
    }
}
let calculator = Calculator(num1: 5, num2: 3)
calculator["+"]
calculator["-"]
calculator["*"]
calculator["/"]
calculator["%"]

//MARK: - Subscript options

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    
    init(rows: Int, columns: Int, grid: [Double]) {
        self.rows = rows
        self.columns = columns
        self.grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index is out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index is out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}
