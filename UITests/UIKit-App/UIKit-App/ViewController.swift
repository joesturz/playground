//
//  ViewController.swift
//  UIKit-App
//
//  Created by Austin Blaser on 11/18/21.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var button = makeButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(button)
    }
    


}

extension ViewController {
    func makeButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Go to nav", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 52)
        button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        return button
    }
}

extension ViewController {
    
    
    @objc private func didTap() {
        let rootVC = RecommendationViewController()
        let navViewController = UINavigationController(rootViewController: rootVC)
        navViewController.modalPresentationStyle = .fullScreen
        present(navViewController, animated: true)
    }
}


