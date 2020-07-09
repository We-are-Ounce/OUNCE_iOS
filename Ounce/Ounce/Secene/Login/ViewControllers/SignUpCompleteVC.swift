//
//  SignUpCompleteVC.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/07.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class SignUpCompleteVC: UIViewController {
    
    // MARK: - UI components
    
    @IBOutlet weak var guideLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    // MARK: - Variables and Properties
    
    var colors:[UIColor] = [
        Colors.red,
        Colors.blue,
        Colors.green,
        Colors.yellow
    ]
    
    var images:[UIImage] = [
        Images.box,
        Images.triangle,
        Images.circle,
        Images.swirl
    ]
    
    var velocities:[Int] = [
        100,
        90,
        150,
        200
    ]

    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let emitter = CAEmitterLayer()
        emitter.emitterPosition = CGPoint(x: self.view.frame.size.width / 2, y: -10)
        emitter.emitterShape = CAEmitterLayerEmitterShape.line
        emitter.emitterSize = CGSize(width: self.view.frame.size.width, height: 2.0)
        emitter.emitterCells = generateEmitterCells()
        self.view.layer.addSublayer(emitter)
        
        setLabel()
        setButton()
    }
    
    private func generateEmitterCells() -> [CAEmitterCell] {
    var cells:[CAEmitterCell] = [CAEmitterCell]()
        
    for index in 0..<16 {
        let cell = CAEmitterCell()
        cell.birthRate = 1.0
        cell.lifetime = 14.0
        cell.lifetimeRange = 0
        cell.velocity = CGFloat(getRandomVelocity())
        cell.velocityRange = 0
        cell.emissionLongitude = CGFloat(Double.pi)
        cell.emissionRange = 0.5
        cell.spin = 3.5
        cell.spinRange = 0
        cell.color = getNextColor(i: index)
        cell.contents = getNextImage(i: index)
        cell.scaleRange = 0.25
        cell.scale = 0.1
        cells.append(cell)
    }
        return cells
    }

    private func getRandomVelocity() -> Int {
        return velocities[getRandomNumber()]
    }
    
    private func getRandomNumber() -> Int {
        return Int(arc4random_uniform(4))
    }

    private func getNextImage(i:Int) -> CGImage {
        return images[i % 4].cgImage!
    }

    private func getNextColor(i:Int) -> CGColor {
        if i <= 4 {
            return colors[0].cgColor
        } else if i <= 8 {
            return colors[1].cgColor
        } else if i <= 12 {
            return colors[2].cgColor
        } else {
            return colors[3].cgColor
        }
    }

}

// MARK: - Helpers 메소드 모두 따로 작성해주세요
extension SignUpCompleteVC {
    func setLabel() {
        let attrString = NSMutableAttributedString(string: "회원가입이 \n완료되었습니다.")
        attrString.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String),
                                value: Font.signUpBigGuideLabel as Any, range: NSMakeRange(0, 4))
        guideLabel.attributedText = attrString
        guideLabel.numberOfLines = 2
    }
    
    func setButton(){
        completeButton.addTarget(self,
                                 action: #selector(didTapCompleteButton),
                                 for: .touchUpInside)
        completeButton.backgroundColor = .wheatColor
        completeButton.setRounded(radius: 8)
        completeButton.titleLabel?.font = Font.guideLabel
        completeButton.tintColor = .black
    }
    
    @objc func didTapCompleteButton(){
        let vc = UIStoryboard.init(name: "Register",
                               bundle: Bundle.main).instantiateViewController(
                                withIdentifier: "RegisterNavVC") as? RegisterNavVC
        
        vc?.modalPresentationStyle = .fullScreen
        
        self.present(vc!, animated: true, completion: nil)
    }
}

enum Colors {
    
    static let red = UIColor(red: 1.0, green: 0.0, blue: 77.0/255.0, alpha: 1.0)
    static let blue = UIColor.blue
    static let green = UIColor(red: 35.0/255.0 , green: 233/255, blue: 173/255.0, alpha: 1.0)
    static let yellow = UIColor(red: 1, green: 209/255, blue: 77.0/255.0, alpha: 1.0)
    
}

enum Images {
    
    static let box = UIImage(named: "Box")!
    static let triangle = UIImage(named: "Triangle")!
    static let circle = UIImage(named: "Circle")!
    static let swirl = UIImage(named: "Spiral")!
    
}
