//
//  KryptoView.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 12/02/2022.
//

import UIKit

class KryptoView: UIView {
    private let pathLine = CGMutablePath()
    private let path = CGMutablePath()
    private let shape = CAShapeLayer()
    private let pathB = CGMutablePath()
    private let shapeB = CAShapeLayer()
    private let shapeBkg = CAShapeLayer()
    private let shapeLine = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    func drawKrypto(color: UIColor) {
        shape.fillColor = color.withAlphaComponent(0.7).cgColor
        shape.strokeColor = color.withAlphaComponent(0.5).cgColor
        layer.addSublayer(shape)
        
        shapeB.fillColor = color.withAlphaComponent(0.7).cgColor
        shapeB.strokeColor = color.withAlphaComponent(0.5).cgColor
        shapeBkg.fillColor = UIColor.white.withAlphaComponent(0.3).cgColor
        layer.addSublayer(shapeBkg)
        layer.addSublayer(shapeB)

        shapeLine.fillColor = UIColor.clear.cgColor
        shapeLine.strokeColor = color.withAlphaComponent(0.5).cgColor
        shapeLine.borderWidth = 1
        layer.addSublayer(shapeLine)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        createDraw()
    }
    
    private func createDraw() {
        let heightWidth = frame.size.width
        let height = frame.size.height
        let wOffSet = heightWidth / 5
        let hOffSet = height / 10
        var variableHeight = height / 3

        pathLine.move(to: CGPoint(x: 0, y: variableHeight))
        path.move(to: CGPoint(x: heightWidth/2, y: 0))
        path.addLine(to: CGPoint(x: heightWidth, y: variableHeight))
        path.addLine(to: CGPoint(x: heightWidth/2, y: height))
        path.addLine(to: CGPoint(x: heightWidth - (heightWidth), y: variableHeight))
        path.closeSubpath()

        shape.path = path
        shape.borderWidth = 1
        variableHeight = variableHeight + hOffSet

        pathLine.addLine(to: CGPoint(x: heightWidth - (heightWidth - wOffSet), y: variableHeight))
        pathB.move(to: CGPoint(x: heightWidth/2, y: 0))
        pathB.addLine(to: CGPoint(x: (heightWidth - wOffSet), y: variableHeight))
        pathB.addLine(to: CGPoint(x: heightWidth/2, y: height))
        pathB.addLine(to: CGPoint(x: heightWidth - (heightWidth - wOffSet), y: variableHeight))
        pathB.closeSubpath()
        pathLine.addLine(to: CGPoint(x: heightWidth - wOffSet, y: variableHeight))
        pathLine.addLine(to: CGPoint(x: heightWidth, y: variableHeight - hOffSet))

        shapeB.path = pathB
        shapeB.borderWidth = 1

        shapeBkg.path = pathB
        shapeBkg.fillColor = UIColor.white.withAlphaComponent(0.3).cgColor

        shapeLine.path = pathLine
        shapeLine.borderWidth = 1
    }
}
