//
//  ViewController.swift
//  TestProj
//
//  Created by Joe Sturzenegger on 8/31/22.
//


/*
 This was a test i took during an interview
 The project was to recreate a Table view.
 Not sure how far i needed to get but i made it farther than i thought i would
 I am keeping this to learn from in the future
 */

import UIKit

protocol CoolTableViewControllerDelegate {
    func cellData(index: Int) -> String
    
    func numberCells() -> Int
}

class CoolTableViewController: UIViewController {
    private weak var scrollView:UIScrollView? = nil
    private weak var cell:UILabel? = nil
    
    public var delegate:CoolTableViewControllerDelegate? {
        didSet {
            createCells()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scrollView = makeScrollView()
        
        let cell = makeCell()
        
        self.scrollView = scrollView
        self.cell = cell
        
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        
    }
    
    func createCells() {
        var lastCellAdded:UILabel? = nil
        guard let delegate = delegate, let scrollView = scrollView else {
            return
        }
        for i in (0...delegate.numberCells()) {
            let newCell = makeCell()
            newCell.text = delegate.cellData(index: i)
            scrollView.addSubview(newCell)
            if let lastCellAdded = lastCellAdded {
                if (i == 20) {
                    NSLayoutConstraint.activate([
                        newCell.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                        newCell.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                        newCell.topAnchor.constraint(equalTo: lastCellAdded.bottomAnchor),
                        newCell.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                        newCell.heightAnchor.constraint(equalToConstant: 100),
                    ])
                } else {
                    NSLayoutConstraint.activate([
                        newCell.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                        newCell.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                        newCell.topAnchor.constraint(equalTo: lastCellAdded.bottomAnchor),
                        newCell.heightAnchor.constraint(equalToConstant: 100),
                    ])
                }
                
            } else {
                NSLayoutConstraint.activate([
                    newCell.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                    newCell.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                    newCell.topAnchor.constraint(equalTo: scrollView.topAnchor),
                    newCell.heightAnchor.constraint(equalToConstant: 100),
                ])
            }
            lastCellAdded = newCell
        }
    }
    
}

extension  CoolTableViewController {
    
    func makeScrollView() -> UIScrollView {
        let view =  UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentSize = CGSize(width: 100, height: 100 * 20)
        return view
    }
    
    func makeCell() -> UILabel {
        let view =  UILabel()
        view.text = "Cool Label"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
}
