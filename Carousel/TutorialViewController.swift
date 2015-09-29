//
//  TutorialViewController.swift
//  Carousel
//
//  Created by Stephanie Parrott on 9/23/15.
//  Copyright © 2015 Stephanie Parrott. All rights reserved.
//

import UIKit



class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var takeCarouselButton: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!

    @IBOutlet weak var carouselSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        scrollView.contentSize = CGSize(width: 1280, height: 568)
        
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        let page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
    
        
        let buttonPage : CGFloat = CGFloat(round(scrollView.contentOffset.x / (scrollView.bounds.size.width + 1230)))
        
        UIView.animateWithDuration(0.5) { () -> Void in self.takeCarouselButton.alpha = CGFloat(buttonPage)}
        
      
    }

}




    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


