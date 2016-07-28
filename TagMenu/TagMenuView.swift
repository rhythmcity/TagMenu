//
//  TagMenuView.swift
//  TagMenu
//
//  Created by 李言 on 16/7/27.
//  Copyright © 2016年 李言. All rights reserved.
//

import UIKit

class TagMenuView: UIView {
    
    var maskLayer:CAShapeLayer?
    lazy var beziher:UIBezierPath = {
        var beziher = UIBezierPath()
        return beziher
        
    }()
    
    var contentView:UIView? {
        didSet{
            self.backgroundColor = self.contentView!.backgroundColor
            self.addSubview(self.contentView!)
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.8)
        maskLayer = CAShapeLayer()
        self.layer.mask = maskLayer
      
        self.transform = CGAffineTransformMakeScale(0,0)
        
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        beziher.removeAllPoints()
        if self.center.x  > self.superview?.center.x && self.center.y < self.superview?.center.y {
            beziher.moveToPoint(CGPoint(x:0,y:10))
            beziher.addLineToPoint(CGPoint(x:self.bounds.width-30,y:10))
            beziher.addLineToPoint(CGPoint(x:self.bounds.width-20,y:0))
            beziher.addLineToPoint(CGPoint(x:self.bounds.width-10,y:10))
            beziher.addLineToPoint(CGPoint(x:self.bounds.width,y:10))
            beziher.addLineToPoint(CGPoint(x:self.bounds.width,y:self.bounds.height))
            beziher.addLineToPoint(CGPoint(x:0,y:self.bounds.height))
            beziher.addLineToPoint(CGPoint(x:0,y:10))
            self.layer.anchorPoint = CGPoint(x: 1 - 20.0/self.bounds.size.width , y: 0)
            self.layer.position = CGPointMake(frame.origin.x + self.layer.anchorPoint.x * frame.size.width, frame.origin.y + self.layer.anchorPoint.y * frame.size.height)
        } else if self.center.x < self.superview?.center.x && self.center.y < self.superview?.center.y{
            beziher.moveToPoint(CGPoint(x:0,y:10))
            beziher.addLineToPoint(CGPoint(x:10,y:10))
            beziher.addLineToPoint(CGPoint(x:20,y:0))
            beziher.addLineToPoint(CGPoint(x:30,y:10))
            beziher.addLineToPoint(CGPoint(x:self.bounds.width,y:10))
            beziher.addLineToPoint(CGPoint(x:self.bounds.width,y:self.bounds.height))
            beziher.addLineToPoint(CGPoint(x:0,y:self.bounds.height))
            beziher.addLineToPoint(CGPoint(x:0,y:10))
            self.layer.anchorPoint = CGPoint(x: 20.0/self.bounds.size.width , y: 0)
            self.layer.position = CGPointMake(frame.origin.x + self.layer.anchorPoint.x * frame.size.width, frame.origin.y + self.layer.anchorPoint.y * frame.size.height)
        } else if self.center.x < self.superview?.center.x && self.center.y > self.superview?.center.y {
            beziher.moveToPoint(CGPoint(x:0,y:self.bounds.height - 10))
            beziher.addLineToPoint(CGPoint(x:10,y:self.bounds.height - 10))
            beziher.addLineToPoint(CGPoint(x:20,y:self.bounds.height ))
            beziher.addLineToPoint(CGPoint(x:30,y:self.bounds.height - 10))
            beziher.addLineToPoint(CGPoint(x:self.bounds.width,y:self.bounds.height - 10))
            beziher.addLineToPoint(CGPoint(x:self.bounds.width,y:0))
            beziher.addLineToPoint(CGPoint(x:0,y:0))
            beziher.addLineToPoint(CGPoint(x:0,y:self.bounds.height - 10))
            self.layer.anchorPoint = CGPoint(x:  20.0/self.bounds.size.width , y: 1)
            self.layer.position = CGPointMake(frame.origin.x + self.layer.anchorPoint.x * frame.size.width, frame.origin.y + self.layer.anchorPoint.y * frame.size.height)

        } else {
            beziher.moveToPoint(CGPoint(x:0,y:self.bounds.height - 10))
            beziher.addLineToPoint(CGPoint(x:self.bounds.width-30,y:self.bounds.height - 10))
            beziher.addLineToPoint(CGPoint(x:self.bounds.width-20,y:self.bounds.height ))
            beziher.addLineToPoint(CGPoint(x:self.bounds.width-10,y:self.bounds.height - 10))
            beziher.addLineToPoint(CGPoint(x:self.bounds.width,y:self.bounds.height - 10))
            beziher.addLineToPoint(CGPoint(x:self.bounds.width,y:0))
            beziher.addLineToPoint(CGPoint(x:0,y:0))
            beziher.addLineToPoint(CGPoint(x:0,y:self.bounds.height - 10))
            self.layer.anchorPoint = CGPoint(x: 1 - 20.0/self.bounds.size.width , y: 1)
            self.layer.position = CGPointMake(frame.origin.x + self.layer.anchorPoint.x * frame.size.width, frame.origin.y + self.layer.anchorPoint.y * frame.size.height)
        }
        maskLayer?.path = beziher.CGPath
        maskLayer?.strokeEnd = 1
        maskLayer?.fillRule = kCALineJoinRound
        maskLayer?.strokeStart = 0
        contentView!.frame = CGRect(x: 0, y: 10, width: self.frame.width, height: self.frame.height - 10)
    }
    
    
    func showPop(point:CGPoint) -> Void {
        self.center = point
        self.setNeedsLayout()
        self.layoutIfNeeded()
    
          self.transform = CGAffineTransformMakeScale(0,0)
        
        UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: .CurveEaseInOut, animations: {
            self.alpha = 1
            self.transform = CGAffineTransformMakeScale(1,1)
            }, completion: { (completed) in
                
        })
        
    }
    
    
    func dissPop() -> Void {
        UIView.animateWithDuration(0.5, animations: { 
            self.alpha = 0
            self.transform = CGAffineTransformMakeScale(0.001,0.001)
        }) { (completed) in
            self.transform = CGAffineTransformMakeScale(0.0,0.0)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    /*
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func drawRect(rect: CGRect) {
     // Drawing code
     }
     */
    
}
