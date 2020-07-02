//
//  UITableView+Extension.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/03.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit
import Then
import SnapKit

extension UITableView {
    func setEmptyView(title: String, message: String) {
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        
        let titleLabel = UILabel()
        let messageLabel = UILabel()

        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageLabel)
        // The only tricky part is here:
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        titleLabel.text = title
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)

        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 20).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -20).isActive = true
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.textColor = UIColor.lightGray
        messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)

        self.backgroundView = emptyView
        self.separatorStyle = .none
    }
    
    func setEmptyViewWithImage(title: String, message: String, Image: UIImage) {
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        
        let titleLabel = UILabel()
        let messageLabel = UILabel()
        let Image = UIImageView().then {
            $0.image = Image
        }

        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageLabel)
        emptyView.addSubview(Image)
        // The only tricky part is here:
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        titleLabel.text = title
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)

        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 20).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -20).isActive = true
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.textColor = UIColor.lightGray
        messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
        
        Image.snp.makeConstraints { (make) in
            make.bottom.equalTo(titleLabel.snp.top).inset(10)
            make.centerX.equalTo(titleLabel)
            make.centerY.equalTo(titleLabel)
        }

        self.backgroundView = emptyView
        self.separatorStyle = .none
    }

    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
    
    // DetailNewsFeed - 보여줄 댓글이 없는 경우 표시
    func setStatusNoReplyView(_ cell: ReplyCell, emptyView: UIView) {
        emptyView.backgroundColor = .white
        let maxWidthContainer: CGFloat = 375
        let maxHeightContainer: CGFloat = 140
        
        let zigiNoReply = UIImageView()
        zigiNoReply.image = #imageLiteral(resourceName: "zigi_no_reply")
        let maxWidthImage: CGFloat = 455
        let maxHeightImage: CGFloat = 684
        
        let msgLabel = UILabel()
        msgLabel.text = "댓글이 없습니다"
        msgLabel.textColor = .black
        msgLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 15)
        msgLabel.font = msgLabel.font.withSize(15)
        msgLabel.textAlignment = .center
        
        cell.addSubview(emptyView)
        emptyView.addSubview(zigiNoReply)
        emptyView.addSubview(msgLabel)
        
        emptyView.snp.makeConstraints({ (make) in
            make.width.equalTo(emptyView.snp.height).multipliedBy(maxWidthContainer/maxHeightContainer)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        })
        
        zigiNoReply.snp.makeConstraints({ (make) in
            make.width.equalTo(zigiNoReply.snp.height).multipliedBy(maxWidthImage/maxHeightImage)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalTo(-30)
        })
        
        msgLabel.snp.makeConstraints({ (make) in
            make.centerX.equalTo(zigiNoReply)
            make.bottom.equalToSuperview()
        })
    }
}
