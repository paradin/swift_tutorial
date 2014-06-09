// Playground - noun: a place where people can play

import Cocoa

// 变量与常量
// var声明变量，let声明常量
var myVariable = 42
myVariable = 50
let myConstant = 42

// 类型推导（Type Inference）
// 所以变量不需要指定类型，如果需要指定类型：
let explicitDouble : Double = 70

// 不支持隐式类型转换（Implicitly casting），需要显式类型转换（Explicitly casting）：
let label = "The width is "
let width = 94
let labelWidth = label + String(width)
// let labelWidth = label + width // Error: Could not find an overload for '+' that accepts the supplied arguments

// 字符串格式化
// 使用\(item)的形式进行字符串格式化：
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

// 数组和字典
// 使用[]操作符声明数组（array）和字典（dictionary）：
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
occupations["Jayne"] = "Public Relations"

// 一般使用初始化器（initializer）语法创建空数组和空字典：
let emptyArray = String[]()
let emptyDictionary = Dictionary<String, Float>()
// or
var intEmptyArray:Array<Int> = []
var intintEmptyDictionary:Dictionary<Int, Int> = [:]
intEmptyArray += 1
intintEmptyDictionary[1] = 1

// 控制流
// 条件语句包含if和switch，循环语句包含for-in、for、while和do-while，循环/判断条件不需要括号，但循环/判断体（body）必需括号：
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}

// 可空类型
// 结合if和let，可以方便的处理可空变量（nullable variable）。对于空值，需要在类型声明后添加?显式标明该类型可空。
var optionalString: String? = "Hello"
optionalString == nil

var optionalName: String? = "John Appleseed"
var gretting = "Hello!"
if let name = optionalName {
    gretting = "Hello, \(name)"
}

// 灵活的switch
// switch支持各种各样的比较操作：
let vegetable = "red pepper"
switch vegetable {
case "celery":
    let vegetableComment = "Add some raisins and make ants on a log."
case "cucumber", "watercress":
    let vegetableComment = "That would make a good tea sandwich."
case let x where x.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(x)?"
default:
    let vegetableComment = "Everything tastes good in soup."
}

// 其它循环
// for-in除了遍历数组也可以用来遍历字典：
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
largest

// while循环和do-while循环：
var n = 2
while n < 100 {
    n = n * 2
}
n

var m = 2
do {
    m = m * 2
} while m < 100
m

// Swift支持传统的for循环，此外也可以通过结合..（生成一个区间）和for-in实现同样的逻辑。
var firstForLoop = 0
for i in 0..3 {
    firstForLoop += i
}
firstForLoop

var secondForLoop = 0
for var i = 0; i < 3; ++i {
    secondForLoop += 1
}
secondForLoop

// 注意：Swift除了..还有...：..生成前闭后开的区间，而...生成前闭后闭的区间。

// 函数和闭包
// 使用func关键字声明函数：
func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}
greet("Bob", "Tuesday")

// 通过元组（Tuple）返回多个值：
func getGasPrices() -> (Double, Double, Double) {
    return (3.59, 3.69, 3.79)
}
getGasPrices()

// 支持带有变长参数的函数：
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(42, 597, 12)

// 函数也可以嵌套函数：
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

// 作为头等对象，函数既可以作为返回值，也可以作为参数传递：
func makeIncrementer() -> (Int -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

func hasAnyMatches(list: Int[], condition: Int -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(numbers, lessThanTen)

// 闭包
// 本质来说，函数是特殊的闭包，Swift中可以利用{}声明匿名闭包：
numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
    })

// 当闭包的类型已知时，可以使用下面的简化写法：
numbers.map({ number in 3 * number })

// 此外还可以通过参数的位置来使用参数，当函数最后一个参数是闭包时，可以使用下面的语法：
sort([1, 5, 3, 12, 2]) { $0 > $1 }

// 类和对象
// 使用class创建一个类，类可以包含字段和方法：
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

// 创建Shape类的实例，并调用其字段和方法。
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

// 通过init构建对象，既可以使用self显式引用成员字段（name），也可以隐式引用（numberOfSides）。
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

// 使用deinit进行清理工作。

// 继承和多态
// 支持继承和多态（override父类方法）：

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

// 注意：如果这里的simpleDescription方法没有被标识为override，则会引发编译错误。

// 属性
// 引入了属性（property），见下面的perimeter字段：

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
    get {
        return 3.0 * sideLength
    }
    set {
        sideLength = newValue / 3.0
    }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triagle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
triangle.perimeter
triangle.perimeter = 9.9
triangle.sideLength

// 注意：赋值器（setter）中，接收的值被自动命名为newValue。

// willSet和didSet
// EquilateralTriangle的构造器进行了如下操作：
//   为子类型的属性赋值。
//   调用父类型的构造器。
//   修改父类型的属性。
//   如果不需要计算属性的值，但需要在赋值前后进行一些操作的话，使用willSet和didSet：

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
    willSet {
        square.sideLength = newValue.sideLength
    }
    }
    var square: Square {
    willSet {
        triangle.sideLength = newValue.sideLength
    }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
triangleAndSquare.square.sideLength
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
triangleAndSquare.triangle.sideLength

// 从而保证triangle和square拥有相等的sideLength。

// 调用方法

// Swift中，函数的参数名称只能在函数内部使用，但方法的参数名称除了在内部使用外还可以在外部使用（第一个参数除外），例如：
class Counter {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes times: Int) {
        count += amount * times
    }
}
var counter = Counter()
counter.incrementBy(2, numberOfTimes: 7)

// 注意Swift支持为方法参数取别名：在上面的代码里，numberOfTimes面向外部，times面向内部。

//    ?的另一种用途

// 使用可空值时，?可以出现在方法、属性或下标前面。如果?前的值为nil，那么?后面的表达式会被忽略，而原表达式直接返回nil，例如：

let optionalSquare: Square? = Square(sideLength: 2.5, name: "optionalsquare")
let sideLength = optionalSquare?.sideLength

// 当optionalSquare为nil时，sideLength属性调用会被忽略。

// 枚举和结构

// 枚举

// 使用enum创建枚举——注意Swift的枚举可以关联方法：

enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.toRaw())
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.toRaw()

// 使用toRaw和fromRaw在原始（raw）数值和枚举值之间进行转换：
if let convertedRank = Rank.fromRaw(3) {
    let threeDescription = convertedRank.simpleDescription()
}
// 注意枚举中的成员值（member value）是实际的值（actual value），和原始值（raw value）没有必然关联。

//一些情况下枚举不存在有意义的原始值，这时可以直接忽略原始值：
enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()

// 除了可以关联方法，枚举还支持在其成员上关联值，同一枚举的不同成员可以有不同的关联的值：
enum ServerResponse {
    case Result(String, String)
    case Error(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("Out of cheese.")

switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
case let .Error(error):
    let serverResponse = "Failure... \(error)"
}

// 结构
// 使用struct关键字创建结构。结构支持构造器和方法这些类的特性。结构和类的最大区别在于：结构的实例按值传递（passed by value），而类的实例按引用传递（passed by reference）。
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

// 协议（protocol）和扩展（extension）

// 协议

// Swift使用protocol定义协议：
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

// 类型、枚举和结构都可以实现（adopt）协议：
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

// 扩展

// 扩展用于在已有的类型上增加新的功能（比如新的方法或属性），Swift使用extension声明扩展：
extension Int: ExampleProtocol {
    var simpleDescription: String {
    return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
7.simpleDescription

// 泛型（generics）
// 使用<>来声明泛型函数或泛型类型：
func repeat<ItemType>(item: ItemType, times: Int) -> ItemType[] {
    var result = ItemType[]()
    for i in 0..times {
        result += item
    }
    return result
}
repeat("knock", 4)

// Swift也支持在类、枚举和结构中使用泛型：

// Reimplement the Swift standard library's optional type
enum OptionalValue<T> {
    case None
    case Some(T)
}
var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)

// 有时需要对泛型做一些需求（requirements），比如需求某个泛型类型实现某个接口或继承自某个特定类型、两个泛型类型属于同一个类型等等，Swift通过where描述这些需求：
func anyCommonElements <T, U where T: Sequence, U: Sequence, T.GeneratorType.Element: Equatable, T.GeneratorType.Element == U.GeneratorType.Element> (lhs: T, rhs: U) -> Bool {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3], [3])
