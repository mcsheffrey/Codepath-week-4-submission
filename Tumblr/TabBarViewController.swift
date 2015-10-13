//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by Connor McSheffrey on 10/10/15.
//  Copyright © 2015 Connor McSheffrey. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet var buttons: [UIButton]!
    
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    
    var viewControllers: [UIViewController]!
    
    var selectedIndex: Int = 0
    
    @IBOutlet weak var explorePopupImageView: UIImageView!
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController")
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController")
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController")
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController")
        
        viewControllers = [homeViewController, searchViewController, accountViewController, trendingViewController]
        
        buttons[selectedIndex].selected = true
        didPressTab(buttons[selectedIndex])
        
        UIView.animateWithDuration(2.0, delay:0, options: [.Repeat, .Autoreverse], animations: {
            
            self.explorePopupImageView.center = CGPoint(x: 90, y: 480)
            
            }, completion: nil)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didPressTab(sender: AnyObject) {
        let previousIndex = selectedIndex
        
        selectedIndex = sender.tag
        
        buttons[previousIndex].selected = false
        
        let previousVC = viewControllers[previousIndex]
        
        previousVC.willMoveToParentViewController(nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        if selectedIndex == 1 {
            UIView.animateWithDuration(0.4, delay:0, options: [], animations: {
                
                self.explorePopupImageView.alpha = 0
            
            }, completion: nil)
        }
        
        
        buttons[selectedIndex].selected = true
        
        print(sender)
        
        let vc = viewControllers[selectedIndex]
        
        addChildViewController(vc)
        
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        
        vc.didMoveToParentViewController(self)
    }
    
    
    

}
