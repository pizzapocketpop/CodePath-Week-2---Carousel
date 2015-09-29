//
//  TimeViewController.swift
//  Carousel
//
//  Created by Stephanie Parrott on 9/26/15.
//  Copyright © 2015 Stephanie Parrott. All rights reserved.
//

import UIKit

class TimeViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var learnMore: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        scrollView.contentSize = imageView.image!.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeTapped(sender: AnyObject) {

        
        //imageView.frame = CGRect(x: 0, y: -43, width: 320, height: 1521)
        
        self.learnMore.alpha = 1
        
        UIView.animateWithDuration(0.3, animations: {
            // This causes first view to fade in and second view to fade out
            self.learnMore.alpha = 0
        })
        
        var frm: CGRect = imageView.frame
        frm.origin.x = frm.origin.x
        frm.origin.y = frm.origin.y
        frm.size.width = frm.size.width
        frm.size.height = frm.size.height
        imageView.frame = frm
        
        
        UIView.animateWithDuration(0.3, animations: {
            // This causes first view to fade in and second view to fade out
            frm.origin.x = frm.origin.x
            frm.origin.y = frm.origin.y - 43
            frm.size.width = frm.size.width
            frm.size.height = frm.size.height - 43
            self.imageView.frame = frm
            
        })
        
        
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
