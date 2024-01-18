import Foundation

public class StandardCollectionTypes {
    
    public init() { }
    
    public func makeASet() -> Set<Int> {
        var set = Set<Int>()

        set.insert(1)
        for i in [2,3] {
            set.insert(i)
        }
        
        print(set.contains(1))
        print(set.contains(20))
        
        print(set)
        return set
    }
    
    public func setOperations(){
        let setA = Set<Int>([1,2,3,4,5,6,7])
        let setB = Set<Int>([4,5,6,7,8,9,10])
        
        print("set A: \(setA)")
        print("set B: \(setB)")
        
        print("Intersection of A and B: \(setA.intersection(setB))")
        print("Symetric Difference of A and B: \(setA.symmetricDifference(setB))")
        print("Union of A and B: \(setA.union(setB))")
        print("Subtracting of B from A: \(setA.subtracting(setB))")
        
    }
    
    
    public func makeAnArray() -> [Int] {
        var array: [Int] = []
        let arr1 = [1,2,3]
        let arr2 = [3,4,5]
        array = arr1 + arr2
        array.append(6)
        
        print(array)
        return array
    }
    
    public func makeADictionary() -> [Int: String] {
        var dictionary: [Int: String] = [:]
        
        dictionary[1] = "one"
        dictionary[2] = "two"
        dictionary[3] = "three"
        
        
        
        return dictionary
    }
}

