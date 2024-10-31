import Foundation

public enum Cars {
    case volvo
    case hyundai
    case nissan
}

public enum Fruits: String, CaseIterable {
    
    // string is the rawValue, CaseIterable allows you to loop over the list using allCases
    case apple = "Apple"
    case orange = "Orange"
    case peach = "Peach"
    case watermelon = "Watermelon"
}

public enum NumberCodes: Int, CaseIterable {
    case one = 1
    case two = 2
    case three = 3
}
