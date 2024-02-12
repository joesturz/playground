import Foundation



public class Concurrency {
    
    // 3 types of DispatchQueues

    // 1. main queue - UI Updates happen in this queue
    func getMainQueue() {
        DispatchQueue.main.async {
            // This is where you update the UI
        }
    }
    
    // 2. The Global Queue
//    This Queue is separated into 4 main types and a default type according to QOS(Quality of Service), from highest priority to lowest:
//    1- userInteractive : Work is virtually instantaneous. Similar to main thread.
//    2- userInitiated : Work is nearly instantaneous, such as a few seconds or less.
//    3- default: don’t use it usually , the type will be inferred by the system
//    4- utility: Work takes a few seconds to a few minutes.
//    5- background: Work takes significant time, such as minutes or hours.
    
    func getGlobalQueue(of type: DispatchQoS.QoSClass = .default) {
        DispatchQueue.global(qos: type).async {
            // do your heavy opperations here
        }
    }
    
    // 3. Custom Queues
    // A good choice when you want to perform background work serially and track it. This eliminates resource contention and race conditions since you know only one task at a time is executing. Note that if you need the data from a method, you must declare another closure to retrieve it or consider using sync.
    
    public static func getCustomQueue(of qos: DispatchQoS = .default, with name: String = "default") -> DispatchQueue {
        let customQueue = DispatchQueue(label: name, qos: qos, attributes: .concurrent, autoreleaseFrequency: .workItem, target: nil)
        return customQueue
    }
    
    public static func combineRows(of matrix: [[Int]], iteration: Int,  completion: @escaping (Int) -> ()?) {
        let queue1 = getCustomQueue()
        let queue2 = getCustomQueue(of: .background)
        
        // this is used to manager a group of queues
        let group = DispatchGroup()
        var results1:[Int] = []
        var results2:[Int] = []
        
        // you must enter the group, then do the work
        group.enter()
        for r in matrix {
            var result1 = 0
            var result2 = 0
            queue1.async {
                for i in r {
                    result1 = result1 + i
                }
            }
            queue1.async(flags: .barrier) {
                results1.append(result1)
            }
            queue2.async {
                for i in r {
                    result2 = result2 + i
                }
            }
            queue2.async(flags: .barrier) {
                results2.append(result2)
            }
        }
        // you must leave the group when finished(not doing so can result in a crash)
        group.leave()
        
        // you can call group.wait() which blocks here for all the the work to complete
        // but we are going to call group.notify
        
        // call group.notify to alert another thread(main in this case) that all the work is done.
        // this is where the updates to the UI could occurr
        group.notify(queue: DispatchQueue.main) {
            completion(iteration)
            print("queue 1: ")
            print(results1)
            print("queue 2: ")
            print(results2)
            print("")
        }
            
    }
    
    public static func semaphoreExample() {
        let queue = getCustomQueue()
        // set the semaphore with the max number of executing threads
        let semaphore = DispatchSemaphore(value: 3)
        for i in (0...15) {
            queue.async {
                let songNumber = i + 1
                // wait() decrements the value taking a thread from the pool
                semaphore.wait()
                print("Downloading song", songNumber)
                sleep(2) // Download take ~2 sec each
                print("Downloaded song", songNumber)
                
                // signal() adds back a thread to the pool
                semaphore.signal()
            }
        }
    }
}

// this is the question apple asked me on threading.
public class ThreadSafeDictionary {
    private var dict: [String: String] = [:]
    private let queue = DispatchQueue(label: "dict.queue", attributes: .concurrent)
    public func set(object: String, for key: String) {
        // call async with a barrier to ensure all other threads have completed when the update happens
        queue.async(flags: .barrier) {
            self.dict[key] = object
        }
    }
    
    public func getObject(for key: String) -> String? {
        var result: String? = nil
        // call sync on the queue to ensure nothing else is executing on the queue when the read occurrs
        queue.sync {
            result = self.dict[key]
        }
        return result
    }
}

public class MyThread: Thread {
    private var id: Int
    
    public init(id: Int) {
        self.id = id
    }
    
    public override func main() {
        if id % 2 == 0 {
            _ = id * id
        } else {
            _ = (id * id - 1) / 3
        }
        print(id)
    }
}

public class ThreadPool {
    private var pool: [MyThread] = []
    private var threadCount: Int
    
    public init(threadCount: Int) {
        self.threadCount = threadCount
        fillPool()
    }
    
    private func fillPool() {
        for i in (1...threadCount) {
            let t = MyThread(id: i)
            pool.append(t)
        }
    }
    
    public func getPoolCount() -> Int {
        return pool.count
    }
    
    public func startPool() {
        for i in pool {
            i.start()
        }
    }
    
}

