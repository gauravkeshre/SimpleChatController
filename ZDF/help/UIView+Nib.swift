//
//  UIView+Nib.swift
//  GK
//
//  Created by Gaurav Keshre on 02/12/16.
//  Copyright © 2017 GK. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    public class func fromNib(nibNameOrNil: String? = nil) -> Self {
        return fromNib(nibNameOrNil: nibNameOrNil, type: self)
    }
    
    public class func fromNib<T : UIView>(nibNameOrNil: String? = nil, type: T.Type, owner: Any? = nil) -> T {
        let v: T? = fromNib(nibNameOrNil: nibNameOrNil, type: type, owner: owner)
        return v!
    }
    
    public class func fromNib<T : UIView>(nibNameOrNil: String? = nil, type: T.Type, owner: Any? = nil) -> T? {
        var view: T?
        let name: String
        if let nibName = nibNameOrNil {
            name = nibName
        } else {
            // Most nibs are demangled by practice, if not, just declare string explicitly
            name = nibName
        }
        guard let nibViews = Bundle.main.loadNibNamed(name, owner: owner, options: nil) else{
            return nil
        }
        for v in nibViews{
            if let tog = v as? T {
                view = tog
            }
        }
        return view
    }
    
    public class var nibName: String {
        let name = "\(self)".components(separatedBy: ".").first ?? ""
        return name
    }
    public class var nib: UINib? {
        if let _ = Bundle.main.path(forResource: nibName, ofType: "nib") {
            return UINib(nibName: nibName, bundle: nil)
        } else {
            return nil
        }
    }
}



extension UIView{
    
    /// Adds constraints to pin the subview to top, left, bottom and right of the superview. Also adds the subview to superview
    /// - Parameter view: The subview
    /// - Parameter padding: Default is -8. Minimum value can be -8
    func addPinnedSubview(_ view: UIView, padding: CGFloat = -8){
        self.addSubview(view)
        
        let m_padding = (padding  < -8) ? -8 : padding
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let margins = self.layoutMarginsGuide
        
        view.topAnchor.constraint(equalTo: margins.topAnchor,
                                  constant: m_padding).isActive = true
        
        
        view.leftAnchor.constraint(equalTo: margins.leftAnchor,
                                   constant: m_padding).isActive = true
        
        
        view.bottomAnchor.constraint(equalTo: margins.bottomAnchor,
                                     constant: (-1 * m_padding)).isActive = true
        
        
        view.rightAnchor.constraint(equalTo: margins.rightAnchor,
                                    constant: (-1 * m_padding)).isActive = true
        
    }
    
    func dashedLine(add:Bool = true , color: UIColor = UIColor.lightGray) {
        layer.sublayers?.filter({ $0.name == "DashedTopLine" }).forEach({ $0.removeFromSuperlayer() })
        self.backgroundColor = UIColor.lightGray
        if add {
            self.backgroundColor = UIColor.clear
            let cgColor = color.cgColor
            
            let shapeLayer: CAShapeLayer = CAShapeLayer()
            let frameSize = self.frame.size
            let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
            
            shapeLayer.name = "DashedTopLine"
            shapeLayer.bounds = shapeRect
            shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height / 2)
            shapeLayer.fillColor = UIColor.clear.cgColor
            shapeLayer.strokeColor = cgColor
            shapeLayer.lineWidth = 1
            shapeLayer.lineJoin = kCALineJoinRound
            shapeLayer.lineDashPattern = [4, 4]
            
            let path = CGMutablePath()
           // path.move(to: CGPoint.zero)
            path.addLines(between: [CGPoint.zero,
                                    CGPoint(x: UIScreen.main.bounds.size.width - 40, y: 0)])
           // path.addLine(to: CGPoint(x: frameSize.width, y: 0))
            shapeLayer.path = path
            
            self.layer.addSublayer(shapeLayer)
        }else{
            
        }
    }
}
