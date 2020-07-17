//
//  SplashVC.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/17.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

import SwiftyGif

class SplashVC: UIViewController {

    let logoAnimationView = LogoAnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(logoAnimationView)
        logoAnimationView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
//            make.width.equalTo(1125)
//            make.height.equalTo(2436)
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        logoAnimationView.logoGifImageView.delegate = self

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logoAnimationView.logoGifImageView.startAnimatingGif()

    }

}

extension SplashVC: SwiftyGifDelegate {
    func gifDidStop(sender: UIImageView) {
        logoAnimationView.isHidden = true
        
        let vc = storyboard?.instantiateViewController(identifier: "LoginNVC") as! LoginNVC
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        
        present(vc, animated: false)

    }
}
