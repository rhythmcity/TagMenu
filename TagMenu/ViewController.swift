//
//  ViewController.swift
//  TagMenu
//
//  Created by 李言 on 16/7/27.
//  Copyright © 2016年 李言. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tagview:TagMenuView?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let view = UIView()
        view.backgroundColor = UIColor.greenColor()
        tagview = TagMenuView.init(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        
        tagview?.contentView = view
        self.view.addSubview(tagview!)

        
//        let button = UIButton(type: .Custom)
//        button.backgroundColor = UIColor.redColor()
//        button.addTarget(self, action: #selector(ViewController.buttonClick(_:)), forControlEvents: .TouchUpInside)
//        button.frame = CGRect(x: 300, y: 40, width: 30, height: 30)
//        self.view.addSubview(button)
        
        
        
    }
    
//    func buttonClick(sender:UIButton) -> Void {
//        
//        sender.selected = !sender.selected
//        if sender.selected {
//             self.tagview?.showPop(CGPoint(x: sender.center.x, y: CGRectGetMaxY(sender.frame)))
//        } else {
//        
//            self.tagview?.dissPop()
//        }
//
//        
//    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

        if let touch =  touches.first as UITouch! {
            
            let point = touch.locationInView(self.view)
            self.tagview?.showPop(point)
           
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

