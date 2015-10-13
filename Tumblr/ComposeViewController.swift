//
//  ComposeViewController.swift
//  Tumblr
//
//  Created by Connor McSheffrey on 10/10/15.
//  Copyright © 2015 Connor McSheffrey. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    var isPresenting: Bool = true
    
    @IBOutlet weak var textButton: UIButton!
    
    @IBOutlet weak var photoButton: UIButton!
    
    @IBOutlet weak var quoteButton: UIButton!
    
    @IBOutlet weak var linkButton: UIButton!
    
    @IBOutlet weak var chatButton: UIButton!
    
    @IBOutlet weak var videoButton: UIButton!
    
    var textButtonCoords: CGPoint!
    var photoButtonCoords: CGPoint!
    var quoteButtonCoords: CGPoint!
    var linkButtonCoords: CGPoint!
    var chatButtonCoords: CGPoint!
    var videoButtonCoords: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()

       textButtonCoords = textButton.center
       photoButtonCoords = photoButton.center
       quoteButtonCoords = quoteButton.center
       linkButtonCoords = linkButton.center
       chatButtonCoords = chatButton.center
       videoButtonCoords = videoButton.center
        
        
        textButton.center = CGPoint(x: textButtonCoords.x, y: textButtonCoords.y + 600)
        photoButton.center = CGPoint(x: photoButtonCoords.x, y: photoButtonCoords.y + 600)
        quoteButton.center = CGPoint(x: quoteButtonCoords.x, y: quoteButtonCoords.y + 600)
        linkButton.center = CGPoint(x: linkButtonCoords.x, y: linkButtonCoords.y + 600)
        chatButton.center = CGPoint(x: chatButtonCoords.x, y: chatButtonCoords.y + 600)
        videoButton.center = CGPoint(x: videoButtonCoords.x, y: videoButtonCoords.y + 600)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
        
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        modalPresentationStyle = UIModalPresentationStyle.Custom
        transitioningDelegate = self
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        print("animating transition")
        let containerView = transitionContext.containerView()
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView!.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
            
            UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 10.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: ({
                self.textButton.center = CGPoint(x: self.textButtonCoords.x, y: self.textButtonCoords.y)
            }), completion: nil)
            
            UIView.animateWithDuration(1.0, delay: 0.6, usingSpringWithDamping: 0.9, initialSpringVelocity: 10.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: ({
                self.photoButton.center = CGPoint(x: self.photoButtonCoords.x, y: self.photoButtonCoords.y)
            }), completion: nil)
            
            UIView.animateWithDuration(1.0, delay: 0.2, usingSpringWithDamping: 0.9, initialSpringVelocity: 10.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: ({
                self.quoteButton.center = CGPoint(x: self.quoteButtonCoords.x, y: self.quoteButtonCoords.y)
            }), completion: nil)
            
            UIView.animateWithDuration(1.0, delay: 0.4, usingSpringWithDamping: 0.9, initialSpringVelocity: 10.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: ({
                self.linkButton.center = CGPoint(x: self.linkButtonCoords.x, y: self.linkButtonCoords.y)
            }), completion: nil)
            
            UIView.animateWithDuration(1.0, delay: 0.8, usingSpringWithDamping: 0.9, initialSpringVelocity: 10.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: ({
                self.chatButton.center = CGPoint(x: self.chatButtonCoords.x, y: self.chatButtonCoords.y)
            }), completion: nil)
            
            UIView.animateWithDuration(1.0, delay: 0.6, usingSpringWithDamping: 0.9, initialSpringVelocity: 10.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: ({
                self.videoButton.center = CGPoint(x: self.videoButtonCoords.x, y: self.videoButtonCoords.y)
            }), completion: nil)
        } else {
            UIView.animateWithDuration(0.8, animations: { () -> Void in
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
            
            UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: ({
                self.textButton.center = CGPoint(x: self.textButtonCoords.x, y: self.textButtonCoords.y - 500)
            }), completion: nil)
            
            UIView.animateWithDuration(1.0, delay: 0.2, usingSpringWithDamping: 0.9, initialSpringVelocity: 10.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: ({
                self.photoButton.center = CGPoint(x: self.photoButtonCoords.x, y: self.photoButtonCoords.y - 500)
            }), completion: nil)
            
            UIView.animateWithDuration(1.0, delay: 0.1, usingSpringWithDamping: 0.9, initialSpringVelocity: 10.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: ({
                self.quoteButton.center = CGPoint(x: self.quoteButtonCoords.x, y: self.quoteButtonCoords.y - 500)
            }), completion: nil)
            
            UIView.animateWithDuration(1.0, delay: 0.2, usingSpringWithDamping: 0.9, initialSpringVelocity: 10.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: ({
                self.linkButton.center = CGPoint(x: self.linkButtonCoords.x, y: self.linkButtonCoords.y - 500)
            }), completion: nil)
            
            UIView.animateWithDuration(1.0, delay: 0.3, usingSpringWithDamping: 0.9, initialSpringVelocity: 10.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: ({
                self.chatButton.center = CGPoint(x: self.chatButtonCoords.x, y: self.chatButtonCoords.y - 500)
            }), completion: nil)
            
            UIView.animateWithDuration(1.0, delay: 0.4, usingSpringWithDamping: 0.9, initialSpringVelocity: 10.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: ({
                self.videoButton.center = CGPoint(x: self.videoButtonCoords.x, y: self.videoButtonCoords.y - 500)
            }), completion: nil)
        }
    }
    
    @IBAction func onTapDismiss(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
