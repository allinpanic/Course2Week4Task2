//
//  CATransitionController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class CATransitionController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!

    @IBAction func swipeHandler(_ sender: UISwipeGestureRecognizer) {
      if sender.state == .ended {
        performMovingTransition()
        
        Timer.scheduledTimer(timeInterval: 1.0,
                             target: self,
                             selector: #selector(performColorTransition),
                             userInfo: nil,
                             repeats: false)
      }
    }

  func performMovingTransition() {
    let movingTransition = CATransition()
    movingTransition.duration = 1.0
    movingTransition.type = .moveIn
    movingTransition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
    textLabel.textColor = UIColor.green
    textLabel.text = "Sliding!"
    textLabel.layer.add(movingTransition, forKey: "label text")
  }
  
@objc  func performColorTransition() {
    let transitionInColor = CATransition()
    transitionInColor.duration = 1.0
    transitionInColor.type = .fade
    transitionInColor.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
    textLabel.layer.add(transitionInColor, forKey: "color change")
    textLabel.textColor = UIColor.orange
    textLabel.text = "Initial text"
  }
}
