//
//  MainVC.swift
//  Ounce
//
//  Created by 박주연 on 2020/07/07.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    let DEVICE_SIZE = UIScreen.main.bounds.size
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var profileHeight: NSLayoutConstraint!
    
    @IBOutlet weak var reviewView: UIView!
    
    @IBOutlet weak var reviewHeaderHeight: NSLayoutConstraint!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    @IBAction func panAction(_ sender: UIPanGestureRecognizer)
    
    {
        let maxScrOffY = maxContentOffSetY(scrollView)
        let scrOffY = scrollView.contentOffset.y
        
        let maxTabOffY = maxContentOffSetY(tableView)
        let tabOffY = tableView.contentOffset.y
        
        let velocityY = sender.velocity(in: scrollView).y / 100
        
        if scrOffY - velocityY < 0 {
            scrollView.contentOffset.y = 0
        }
        else if scrOffY - velocityY > maxScrOffY {
            scrollView.contentOffset.y = maxScrOffY
            tableView.contentOffset.y = (tabOffY - velocityY > maxTabOffY) ? maxTabOffY : tabOffY - velocityY
        }
        else {
            if velocityY < 0 {
                scrollView.contentOffset.y = scrOffY - velocityY
            } else {
                if(tabOffY - velocityY < 0){
                    tableView.contentOffset.y = 0
                    scrollView.contentOffset.y = scrOffY - velocityY
                } else {
                    tableView.contentOffset.y = tabOffY - velocityY
                }
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        scrollView.isScrollEnabled = false
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panAction(_:)))
        self.scrollView.addGestureRecognizer(panGestureRecognizer)
        
        tableView.isScrollEnabled = false
        tableViewHeight.constant = scrollView.bounds.height - profileHeight.constant - reviewHeaderHeight.constant
    }
    
    private func maxContentOffSetY(_ scrollView: UIScrollView) -> CGFloat {
        
        return scrollView.contentSize.height - scrollView.bounds.height  - 65
    }
    
}


extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5 // 후에 데이터셋.count로 변경
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.backgroundColor = .clear
        
        return cell
    }
    
    
}
