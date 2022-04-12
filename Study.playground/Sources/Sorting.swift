import Foundation

public class Sorter {
    public var studentQuestions: [Int: [(Bool, Int)]] = [:]
    
    public init() { }
    
    public func intakeQuestion(id: Int, isCorrect: Bool, time: Int) {
        var questions: [(Bool, Int)] = []
        if let a = studentQuestions[id] {
            questions = a
        }
        let question = (isCorrect, time)
        questions.append(question)
        studentQuestions.updateValue(questions, forKey: id)
    }
    
    // must have >= 75% correct
    // must have > 2 questions
    // sort by average time(fastest first)
    public func getStudentsByFastest() -> [Int] {
        var studentResults: [Int: Double] = [:]
        for s in studentQuestions.keys {
            guard let qResults = studentQuestions[s] else {
                print("cound not find: \(s)")
                continue
            }
            if qResults.count < 3 {
                print("less than 3 questions for \(s)")
                continue
            }
            var totalTime = 0
            var totalCorrect = 0.0
            for qr in qResults {
                totalTime += qr.1
                if qr.0 {
                    totalCorrect += 1.0
                }
            }
            let percentCorrect = totalCorrect/Double(qResults.count)
            if percentCorrect < 0.75 {
                print("less than .75 for \(s)")
                continue
            }
            let averageTime = Double(totalTime)/Double(qResults.count)
            studentResults.updateValue(averageTime, forKey: s)
        }
        let sortedArray = studentResults.sorted { (first, second) -> Bool in
            return first.value < second.value
        }.map { a in
            return a.key
        }
        return sortedArray
    }
}
