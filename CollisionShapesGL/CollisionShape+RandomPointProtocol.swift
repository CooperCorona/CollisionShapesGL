//
//  CollisionShape+RandomPointProtocol.swift
//  CollisionShapesGL
//
//  Created by Cooper Knaak on 9/10/16.
//  Copyright © 2016 Cooper Knaak. All rights reserved.
//

#if os(iOS)
import UIKit
#else
import Cocoa
#endif
import CoronaConvenience
import CoronaStructures
import CollisionShapes
import CoronaGL

extension CollisionLineSegment: RandomPointProtocol {
    
    public func randomPoint() -> CGPoint {
        return linearlyInterpolate(CGFloat.random(), left: self.segment.firstPoint, right: self.segment.secondPoint)
    }
    
}

extension CollisionRectangle: RandomPointProtocol {
    
    public func randomPoint() -> CGPoint {
        return CGRect(center: self.center, size: self.contentSize).interpolate(CGPoint(x: CGFloat.random(), y: CGFloat.random()))
    }
    
}

extension CollisionEllipse: RandomPointProtocol {
    
    public func randomPoint() -> CGPoint {
        let angle = CGFloat.randomMiddle(0.0, range: 2.0 * CGFloat(M_PI))
        let edgePoint = self.pointForAngle(angle)
        return (edgePoint - self.contentSize.center) * CGFloat.random()
    }
    
}