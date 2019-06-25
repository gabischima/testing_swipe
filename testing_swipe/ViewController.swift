//
//  ViewController.swift
//  testing_swipe
//
//  Created by Gabriela Schirmer | MundiPagg on 25/06/19.
//  Copyright © 2019 Gabriela Schirmer | MundiPagg. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    var leftTableView = UITableView()
    var middleTableView = UITableView()
    var rightTableView = UITableView()
    
    var arrayLeft = ["0"]
    var arrayMiddle = ["0", "1"]
    var arrayRight = ["0", "1", "2"]
    
    var selectedView = 1

    @IBOutlet weak var myScrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.myScrollView.addSubview(self.leftTableView)
        self.myScrollView.addSubview(self.middleTableView)
        self.myScrollView.addSubview(self.rightTableView)
        
        self.myScrollView.delegate = self

        self.leftTableView.delegate = self
        self.middleTableView.delegate = self
        self.rightTableView.delegate = self
        self.leftTableView.dataSource = self
        self.middleTableView.dataSource = self
        self.rightTableView.dataSource = self

        self.leftTableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.middleTableView.frame = CGRect(x: self.view.frame.width, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.rightTableView.frame = CGRect(x: self.view.frame.width * 2, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
        self.leftTableView.tag = 0
        self.middleTableView.tag = 1
        self.rightTableView.tag = 2
        
        self.leftTableView.tableFooterView = UIView()
        self.middleTableView.tableFooterView = UIView()
        self.rightTableView.tableFooterView = UIView()
        
        self.myScrollView.setContentOffset(CGPoint(x: self.view.frame.width, y: 0.0), animated: false)
        self.myScrollView.contentSize = CGSize(width: self.view.frame.width * 3, height: self.view.frame.height)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView.tag {
        case 0:
            return self.arrayLeft.count
        case 1:
            return self.arrayMiddle.count
        case 2:
            return self.arrayRight.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = "oie"
        cell.backgroundColor = .red
        
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let tagLeft = self.leftTableView.tag
        let tagMiddle = self.middleTableView.tag
        let tagRight = self.rightTableView.tag
        if (scrollView.contentOffset.x == 0.0) {
            self.leftTableView.tag = tagRight
            self.middleTableView.tag = tagLeft
            self.rightTableView.tag = tagMiddle
        } else if (scrollView.contentOffset.x == self.view.frame.width * 2) {
            self.leftTableView.tag = tagMiddle
            self.middleTableView.tag = tagRight
            self.rightTableView.tag = tagLeft
        }
        self.leftTableView.reloadData()
        self.middleTableView.reloadData()
        self.rightTableView.reloadData()
        self.myScrollView.setContentOffset(CGPoint(x: self.view.frame.width, y: 0.0), animated: false)
    }
}

