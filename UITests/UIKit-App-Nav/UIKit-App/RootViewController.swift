//
//  RootViewController.swift
//  UIKit-App
//
//  Created by Joe Sturzenegger on 3/1/22.
//

import Foundation
import UIKit

class RootViewController: UINavigationController {
    private lazy var viewController = makeDiagnosisViewController()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        self.navigationBar.isTranslucent = true
        self.navigationBar.isHidden = true
        self.view.addSubview(viewController.view)
    }
}

extension RootViewController {
    func makeDiagnosisViewController() -> RecommendationViewController {
        let vc = RecommendationViewController()
        return vc
    }
}
