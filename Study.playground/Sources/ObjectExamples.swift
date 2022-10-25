import Foundation

let array = [1,2,3,4,5]

enum Color: String {
    case red
    case blue
    case green
    case yellow
    case purple
    case orange
    case brown
    case white
}

enum ShapeName: String {
    case triangle
    case square
    case pentagon
    case hexagon
    case septagon
    case octagon
    case circle
    case unknown
}

class Shape {
    var sides: Int {
        get{
            return getSides()
        }
        set(number) {
            setNameAndColor(number: number)
        }
    }
    // if you dont have defaults they need to be set in the init
    var name: ShapeName = .unknown
    var color: Color = .white

    init(sides: Int) {
        self.sides = sides
    }
    
    init() { }
    
    private func setNameAndColor(number: Int) {
        switch number {
        case 3:
            name = .triangle
            color = .red
        case 4:
            name = .square
            color = .blue
        case 5:
            name = .pentagon
            color = .green
        case 6:
            name = .hexagon
            color = .yellow
        case 7:
            name = .septagon
            color = .purple
        case 8:
            name = .octagon
            color = .orange
        case 0:
            name = .circle
            color = .blue
        default:
            name = .unknown
            color = .white
        }
    }
    
    private func getSides() -> Int {
        switch color {
        case .red:
            return 3
        case .blue:
            return 4
        case .green:
            return 5
        case .yellow:
            return 6
        case .purple:
            return 7
        case .orange:
            return 8
        case .brown:
            return 0
        case .white:
            return -1
        }
    }
}

func getShape(from number: Int) -> Shape {
    return Shape(sides: number)
}


func testShape() {
    var things:[Shape] = []

    // For loops
    for side in (3...8) {
        things.append(getShape(from: side))
    }


    for (index, thing) in things.enumerated() {
        print("at \(index) there is a \(thing.name)")
    }

    var i = 0
    while(i < things.count) {
        print(things[i].color)
        i += 1
    }
}

