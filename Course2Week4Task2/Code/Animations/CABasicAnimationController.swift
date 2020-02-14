//
//  ViewController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class CABasicAnimationController: UIViewController {
  
  @IBOutlet weak var orangeView: UIView!
  @IBOutlet weak var cyanView: UIView!
  @IBOutlet weak var blueView: UIView!
  @IBOutlet weak var greenView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let tapOnOrangeViewGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapOnOrangeView(gesture:)))
    let tapOnCyanViewRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapOnCyanView(gesture:)))
    let tapOnBlueViewRecognizer = UITapGestureRecognizer(target: self, action: #selector(hadleTapOnBlueView(gesture:)))
    let tapOnGreeViewRecognizer = UITapGestureRecognizer(target: self, action: #selector(hadleTapOnGreenView(gesture:)))
    
    orangeView.addGestureRecognizer(tapOnOrangeViewGestureRecognizer)
    cyanView.addGestureRecognizer(tapOnCyanViewRecognizer)
    blueView.addGestureRecognizer(tapOnBlueViewRecognizer)
    greenView.addGestureRecognizer(tapOnGreeViewRecognizer)
  }
  
  @objc func handleTapOnOrangeView(gesture: UITapGestureRecognizer) {
    let orangeCircle = orangeView.frame.height / 2
    let animation = CABasicAnimation(keyPath: #keyPath(CALayer.cornerRadius))
    animation.duration = 1.0
    animation.fromValue = orangeView.layer.cornerRadius
    animation.toValue = orangeCircle
    animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
    orangeView.layer.add(animation, forKey: "into circle")
    orangeView.layer.cornerRadius = orangeCircle
  }
  
  @objc func handleTapOnCyanView(gesture: UITapGestureRecognizer) {
    let cyanAlpha: Float = 0.0
    let animation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
    animation.duration = 1.0
    animation.fromValue = cyanView.layer.opacity
    animation.toValue = cyanAlpha
    animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
    cyanView.layer.add(animation, forKey: "opacity")
    cyanView.layer.opacity = cyanAlpha
  }
  
  @objc func hadleTapOnBlueView(gesture: UITapGestureRecognizer) {
    let centerX = cyanView.center.x
    let positionAnimation = CABasicAnimation(keyPath: "position.x")
    positionAnimation.fromValue = blueView.center.x
    positionAnimation.toValue = centerX
    let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
    rotationAnimation.fromValue = 0
    rotationAnimation.toValue = CGFloat(315.0 * .pi / 180.0)
    
    let groupAnimation = CAAnimationGroup()
    groupAnimation.animations = [positionAnimation, rotationAnimation]
    groupAnimation.duration = 2.0
    groupAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    blueView.layer.add(groupAnimation, forKey: "groupAnimation")
    blueView.center.x = centerX
    blueView.transform = .init(rotationAngle: CGFloat(315.0 * .pi / 180.0))
  }
  
  @objc func hadleTapOnGreenView(gesture: UITapGestureRecognizer) {
    let center = view.center
    let positionAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.position))
    positionAnimation.fromValue = greenView.center
    positionAnimation.toValue = center
    
    let color = UIColor.magenta
    let colorAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.backgroundColor))
    colorAnimation.fromValue = greenView.backgroundColor
    colorAnimation.toValue = color.cgColor
    
    let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
    scaleAnimation.fromValue = 1
    scaleAnimation.toValue = 1.5
    
    let groupAnimation = CAAnimationGroup()
    groupAnimation.animations = [positionAnimation, colorAnimation, scaleAnimation]
    groupAnimation.duration = 1.0
    groupAnimation.repeatCount = 2
    groupAnimation.autoreverses = true
    groupAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    greenView.layer.add(groupAnimation, forKey: "group animation")
    
  }
}
