import Foundation


public class DateMachine {
    public func getDateFrom(day: Int, month: Int, year: Int) -> Date? {
        let components = DateComponents(year: year, month: month, day: day)
        let calendar = Calendar(identifier: .iso8601)
        let date = calendar.date(from: components)
        
        return date
    }
    
}
