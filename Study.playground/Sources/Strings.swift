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

public func addEmbeddedNumbers(in string: String) -> Int {
    var currentNum = 0
    var total = 0
    for c in string {
        if let num = c.wholeNumberValue {
            if currentNum > 0 {
                currentNum *= 10
                currentNum += num
            } else {
                currentNum = num
            }
        } else {
            total += currentNum
            currentNum = 0
        }
    }
    // add in whatever is left
    total += currentNum
    return total
}


public class Strings {
    public init() { }
    public func lengthOfLongestSubstring(_ s: String) -> Int {
        var result = 0
        var counter = s.count - 1
        while counter >= 0 {
            var startIndex = 0
            var endIndex = counter
            while endIndex <= s.count - 1 {
                let start = s.index(s.startIndex, offsetBy: startIndex)
                let end = s.index(s.startIndex, offsetBy: endIndex)
                let segment = s[start...end]
                let sub = String(segment)
                if !hasDuplicate(sub){
                    if sub.count > result {
                        result = sub.count
                    }
                }
                startIndex += 1
                endIndex += 1
            }
            counter -= 1
        }
        return result
    }
    
    public func findAllSubstringWithoutDups(from string: String) -> [String] {
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
    
    public func hasDuplicate(_ s: String) -> Bool {
        var dict: [String.Element: Int] = [:]
        for c in s {
            if let val = dict[c] {
                if val > 0 {
                    return true
                }
            } else {
                dict[c] = 1
            }
        }
        return false
    }
}
