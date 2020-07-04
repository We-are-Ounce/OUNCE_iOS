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
        self.view.addSubview(findGuideButton)
        self.view.addSubview(loginButton)
        self.view.addSubview(signUpGuideLabel)
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

        findGuideButton.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-24)
            make.top.equalTo(pwTextFieldGuideView.snp.bottom).offset(6)
            make.width.equalTo(129)
            make.height.equalTo(19)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(pwGuideLabel.snp.bottom).offset(104)
            make.height.equalTo(48)
        }
        
        signUpGuideLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(95)
            make.top.equalTo(loginButton.snp.bottom).offset(6)
            make.width.equalTo(131)
            make.height.equalTo(19)
        }
        
        signUpButton.snp.makeConstraints { (make) in
            make.leading.equalTo(signUpGuideLabel.snp.trailing).offset(6)
            make.top.equalTo(loginButton.snp.bottom).offset(6)
            make.width.equalTo(48)
            make.height.equalTo(19)
        }
        
    }
}
