import Foundation

public class Sorting {
    
    // Helper function to simplify quicksort usage
    func quickSort<T: Comparable>(_ array: inout [T]) {
        quickSort(&array, low: 0, high: array.count - 1)
    }
    
    func quickSort<T: Comparable>(_ array: inout [T], low: Int, high: Int) {
        // Base case: If the array has fewer than 2 elements, it's already sorted
        guard low < high else {
            return
        }
        
        // Partition the array and get the pivot index
        let pivotIndex = partition(&array, low: low, high: high)
        
        // Recursively call quickSort on the partitions before and after the pivot
        quickSort(&array, low: low, high: pivotIndex - 1)
        quickSort(&array, low: pivotIndex + 1, high: high)
    }

    func partition<T: Comparable>(_ array: inout [T], low: Int, high: Int) -> Int {
        // Choose the pivot element (in this implementation, we choose the last element)
        let pivot = array[high]
        
        // Initialize the partition index to the lowest index
        var partitionIndex = low
        
        // Iterate through the array
        for j in low..<high {
            // If the current element is less than or equal to the pivot, swap it with the element at partitionIndex
            if array[j] <= pivot {
                array.swapAt(partitionIndex, j)
                partitionIndex += 1
            }
        }
        
        // Swap the pivot element with the element at partitionIndex to place the pivot in its correct position
        array.swapAt(partitionIndex, high)
        
        // Return the partition index
        return partitionIndex
    }

    func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
        // Base case: If the array has only one element or is empty, it's already sorted.
        guard array.count > 1 else {
            return array
        }
        
        // Find the middle index of the array
        let middleIndex = array.count / 2
        
        // Divide the array into two halves
        let leftArray = mergeSort(Array(array[..<middleIndex]))
        let rightArray = mergeSort(Array(array[middleIndex...]))
        
        // Merge the two sorted halves
        return merge(leftArray, rightArray)
    }
    
    func merge<T: Comparable>(_ leftArray: [T], _ rightArray: [T]) -> [T] {
        var leftIndex = 0
        var rightIndex = 0
        var resultArray = [T]()
        
        // Compare elements from both arrays and merge them in ascending order
        while leftIndex < leftArray.count && rightIndex < rightArray.count {
            if leftArray[leftIndex] < rightArray[rightIndex] {
                resultArray.append(leftArray[leftIndex])
                leftIndex += 1
            } else {
                resultArray.append(rightArray[rightIndex])
                rightIndex += 1
            }
        }
        
        // Append remaining elements from leftArray
        while leftIndex < leftArray.count {
            resultArray.append(leftArray[leftIndex])
            leftIndex += 1
        }
        
        // Append remaining elements from rightArray
        while rightIndex < rightArray.count {
            resultArray.append(rightArray[rightIndex])
            rightIndex += 1
        }
        
        return resultArray
    }

    
}
