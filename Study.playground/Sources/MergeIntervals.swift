import Foundation

public func merge(intervals: [(Int, Int)]) -> (Int, Int) {
    guard var result: (Int, Int) = intervals.first else {
        return (0, 0)
    }
    for i in intervals {
        if result == i {
            continue
        } else {
            if result.1 >= i.0 {
                if i.1 > i.0 {
                    result.1 = i.1
                }
            }
            if result.0 >= i.1 {
                if i.0 < i.1 {
                    result.0 = i.0
                }
            }
        }
    }
    return result
}

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    let numsWithIndex = nums.enumerated()
    for (index_i, i) in numsWithIndex {
        for (index_j, j) in numsWithIndex {
            if index_i != index_j {
                if i + j == target {
                    return [index_i, index_j]
                }
            }
        }
    }
    return []
}

