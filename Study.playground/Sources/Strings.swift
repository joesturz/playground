import Foundation

public func findAllSubstring(from string: String) -> [String] {
    var result: [String] = []
    var counter = string.count - 1
    while counter >= 0 {
        var startIndex = 0
        var endIndex = counter
        while endIndex <= string.count - 1 {
            let start = string.index(string.startIndex, offsetBy: startIndex)
            let end = string.index(string.startIndex, offsetBy: endIndex)
            let segment = string[start...end]
            result.append(String(segment))
            startIndex += 1
            endIndex += 1
        }
        counter -= 1
    }
    return result
}

public func checkForPalendrome(for string: String) -> Bool {
    let characters = Array(string)
    var i = 0
    let end = characters.count - 1
    while i <= end/2 {
        if characters[i] == characters[end - i] {
            i += 1
            continue
        } else {
            return false
        }
    }
    return true
}

public func getAllPalendromes(for string: String) -> [String] {
    let strings = findAllSubstring(from: string)
    var result = [String]()
    for s in strings {
        if checkForPalendrome(for: s) {
            result.append(s)
        }
    }
    return result
}

public func reverseWordOrder(of string: String) -> String {
    let words = string.components(separatedBy: " ")
    var i = words.count - 1
    var result = ""
    while i > -1 {
        if i == words.count - 1 {
            result = "\(words[i])"
        } else {
            result = "\(result) \(words[i])"
        }
        i -= 1
    }
    return result
}
