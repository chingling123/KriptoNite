//
//  KryptoView.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 12/02/2022.
//

import UIKit

class KryptoView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    func drawKrypto(color: UIColor) {
        let heightWidth = frame.size.width
        let height = frame.size.height
        let wOffSet = heightWidth / 5
        let hOffSet = height / 10
        var variableHeight = height / 3

        let pathLine = CGMutablePath()
        let path = CGMutablePath()
        pathLine.move(to: CGPoint(x: 0, y: variableHeight))
        path.move(to: CGPoint(x: heightWidth/2, y: 0))
        path.addLine(to: CGPoint(x: heightWidth, y: variableHeight))
        path.addLine(to: CGPoint(x: heightWidth/2, y: height))
        path.addLine(to: CGPoint(x: heightWidth - (heightWidth), y: variableHeight))
        path.closeSubpath()

        let shape = CAShapeLayer()
        shape.path = path
        shape.fillColor = color.withAlphaComponent(0.7).cgColor
        shape.strokeColor = color.withAlphaComponent(0.5).cgColor
        shape.borderWidth = 1
        layer.addSublayer(shape)
        variableHeight = variableHeight + hOffSet

        let pathB = CGMutablePath()
        pathLine.addLine(to: CGPoint(x: heightWidth - (heightWidth - wOffSet), y: variableHeight))
        pathB.move(to: CGPoint(x: heightWidth/2, y: 0))
        pathB.addLine(to: CGPoint(x: (heightWidth - wOffSet), y: variableHeight))
        pathB.addLine(to: CGPoint(x: heightWidth/2, y: height))
        pathB.addLine(to: CGPoint(x: heightWidth - (heightWidth - wOffSet), y: variableHeight))
        pathB.closeSubpath()
        pathLine.addLine(to: CGPoint(x: heightWidth - wOffSet, y: variableHeight))
        pathLine.addLine(to: CGPoint(x: heightWidth, y: variableHeight - hOffSet))

        let shapeB = CAShapeLayer()
        shapeB.path = pathB
        shapeB.fillColor = color.withAlphaComponent(0.7).cgColor
        shapeB.strokeColor = color.withAlphaComponent(0.5).cgColor
        shapeB.borderWidth = 1

        let shapeBkg = CAShapeLayer()
        shapeBkg.path = pathB
        shapeBkg.fillColor = UIColor.white.withAlphaComponent(0.3).cgColor
        layer.addSublayer(shapeBkg)
        layer.addSublayer(shapeB)

        let shapeLine = CAShapeLayer()
        shapeLine.path = pathLine
        shapeLine.fillColor = UIColor.clear.cgColor
        shapeLine.strokeColor = color.withAlphaComponent(0.5).cgColor
        shapeLine.borderWidth = 1
        layer.addSublayer(shapeLine)
    }
}
