//
//  ViewController.swift
//  DragView
//
//  Created by ashen on 2017/8/2.
//  Copyright © 2017年 http://www.devashen.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let m = DragView.init(frame: CGRect.init(x: 0, y: 100, width: 50 , height: 50), image: UIImage(named: ""))
        m.backgroundColor = UIColor.red
        self.view.addSubview(m)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

