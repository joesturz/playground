//
//  RecommendationViewController.swift
//  UIKit-App
//
//  Created by Joe Sturzenegger on 2/14/22.
//

import Foundation
import UIKit


class RecommendationViewController: UIViewController {
    private lazy var headerLabel = makeHeaderLabel()
    private lazy var questionLabel = makeLabel(with: "Hi Tendo, on a scale of 1 - 10, would recommend Dr Careful to a friend or family member?")
    private lazy var infoLabel = makeLabel(with: "1 = Would not recommend, 10 = Would strongly recommend")
    private lazy var slider = makeSlider()
    private lazy var button = makeButton()
    
    public var happinessValue: Int {
        return Int(slider.value)
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
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
            
            infoLabel.topAnchor.constraint(equalTo: questionLabel.bottomAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            infoLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            
            slider.topAnchor.constraint(equalTo: infoLabel.bottomAnchor),
            slider.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            slider.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            
            button.topAnchor.constraint(equalTo: slider.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}

extension RecommendationViewController {
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
    
    func makeSlider() -> UISlider {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 1
        slider.maximumValue = 10
        slider.addTarget(self, action: #selector(sliderUpdated), for: .valueChanged)
        self.view.addSubview(slider)
        return slider
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

extension RecommendationViewController {
    @objc
    private func sliderUpdated() {
        var val = self.slider.value
        val.round(.down)
        print(val)
    }
    
    @objc
    private func buttonTapped() {
        let vc = DiagnosisViewController(happy: happinessValue)
        self.show(vc, sender: nil)
//        self.showDetailViewController(vc, sender: nil)
//        self.present(DiagnosisViewController(happy: happinessValue), animated: false, completion: nil)
        
    }
}
