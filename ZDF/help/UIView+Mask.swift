//
//  UIView+Mask.swift
//  GK
//
//  Created by Gaurav Keshre on 26/05/17.
//  Copyright © 2017 GK. All rights reserved.
//

import Foundation
import UIKit

/** Layer Names */
fileprivate struct MaskIdentifiers{
    static let RingLayer = "RingLayer"
    static let TranslucentMaskLayer = "TranslucentMask"
    static let InternalWhiteBorderLayer = "InternalWhiteSpaceBorder"
    static let TranslucentMaskViewTag = 109012
}

/** CALayers Masks And Borders*/
extension UIView{
    //MARK:- Layer Mask Methods
    //--------------------------
    /**
     Adds a `CALayer` as sublayer on receiving UIView's layer object object. Adds the translucency to passed in color parameter. This method first removes any existing mask before adding a new one.
     - Important: The receiver CAN still receive touches when the mask is ON.
     - Parameter: alpha - defaults to `0.5`
     - Parameter: color - defaults to `.red`
     */
    func addMaskLayer(alpha: CGFloat = 0.9, color: UIColor = .red){
        removeMaskLayer()
        let mLayer = CALayer()
        mLayer.name = MaskIdentifiers.TranslucentMaskLayer
        mLayer.frame = self.bounds
        mLayer.backgroundColor = color.withAlphaComponent(alpha).cgColor
        self.layer.addSublayer(mLayer)
    }
    func removeMaskLayer(){
        self.layer.removeSubLayers(names: MaskIdentifiers.TranslucentMaskLayer)
    }
    
    //MARK:- Border Methods
    //--------------------------
    func addBorder(width: CGFloat = 1, color: UIColor = .green, colorInGap: UIColor = .white){
        removeBorder()
        
        let emptySpaceLineWidth = width * 2
        ///Paths
        let cornerRadius = max(0, layer.cornerRadius - emptySpaceLineWidth ) /// should not be less than `0`
        let rect: CGRect
        if bounds.size == .zero{
            /** When either of the prperty is `.zero`, the calculated  */
            rect = .zero
        }else{
            rect = bounds.insetBy(dx: emptySpaceLineWidth, dy: emptySpaceLineWidth)
            let internalPath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
            ///Layers
            let internalWhiteSpaceLayer = CAShapeLayer()
            internalWhiteSpaceLayer.name = MaskIdentifiers.InternalWhiteBorderLayer
            internalWhiteSpaceLayer.fillColor = UIColor.clear.cgColor
            internalWhiteSpaceLayer.strokeColor = colorInGap.cgColor
            internalWhiteSpaceLayer.lineWidth = emptySpaceLineWidth
            internalWhiteSpaceLayer.lineJoin = kCALineJoinRound
            internalWhiteSpaceLayer.path = internalPath.cgPath
            self.layer.addSublayer(internalWhiteSpaceLayer)
        }
                ///Actual Border
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
   
    func addRing(distanceFromEdge: CGFloat, width: CGFloat = 1, color: UIColor = .black){
        removeRing()
        let rect = self.bounds.insetBy(dx: distanceFromEdge, dy: distanceFromEdge)
        let ringPath = UIBezierPath(roundedRect: rect, cornerRadius: self.layer.cornerRadius)
        let ringLayer = CAShapeLayer()
        ringLayer.name = MaskIdentifiers.RingLayer
        ringLayer.fillColor = UIColor.clear.cgColor
        ringLayer.strokeColor = color.cgColor
        ringLayer.lineWidth = width
        ringLayer.path = ringPath.cgPath
        self.layer.addSublayer(ringLayer)
    }
    func updateRingLayer(){
        
    }
    func removeRing(){
        self.layer.borderWidth = 0
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.removeSubLayers(names: MaskIdentifiers.RingLayer)
    }
    func removeBorder(){
        self.layer.borderWidth = 0
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.removeSubLayers(names: MaskIdentifiers.InternalWhiteBorderLayer)
    }
}

/** UIView Masks*/
extension UIView{
    //MARK:- View Mask Methods
    //--------------------------
    /**
     Adds a `UIView` as subview on receiver object. Adds the translucency to passed in color parameter. This method first removes any existing mask before adding a new one.
     - Important: The receiver cannot receive touches when the mask is ON
     - Parameter: alpha - defaults to `0.5`
     - Parameter: color - defaults to `.red`
     */
    func addMaskView(alpha: CGFloat = 0.5, color: UIColor = .red, insetBy: CGFloat = 0) -> UIView{
        removeMaskView()
        let v = UIView(frame: self.bounds.insetBy(dx: insetBy, dy: insetBy))
        v.backgroundColor = color.withAlphaComponent(alpha)
        v.layer.cornerRadius = self.layer.cornerRadius
        v.tag = MaskIdentifiers.TranslucentMaskViewTag
        v.clipsToBounds = true
        self.addSubview(v)
        return v
    }
    func removeMaskView(){
        guard let v = self.viewWithTag(MaskIdentifiers.TranslucentMaskViewTag) else { return }
        v.removeFromSuperview()
    }
}

extension CALayer {
    /**
     A handly helper method to remove `sublayers` by name from a `CALayer` object
     - important: Loop through all sublayers and check if any of has same name as one of the `names`.
     - Parameter: names - `varags` of String type
     */
    func removeSubLayers(names: String...) {
        guard let mLayers = self.sublayers?.filter({ (sLayer) -> Bool in
            var flag = false
            for name in names{
                flag = flag || (sLayer.name == name)
                ///break the loop as we have found that the flag is true and we dont need to check further.
                if flag{ break }
            }
            return flag
        }), mLayers.count > 0 else{
            print("no layers found")
            return
        }
        /** Loop through all filte and check if any of has same name as one of the `names`. */
        mLayers.forEach{$0.removeFromSuperlayer()}
    }
}
