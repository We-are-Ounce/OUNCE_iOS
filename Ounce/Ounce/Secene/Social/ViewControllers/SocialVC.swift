//
//  SocialVC.swift
//  Ounce
//
//  Created by psychehose on 2020/07/10.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

import SnapKit
import Then

class SocialVC: UIViewController {

    // Mark - UI components

    let tabCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0

        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(TabCVC.self, forCellWithReuseIdentifier: "TabCVC")
        cv.scrollIndicatorInsets = .zero
        return cv
    }()

    let pageCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0

        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false

        cv.register(PageCVC.self, forCellWithReuseIdentifier: "PageCVC")
        cv.isPagingEnabled = true

        return cv
    }()


    //let scrollView = UIScrollView()
    let contentView = UIView()
    let following = UITableView()
    let follower = UITableView()




    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension SocialVC: UICollectionViewDelegate { }

extension SocialVC: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        switch collectionView {
        case self.tabCV:
            return CGSize(width: self.view.frame.width/2, height: collectionView.frame.height)
        case self.pageCV:
            return CGSize(width: self.view.frame.width, height: collectionView.frame.height)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
}

extension SocialVC: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case self.tabCV:
            guard let tabCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCVC", for: indexPath) as? TabCVC else { return UICollectionViewCell() }
            tabCell.backgroundColor = .white

            if indexPath.row == 0 {
                tabCell.titleLabel.text = "팔로워"

            }else {
                tabCell.titleLabel.text = "팔로워"
                tabCell.titleLabel.textColor = .lightPeach
            }

            return tabCell

        case self.pageCV:
            guard let pageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PageCVC", for: indexPath) as? PageCVC else { return UICollectionViewCell() }

            follower.delegate = self
            follower.dataSource = self
            following.delegate = self
            following.dataSource = self


            if indexPath.row == 0 {
                pageCell.addSubview(follower)
                follower.snp.makeConstraints{ ( make ) in
                    make.top.equalTo(pageCell.snp.top)
                    make.bottom.equalTo(pageCell.snp.bottom)
                    make.leading.equalTo(pageCell.snp.leading)
                    make.trailing.equalTo(pageCell.snp.trailing)
                }
                self.follower.register(SocialListTVC.self, forCellReuseIdentifier: "SocialListTVC")
            } else {
                pageCell.addSubview(following)

                following.snp.makeConstraints{ ( make ) in
                    make.top.equalTo(pageCell.snp.top)
                    make.bottom.equalTo(pageCell.snp.bottom)
                    make.leading.equalTo(pageCell.snp.leading)
                    make.trailing.equalTo(pageCell.snp.trailing)
                }
                self.following.register(SocialListTVC.self, forCellReuseIdentifier: "SocialListTVC")
            }
            pageCV.backgroundColor = .white

            return pageCell

        default:
            return UICollectionViewCell()

        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == tabCV {
            pageCV.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }

}

//extension SocialVC: UICollectionViewDelegate { }


extension SocialVC: UITableViewDelegate { }
extension SocialVC: UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }



    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        switch tableView {
//        case self.follower:
//            guard let followerCell = tableView.dequeueReusableCell(withIdentifier: "SocialListTVC", for: indexPath) as? SocialListTVC else { return UITableViewCell() }
//
//        default
//        }
        return UITableViewCell()
    }



}



