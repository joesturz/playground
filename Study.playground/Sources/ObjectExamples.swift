import Foundation

let array = [1,2,3,4,5]

enum Color: String {
    case red
    case blue
    case green
    case yellow
    case purple
    case orange
    case white
}

class Shape {
    var name: String
    var color: Color
    var sides: Int
    init(name: String, color: Color, sides: Int) {
        self.name = name
        self.color = color
        self.sides = sides
    }
}

func getColor(from number: Int) -> Shape {
    switch number {
    case 3:
        return Shape(name: "triangle", color: .red, sides: number)
    case 4:
        return Shape(name: "square", color: .blue, sides: number)
    case 5:
        return Shape(name: "pentagon", color: .green, sides: number)
    case 6:
        return Shape(name: "hexagon", color: .yellow, sides: number)
    case 7:
        return Shape(name: "septagon", color: .purple, sides: number)
    case 8:
        return Shape(name: "octagon", color: .orange, sides: number)
    default:
        return Shape(name: "unknown", color: .white, sides: number)
    }
}


func testShape() {
    var things:[Shape] = []

    // For loops
    for side in (3...8) {
        things.append(getColor(from: side))
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

