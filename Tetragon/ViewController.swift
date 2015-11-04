//
//  ViewController.swift
//  Tetragon
//
//  Created by Romain Menke on 28/10/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var rightBarOne : UIView!
    var rightBarTwo : UIView!
    
    var rw : CGFloat!
    var rh : CGFloat!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewSetUp()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        viewDidAppearAnimations()

        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func viewSetUp() {
        
        rw = self.view.frame.width / 100
        rh = self.view.frame.height / 100
        
        let skewSize = 15 * rw
        
        let point1 = CGPoint(x: 0.0, y: skewSize + 30)
        let point2 = CGPoint(x: 0.0, y: skewSize)
        let point3 = CGPoint(x: skewSize, y: 0)
        let point4 = CGPoint(x: skewSize, y: 30)
        let skewedTetragon = Tetragon(bottomLeft: point1, topLeft: point2, topRight: point3, bottomRight: point4)
        
        let labelOne = UILabel(frame: CGRect(x: point2.x + 5, y: point2.y - 5, width: 20, height: 20))
        labelOne.text = "a"
        labelOne.textColor = UIColor.whiteColor()
        
        let labelTwo = UILabel(frame: CGRect(x: point2.x + 5, y: point2.y - 5, width: 20, height: 20))
        labelTwo.text = "b"
        labelTwo.textColor = UIColor.whiteColor()
        
        rightBarOne = UIView(tetragon: skewedTetragon, origin: CGPoint(x: self.view.frame.size.width, y: 10))
        rightBarOne.backgroundColor = UIColor(red: 0.0, green: 0.2, blue: 0.6, alpha: 1.0)
        rightBarOne.addSubview(labelOne)
        
        rightBarTwo = UIView(tetragon: skewedTetragon, origin: CGPoint(x: self.view.frame.size.width, y: 60))
        rightBarTwo.backgroundColor = UIColor(red: 0.0, green: 0.2, blue: 0.6, alpha: 1.0)
        rightBarTwo.addSubview(labelTwo)
        
        self.view.addSubview(rightBarOne)
        self.view.addSubview(rightBarTwo)
        
    }

    
    func viewDidAppearAnimations() {
        
        
        UIView.animateWithDuration(1.0) { () -> Void in
            
            let x = self.rightBarOne.frame.origin.x - (15 * self.rw)
            let y = self.rightBarOne.frame.origin.y + (15 * self.rw)
            
            self.rightBarOne.frame.origin = CGPoint(x: x, y: y)
        }
        
        UIView.animateWithDuration(1.0, delay: 0.5, options: [], animations: { () -> Void in
            
            let x = self.rightBarTwo.frame.origin.x - (15 * self.rw)
            let y = self.rightBarTwo.frame.origin.y + (15 * self.rw)
            
            self.rightBarTwo.frame.origin = CGPoint(x: x, y: y)
            
            }) { (completed) -> Void in
                //
        }
        
        
    }
}

extension UIView {
    
    convenience init(tetragon: Tetragon, origin: CGPoint) {
        
        let frame = CGRect(origin: origin, size: tetragon.size)
        
        self.init(frame: frame)
        
        let mask = CAShapeLayer()
        mask.path = tetragon.path.CGPath
        self.layer.mask = mask
        
    }
}

extension UITextView {
    
    convenience init(textMask: Tetragon) {
        
        self.init(frame: textMask.frame)
        
        let mask = CAShapeLayer()
        mask.path = textMask.path.CGPath
        self.layer.mask = mask
        
        self.textContainer.exclusionPaths = textMask.exclusionPaths
        
    }
    
}