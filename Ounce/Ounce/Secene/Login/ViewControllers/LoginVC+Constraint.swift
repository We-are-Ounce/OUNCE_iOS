import UIKit

import SnapKit

extension LoginVC {
    func constraint() {
        self.view.addSubview(logoImageView)
        self.view.addSubview(idGuideLabel)
        self.view.addSubview(idErrorGuideLabel)
        self.view.addSubview(idTextField)
        self.view.addSubview(idTextFieldGuideView)
        self.view.addSubview(pwGuideLabel)
        self.view.addSubview(pwErrorGuideLabel)
        self.view.addSubview(pwTextField)
        self.view.addSubview(pwTextFieldGuideView)
        self.view.addSubview(loginButton)
        self.view.addSubview(findIDButton)
        self.view.addSubview(leftGuideView)
        self.view.addSubview(findPWButton)
        self.view.addSubview(rightGuideView)
        self.view.addSubview(signUpButton)
        
        logoImageView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().offset(88)
            make.width.equalToSuperview()
            make.height.equalTo(27.5)
        }
        
        idGuideLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(logoImageView.snp.bottom).offset(43.6)
            make.width.equalToSuperview()
            make.height.equalTo(24)
        }
        
        idErrorGuideLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(27.5)
        }
        
        idTextField.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(idGuideLabel.snp.bottom).offset(7)
            make.width.equalTo(self.view.frame.width / 3 * 2)
            make.height.equalTo(24)
        }
        
        idTextFieldGuideView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(idTextField.snp.bottom).offset(8)
            make.height.equalTo(1)
        }
        
        pwGuideLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(idGuideLabel.snp.bottom).offset(66)
            make.width.equalToSuperview()
            make.height.equalTo(24)
        }
        
        pwErrorGuideLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(27.5)
        }
        
        pwTextField.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(pwGuideLabel.snp.bottom).offset(7)
            make.width.equalTo(self.view.frame.width / 3 * 2)
            make.height.equalTo(24)
        }
        
        pwTextFieldGuideView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(pwTextField.snp.bottom).offset(8)
            make.height.equalTo(1)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(pwTextFieldGuideView.snp.bottom).offset(41)
            make.height.equalTo(48)
        }
        
        findIDButton.snp.makeConstraints { (make) in
            make.trailing.equalTo(leftGuideView.snp.leading).offset(-5)
            make.top.equalTo(loginButton.snp.bottom).offset(15)
            make.width.equalTo(64)
            make.height.equalTo(19)
        }
        
        leftGuideView.snp.makeConstraints { (make) in
            make.trailing.equalTo(findPWButton.snp.leading).offset(-5)
            make.top.equalTo(loginButton.snp.bottom).offset(18.5)
            make.width.equalTo(1)
            make.height.equalTo(14)
        }
        
        findPWButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginButton.snp.bottom).offset(15)
            make.width.equalTo(75)
            make.height.equalTo(19)
        }
        
        rightGuideView.snp.makeConstraints { (make) in
            make.leading.equalTo(findPWButton.snp.trailing).offset(5)
            make.top.equalTo(loginButton.snp.bottom).offset(18.5)
            make.width.equalTo(1)
            make.height.equalTo(14)
        }
        
        signUpButton.snp.makeConstraints { (make) in
            make.leading.equalTo(rightGuideView.snp.trailing).offset(5)
            make.top.equalTo(loginButton.snp.bottom).offset(15)
            make.width.equalTo(48)
            make.height.equalTo(19)
        }
    }
}
