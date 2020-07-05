//
//  IDVC.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/04.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class IDVC: UIViewController {
    
    // MARK: - UI components
    
    let guideLabel = UILabel().then{
        $0.font = Font.dateLabel
    }
    
    let idGuiedLabel = UILabel().then{
        $0.font = Font.dateLabel
    }
    
    let emailTextField = UITextField().then{
        $0.font = Font.dateLabel
    }
    
    let emailErrorGuiedLabel = UILabel().then{
        $0.font = Font.dateLabel
    }
        
    let firstPageControllView = UIView().then{
        $0.backgroundColor = .signatureColor
    }
    
    let secondPageControllView = UIView().then{
        $0.backgroundColor = .signatureColor
    }
    
    let thirdPageControllView = UIView().then{
        $0.backgroundColor = .signatureColor
    }
    
    let nextButton = UIButton().then{
        $0.backgroundColor = .signatureColor
    }
    
    // MARK: - Variables and Properties
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
}
