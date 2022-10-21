import Foundation

public class SetExamples {
  
  public init() { }
  
  public func createSet(of count: Int) -> Set<Int> {
    return Set<Int>(1...count)
  }
  
  public func combine(set1: Set<Int>, set2: Set<Int>) -> Set<Int> {
    return set1.union(set2)
  }
  
}
