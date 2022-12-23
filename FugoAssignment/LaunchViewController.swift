//
//  LaunchViewController.swift
//  FugoAssignment
//
//  Created by Crystal on 2022/12/23.
//

import UIKit

class LaunchViewController: BaseViewController {
    
    lazy var logoImageView: UIImageView = {
        let image = UIImage(named: "Fugo_logo")
        let imageView = UIImageView(image: image)
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    private func setupUI() {
        view.addSubview(logoImageView)
        logoImageView.snp.makeConstraints {
            $0.width.height.equalTo(view.snp.width).dividedBy(2)
           $0.center.equalTo(view)
        }
    }
}
