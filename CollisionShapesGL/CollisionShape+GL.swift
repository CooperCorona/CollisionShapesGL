//
//  CollisionShape+GL.swift
//  CollisionShapesGL
//
//  Created by Cooper Knaak on 9/8/16.
//  Copyright © 2016 Cooper Knaak. All rights reserved.
//

#if os(iOS)
import UIKit
#else
import Cocoa
#endif
import CoronaConvenience
import CollisionShapes
import CoronaGL

extension CollisionShape {
    
    public func generateSprite() -> GLSSprite {
        let sprite = GLSSprite(size: self.contentSize, texture: "White Tile")
        sprite.transform = self.transform
        if self.points.count > 0 {
            let center = self.points.reduce(CGPoint.zero) { $0 + $1 } / CGFloat(self.points.count)
            var vertices:[UVertex] = []
            var centerVertex = UVertex()
            centerVertex.position = center.getGLTuple()
            for (i, point) in self.points.enumerateSkipLast() {
                var v1 = UVertex()
                var v2 = UVertex()
                v1.position = point.getGLTuple()
                v2.position = self.points[i + 1].getGLTuple()
                vertices += [centerVertex, v1, v2]
            }
            var v1 = UVertex()
            var v2 = UVertex()
            if let v1pos = self.points.last?.getGLTuple() {
                v1.position = v1pos
            }
            if let v2pos = self.points.first?.getGLTuple() {
                v2.position = v2pos
            }
            vertices += [centerVertex, v1, v2]
            sprite.vertices = vertices
        }
        for child in self.children {
            let childSprite = child.generateSprite()
            sprite.addChild(childSprite)
        }
        return sprite
    }
    
}
