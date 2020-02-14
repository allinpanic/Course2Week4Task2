//
//  UIKitDynamicController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class UIKitDynamicController: UIViewController {
    
  @IBOutlet weak var anchorView: UIView!
  @IBOutlet weak var animationView: UIView!
  
  var dynamicAnimator: UIDynamicAnimator!
  lazy var gravity = UIGravityBehavior(items: [animationView])
  lazy var attachment = UIAttachmentBehavior.init(item: animationView,
                                                  attachedToAnchor: anchorView.center)
  lazy var itemBehaviour = UIDynamicItemBehavior(items: [self.animationView])
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    dynamicAnimator = UIDynamicAnimator(referenceView: view)
    itemBehaviour.elasticity = 0.5
    attachment.attachmentRange = UIFloatRange(minimum: 100, maximum: 150)
    dynamicAnimator.addBehavior(itemBehaviour)
    dynamicAnimator.addBehavior(attachment)
    dynamicAnimator.addBehavior(gravity)
  }
  
  @IBAction func panAnchorViewHandler(recognizer: UIGestureRecognizer) {
    if recognizer.state == .changed {
      anchorView.center = recognizer.location(in: view)
      attachment.anchorPoint = anchorView.center
    }
  }
}
