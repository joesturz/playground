//
//  ViewController.swift
//  DogBreeds
//
//  Created by Joe Sturzenegger on 1/25/23.
//

import UIKit

class BreedListViewController: UITableViewController {
    
    var dogBreeds: DogBreeds?
    var dogBreedNames: [String] = []
    var dogBreedNamesWithType: [(String, String)] = []

    
    override func viewWillAppear(_ animated: Bool) {
        getBreeds()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogBreedNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Fetch a cell of the appropriate type.
        let cell = tableView.dequeueReusableCell(withIdentifier: "BreedCell", for: indexPath) as! BreedCell
        let breedWithType = dogBreedNamesWithType[indexPath.row]
        cell.breedNameLabel.text = breedWithType.0
        cell.breedType.text = breedWithType.1
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
        
    
    public func getBreeds() {
        let network = Networking()
        network.getAllBreeds { [weak self] breeds in
            guard let self = self else {
                return
            }
            self.dogBreeds = breeds
            self.dogBreedNames = Array(breeds.message.keys)
            self.dogBreedNames.sort()
            self.dogBreedNamesWithType = self.cleanBreedData()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    func cleanBreedData() -> [(String, String)] {
        var result:[(String, String)] = []
        for i in dogBreedNames {
            if let breedTypes = self.dogBreeds?.message[i] {
                if breedTypes.count > 0 {
                    for j in breedTypes {
                        result.append((i, j))
                    }
                } else {
                    result.append((i, ""))
                }
            }
        }
        return result
    }
}

class BreedCell: UITableViewCell {
    @IBOutlet weak var breedType: UILabel!
    @IBOutlet weak var breedNameLabel: UILabel!
}
