import Foundation

protocol SomeDelegate: AnyObject {
    func didReceiveData(data: String)
}


class DataManager {
    
    weak var delegate: SomeDelegate?
    
    func fetchData() {
        let data = "a lot of data"
        
        delegate?.didReceiveData(data: data)
    }
}


public class ViewController: SomeDelegate {
    let dataManager = DataManager()
    
    public init() {
        dataManager.delegate = self
    }
    
    func didReceiveData(data: String) {
        print("Receive data: \(data)")
    }
    
    public func fetchData() {
        dataManager.fetchData()
    }
}
