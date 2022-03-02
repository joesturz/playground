//
//  DiagnosisViewController.swift
//  UIKit-App
//
//  Created by Joe Sturzenegger on 2/14/22.
//

import Foundation
import UIKit

class DiagnosisViewController: UIViewController {
    private lazy var headerLabel = makeHeaderLabel()
    private lazy var questionLabel = makeLabel(with: "We appriciate the feedback, one last question: how do you feel about being diagnosed with Diabetes without complications?")
    private lazy var thoughtsLabel = makeLabel(with: "Your thoughts:")
    private lazy var textView = makeTextView()
    private lazy var button = makeButton()
    
    private var happinessValue: Int
    
    public var diagnosisValue: String {
        return textView.text
    }
    
    public init(happy: Int) {
        happinessValue = happy
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            
            questionLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor),
            questionLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            questionLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            
            thoughtsLabel.topAnchor.constraint(equalTo: questionLabel.bottomAnchor),
            thoughtsLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            thoughtsLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            
            textView.topAnchor.constraint(equalTo: thoughtsLabel.bottomAnchor),
            textView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            textView.heightAnchor.constraint(equalToConstant: 120),
            
            button.topAnchor.constraint(equalTo: textView.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}


extension DiagnosisViewController {
    func makeHeaderLabel() -> UILabel {
        let label = UILabel()
        label.text = "Feedback"
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label)
        return label
    }
    
    func makeLabel(with text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label)
        return label
    }
    
    func makeTextView() -> UITextView {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(textView)
        return textView
    }
    
    func makeButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button)
        return button
    }
}

extension DiagnosisViewController {
    @objc
    func buttonTapped() {
        print(happinessValue)
        print(diagnosisValue)
    }
}
