//
//  Transform+GL.swift
//  CollisionShapesGL
//
//  Created by Cooper Knaak on 9/8/16.
//  Copyright © 2016 Cooper Knaak. All rights reserved.
//

import CollisionShapes
import CoronaGL

extension GLSNode {

    public var transform:Transform {
        get {
            return Transform(contentSize: self.contentSize, position: self.position, anchor: self.anchor, rotation: self.rotation, xScale: self.scaleX, yScale: self.scaleY)
        }
        set {
            self.contentSize    = newValue.contentSize
            self.position       = newValue.position
            self.anchor         = newValue.anchor
            self.rotation       = newValue.rotation
            self.scaleX         = newValue.xScale
            self.scaleY         = newValue.yScale
        }
    }

}
