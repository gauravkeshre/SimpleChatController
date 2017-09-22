//
//  UIView+Decoration.swift
//  GK
//
//  Created by Gaurav Keshre on 07/02/17.
//  Copyright © 2017 GK. All rights reserved.
//

import Foundation
import  UIKit

fileprivate struct DecorationConstants{
    static let ShadowRadius: CGFloat = 4.0
    static let ShadowOpacity: Float = 0.3
    static let ShadowLayerName = "shadow_layer_zc"
    static let ShapeLayerName = "shape_layer_zc"
}

/// A type that can layout itself and its contents.
protocol Decoratable {
    var layer: CALayer {get}
    func decorate(cornerRadius: CGFloat, roundedCorners: UIRectCorner, borderColor: UIColor, borderWidth: CGFloat, enableShadow: Bool )
}

extension UIView: Decoratable {
    
    /// Adds corner radius and (optionally) shadow to any UIView subclass
    /// - Parameter cornerRadius: Default is 4.0
    /// - Parameter roundedCorners: Default is `allCorners`
    /// - Parameter borderColor: Default is `lightGray`
    /// - Parameter borderWidth: Default is 0
    /// - Parameter enableShadow: Default is `true`
    
    func decorateWithCornerRadius(cornerRadius: CGFloat = 4,
                                  borderColor: UIColor = .lightGray,
                                  borderWidth: CGFloat = 0,
                                  enableShadow: Bool = true ){
        
        
        let rectanglePath =  UIBezierPath(roundedRect: self.bounds,
                                          byRoundingCorners: .allCorners,
                                          cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        
        if enableShadow{
            layer.shadowOffset  = CGSize(width: 1, height: 1)
            layer.shadowPath    = rectanglePath.cgPath
            layer.shadowColor   = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).cgColor
            layer.shadowRadius  = DecorationConstants.ShadowRadius
            layer.shadowOpacity = DecorationConstants.ShadowOpacity
        }else{
            layer.shadowColor   = UIColor.clear.cgColor
            layer.shadowOpacity = 0
        }
        layer.cornerRadius  = cornerRadius
        layer.borderColor   = borderColor.cgColor
        layer.borderWidth   = borderWidth
    }
    
    func decorate(cornerRadius: CGFloat = 4,
                  roundedCorners: UIRectCorner = .allCorners,
                  borderColor: UIColor = .lightGray,
                  borderWidth: CGFloat = 0, enableShadow: Bool = true ){
        self.decorate(layer: layer, cornerRadius: cornerRadius, roundedCorners: roundedCorners, borderColor: borderColor, borderWidth: borderWidth, enableShadow: enableShadow)
    }
    
    func decorate(layer: CALayer, cornerRadius: CGFloat = 4,
                  roundedCorners: UIRectCorner = .allCorners,
                  borderColor: UIColor = .clear,
                  borderWidth: CGFloat = 0, enableShadow: Bool = true ){
        
        layer.removeSubLayers(names: DecorationConstants.ShadowLayerName, DecorationConstants.ShapeLayerName)
        let rectanglePath =  UIBezierPath(roundedRect: self.bounds,
                                          byRoundingCorners: roundedCorners,
                                          cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)
        )
        layer.masksToBounds = false
        let r_layer = CAShapeLayer()
        r_layer.name = DecorationConstants.ShapeLayerName
        r_layer.fillColor = self.backgroundColor?.cgColor
        r_layer.lineWidth = borderWidth
        r_layer.path = rectanglePath.cgPath
        r_layer.strokeColor = borderColor.cgColor
        self.layer.insertSublayer(r_layer, at: 0)
        self.backgroundColor = .clear
        
        if enableShadow {
            let shadow = CAShapeLayer()
            shadow.name = DecorationConstants.ShadowLayerName
            shadow.fillColor = UIColor.clear.cgColor
            shadow.shadowPath = rectanglePath.cgPath
            shadow.path = rectanglePath.cgPath
            shadow.shadowOffset = CGSize(width: 0, height: 1)
            shadow.shadowPath = rectanglePath.cgPath
            shadow.shadowColor = UIColor.black.cgColor
            shadow.shadowRadius = DecorationConstants.ShadowRadius
            shadow.shadowOpacity = DecorationConstants.ShadowOpacity
            layer.insertSublayer(shadow, below: r_layer)
        }
    }
}


/** Animation Utility */
extension UIView{
    enum Axis: String{
        case x, y
    }
    /**
     Shakes the receiver view object on passed in axis.
     - paramter: axis. Defaults to `x`. The axis at which the shake need to happen. X for horizontal shake. Y for vertical shake
     - paramter: duration. Defaults to `0.3`.
     */
    func shake( axis: Axis = Axis.x, duration: TimeInterval = 0.3 ){
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.\(axis.rawValue)")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = duration
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "position")
    }
    
    /** Zooming in (scales) the receiver with a spring effects*/
    func springEffect( zoomLevel:CGFloat) {
        UIView.animate(withDuration: 4.0, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 5.0, options: .allowUserInteraction, animations: { () -> Void in
            self.transform = CGAffineTransform.identity.scaledBy(x: zoomLevel, y: zoomLevel)
        }, completion: { (finished) -> Void in
            UIView.animate(withDuration: 1.0, animations: { () -> Void in
                self.transform = CGAffineTransform.identity
            })
        })
    }
}


extension UIView{
    func scale(_ factor: CGFloat = 0, duration: TimeInterval = 0.3){
        let trans = (factor > 0) ? CGAffineTransform(scaleX: factor, y: factor): .identity
        
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.curveEaseIn, animations: {
             self.transform = trans
        }, completion: nil)
    }
}

/** Storyboard friendly UIView  */
@IBDesignable
class DecoratedView: UIView{
    
    @IBInspectable var enableShadow: Bool = true{
        didSet{
            setNeedsLayout()
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 4{
        didSet{
            setNeedsLayout()
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 1{
        didSet{
            setNeedsLayout()
        }
    }
    
    @IBInspectable var borderColor: UIColor = .lightGray{
        didSet{
            setNeedsLayout()
        }
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        decorate(animate: true)
    }
    override func prepareForInterfaceBuilder() {
        decorate(animate: false)
    }
    private func decorate(animate: Bool = false){
        decorateWithCornerRadius(cornerRadius: cornerRadius, borderColor: borderColor, borderWidth: borderWidth, enableShadow: enableShadow)
        
        if animate, let anim = self.layer.animation(forKey: "bounds"){
            CATransaction.begin()
            CATransaction.setAnimationDuration(anim.duration)
            CATransaction.setAnimationTimingFunction(anim.timingFunction)
            let anim = CABasicAnimation(keyPath: "path")
            self.layer.add(anim, forKey: "path")
            CATransaction.commit()
        }
    }
}


/** AccessoryView */
extension UIView{
    /**
     Adds an AccessoryView on all textfields in the receiver. Traverses all the subviews `Depth-first` and finds all UITextFields and adds the passed in `accessoryView`.
     - important: This method is recursive and iterative.
     - warning: This method a expensive. If you have very few TextFields try setting the `accessoryView directly`
     */
    func addAccessoryViewOnAllTextFields(accessoryView: UIView){
        addAccessoryView(accessoryView, on: self)
    }
    private func addAccessoryView(_ accessoryView: UIView, on targetView: UIView){
        if targetView is UITextField {
            (targetView as! UITextField).inputAccessoryView = accessoryView
            return
        }
        
        // Get the subviews of the view
        let children = targetView.subviews
        
        // Return if there are no subviews
        if children.count == 0 {
            return
        }
        for child in children{
            addAccessoryView(accessoryView, on: child)
        }
    }
}

//MARK:- ScrollView Decoration
//--------------------------
extension UIScrollView{
    override func decorate(cornerRadius: CGFloat = 4,
                           roundedCorners: UIRectCorner = .allCorners,
                           borderColor: UIColor = .lightGray,
                           borderWidth: CGFloat = 0, enableShadow: Bool = true ){
        
        
        super.decorateWithCornerRadius(cornerRadius: cornerRadius, borderColor: borderColor, borderWidth: borderWidth, enableShadow: enableShadow)
    }
}




//MARK:- UITextField Decoration Methods
//--------------------------
extension UITextField {
    override func decorate(cornerRadius: CGFloat = 4,
                           roundedCorners: UIRectCorner = .allCorners,
                           borderColor: UIColor = .lightGray,
                           borderWidth: CGFloat = 0, enableShadow: Bool = true ){
        
        layer.masksToBounds = false
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        
        if enableShadow{
            layer.shadowOffset = CGSize.zero
            layer.shadowRadius = DecorationConstants.ShadowRadius
            layer.shadowOpacity = DecorationConstants.ShadowOpacity
            layer.shadowColor = UIColor.black.cgColor
        }else{
            layer.shadowOpacity = 0
            layer.shadowColor = UIColor.clear.cgColor
        }
        super.layoutSubviews()
    }
    
    override open func prepareForInterfaceBuilder() {
        setNeedsLayout()
    }
}


extension UIView{
    func shake(){
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 0.3
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "position")
    }
}
