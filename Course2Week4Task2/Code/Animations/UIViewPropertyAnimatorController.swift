//
//  UIViewPropertyAnimatorController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class UIViewPropertyAnimatorController: UIViewController {
    
  @IBOutlet weak var animationView: UIView!
  private var animator: UIViewPropertyAnimator!
  
  @IBAction func panGestureHandler(recognizer: UIPanGestureRecognizer) {
    switch recognizer.state {
    case .began:
      animator = UIViewPropertyAnimator(duration: 1.0,
       timingParameters: UISpringTimingParameters(mass: 2.0,
                                                  stiffness: 30.0,
                                                  damping: 7.0,
                                                  initialVelocity: .zero))
      animator.addAnimations {
        self.animationView.center.x += 300
        let scaling = self.animationView.transform.scaledBy(x: 1.5, y: 1.5)
        let rotation = CGAffineTransform(rotationAngle: .pi)
        self.animationView.transform = scaling.concatenating(rotation)
      }
    case .changed:
      animator.fractionComplete = recognizer.translation(in: view).x / view.bounds.size.width
    case .ended:
      let currentCenter = self.animationView.layer.presentation()!.frame.midX
      if currentCenter < self.view.frame.midX  {
        self.animator.isReversed = true
      }
      animator.startAnimation()
    default:
      ()
    }
  }
}
