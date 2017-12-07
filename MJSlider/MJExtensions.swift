//
//  MJExtensions.swift
//  VocoderSwift
//
//  Created by Martin Jaroszewicz on 9/20/17.
//  Copyright © 2017 Martin Jaroszewicz. All rights reserved.
//
import UIKit

func - (lhs: CGPoint, rhs: CGPoint) -> CGVector {
    return CGVector(dx: lhs.x - rhs.x, dy: lhs.y - rhs.y)
}


extension Double {
    func format() -> String {
        return String(format: "%.2f", self)
    }
}

extension CGVector {
    /**
     * Returns angle between vector and receiver in radians. Return is between
     * 0 and 2 * PI in clockwise direction.
     */
    func angleFromVector(vector: CGVector) -> Double {
        let angle = Double(atan2(dy, dx) - atan2(vector.dy, vector.dx))
        return angle > 0 ? angle : angle + 2 * Double.pi
    }
}

extension CGRect {
    var center: CGPoint {
        return CGPoint(x: origin.x + size.width / 2, y: origin.y + size.height / 2)
    }
}

extension UIColor {
    /**
     * Returns a color with adjusted saturation and brigtness than can be used to
     * indicate control is disabled.
     */
    func disabledColor() -> UIColor {
        var h = CGFloat(0)
        var s = CGFloat(0)
        var b = CGFloat(0)
        var a = CGFloat(0)
        
        getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        return UIColor(hue: h, saturation: s * 0.5, brightness: b * 1.2, alpha: a)
    }
}

extension CATransaction {
    static func doWithNoAnimation(action:()->Void) {
        CATransaction.begin()
        CATransaction.setValue(true, forKey: kCATransactionDisableActions)
        action()
        CATransaction.commit()
    }
}

extension UIView {
    func addBackground() {
        // screen width and height:
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageViewBackground.image = UIImage(named: "background.png")
        
        // you can change the content mode:
        imageViewBackground.contentMode = UIViewContentMode.scaleAspectFill
        
        self.addSubview(imageViewBackground)
        self.sendSubview(toBack: imageViewBackground)
    }}
