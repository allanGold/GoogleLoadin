//
//  ViewController.swift
//  GoogleLoading
//
//  Created by zhangjuntao on 16/4/22.
//  Copyright © 2016年 laoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loadingView: UIView!
    let ovalShapeLayer: CAShapeLayer = CAShapeLayer()
    
    @IBOutlet weak var complexLoadingView: UIView!

    let anotherOvalShapeLayer: CAShapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        loadAnimation1()
        beginSimpleAnimation()
        
        loadAnimation2()
        beginComplexAnimation()
    }
    
    
    func loadAnimation2() {
        anotherOvalShapeLayer.strokeColor = UIColor.whiteColor().CGColor
        anotherOvalShapeLayer.fillColor = UIColor.clearColor().CGColor
        anotherOvalShapeLayer.lineWidth = 7
        
        let anotherOvalRadius = complexLoadingView.frame.size.height / 2 * 0.8
        anotherOvalShapeLayer.path = UIBezierPath(ovalInRect: CGRect(x: complexLoadingView.frame.size.width / 2 - anotherOvalRadius, y: complexLoadingView.frame.size.height / 2 - anotherOvalRadius, width: 2 * anotherOvalRadius, height: 2 * anotherOvalRadius)).CGPath
        complexLoadingView.layer.addSublayer(anotherOvalShapeLayer)
    }
    
    
    func beginComplexAnimation() {
        let strokeStartAnimation = CABasicAnimation(keyPath: "strokeStart")
        strokeStartAnimation.fromValue = -0.5
        strokeStartAnimation.toValue = 1
        
        let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeEndAnimation.fromValue = 0.0
        strokeEndAnimation.toValue = 1
        
        let strokeAnimationGroup = CAAnimationGroup()
        strokeAnimationGroup.duration = 1.5
        strokeAnimationGroup.repeatCount = HUGE
        strokeAnimationGroup.animations = [strokeStartAnimation, strokeEndAnimation]
        anotherOvalShapeLayer.addAnimation(strokeAnimationGroup, forKey: nil)
    }


    func loadAnimation1() {
        ovalShapeLayer.strokeColor = UIColor.purpleColor().CGColor
        ovalShapeLayer.fillColor = UIColor.clearColor().CGColor
        ovalShapeLayer.lineWidth = 7
        
        let ovalRadius = loadingView.frame.size.height / 2 * 0.8
        ovalShapeLayer.path = UIBezierPath(ovalInRect: CGRect(x: loadingView.frame.size.width / 2 - ovalRadius, y: loadingView.frame.height / 2 - ovalRadius, width: ovalRadius * 2, height: ovalRadius*2)).CGPath
        
        ovalShapeLayer.strokeEnd = 0.4
        ovalShapeLayer.lineCap = kCALineCapRound
        loadingView.layer.addSublayer(ovalShapeLayer)
    }
    
    
    func beginSimpleAnimation() {
        let rotate = CABasicAnimation(keyPath: "transform.rotation")
        rotate.duration = 1.5
        rotate.fromValue = 0
        rotate.toValue = 2 * M_PI
        rotate.repeatCount = HUGE
        loadingView.layer.addAnimation(rotate, forKey: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

