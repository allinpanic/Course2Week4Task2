//
//  UIViewAnimationController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class UIViewAnimationController: UIViewController {
    
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var flipButton: UIButton!
  
  @IBAction func animationViewTapHandler(sender: UITapGestureRecognizer) {
    UIView.animate(withDuration: 1.0,
                   delay: 0.5,
                   options: [.curveEaseInOut],
                   animations: {
                    self.animationView.center.x = self.view.bounds.maxX - (self.animationView.frame.size.width / 2)
                    self.animationView.transform = .init(rotationAngle: .pi)
    })
  }
    
  @IBAction func flipButtonTapHandler(sender: UIButton) {
    UIView.animate(withDuration: 1.0,
                   delay: 0,
                   options: [.curveEaseInOut],
                   animations: {
                    self.view.transform = self.view.transform.rotated(by: .pi)
                    sender.transform = sender.transform.rotated(by: .pi)
      })
    }
}
