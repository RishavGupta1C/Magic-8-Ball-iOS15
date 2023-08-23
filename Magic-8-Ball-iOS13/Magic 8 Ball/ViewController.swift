//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOUTLETS & IBACTION
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var askMeLabel: UILabel!
    @IBOutlet weak var magicBallImageView: UIImageView!
    @IBOutlet weak var askBtn: UIButton!
    
    @IBAction func askBtnAction(_ sender: Any) {
        self.magicBallImageView.image = self.ballArray.randomElement()
    }
    
    // MARK: - GLOBAL VARIABLES
    let ballArray = [#imageLiteral(resourceName: "ball1.png"),#imageLiteral(resourceName: "ball2.png"),#imageLiteral(resourceName: "ball3.png"),#imageLiteral(resourceName: "ball4.png"),#imageLiteral(resourceName: "ball5.png")]
    
    override func viewDidLoad() {
        self.mainView.addGradientColoredBackground(colors: [UIColor(hex: "#FE6500").cgColor, UIColor(hex: "#FEAA5C").cgColor, UIColor(hex: "#FED64A").cgColor])
        self.askBtn.layer.cornerRadius = 10
        self.magicBallImageView.image = self.ballArray[0]
        self.magicBallImageView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.magicBallImageView.layer.shadowOffset = CGSize(width: 0.5, height: 20)
        self.magicBallImageView.layer.shadowRadius = 10
        self.magicBallImageView.layer.shadowOpacity = 0.75
        self.askBtn.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.askBtn.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.askBtn.layer.shadowRadius = 6
        self.askBtn.layer.shadowOpacity = 0.5
        self.askMeLabel.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.askMeLabel.layer.shadowOffset = CGSize(width: 0, height: 6)
        self.askMeLabel.layer.shadowRadius = 7
        self.askMeLabel.layer.shadowOpacity = 0.7
    }

}


extension UIView {
    func addGradientColoredBackground(colors: [CGColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.cornerRadius = layer.cornerRadius
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

extension UIColor {
    convenience init(hex: String) {
        self.init(hex: hex, alpha: 1)
    }
    
    convenience init(hex: String, alpha: CGFloat) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
