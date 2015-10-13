//
//  SearchViewController.swift
//  Tumblr
//
//  Created by Connor McSheffrey on 10/10/15.
//  Copyright © 2015 Connor McSheffrey. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    
    @IBOutlet weak var loadingImageView: UIImageView!
    
    @IBOutlet weak var searchScrollView: UIScrollView!
    
    @IBOutlet weak var searchFeedImageView: UIImageView!
    
    
    var loading_1: UIImage!
    var loading_2: UIImage!
    var loading_3: UIImage!
    
    var images: [UIImage]!
    
    var animatedImage: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchScrollView.alpha = 0
        
        UIView.animateWithDuration(0.4, delay: 1, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                self.searchScrollView.alpha = 1
                self.loadingImageView.alpha = 0
            }, completion: nil)
        
        searchScrollView.contentSize = searchFeedImageView.image!.size
        
        loading_1 = UIImage(named: "loading-1")
        loading_2 = UIImage(named: "loading-2")
        loading_3 = UIImage(named: "loading-3")
        
        images = [loading_1, loading_2, loading_3]
        
        animatedImage = UIImage.animatedImageWithImages(images, duration: 0.6)
        
        loadingImageView.image = animatedImage

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
