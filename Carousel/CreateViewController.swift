//
//  CreateViewController.swift
//  Carousel
//
//  Created by Stephanie Parrott on 9/26/15.
//  Copyright © 2015 Stephanie Parrott. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {

    @IBOutlet weak var formGroup: UIView!
   
    @IBOutlet weak var createButton: UIButton!
    
    var initialY: CGFloat!
    let offset: CGFloat = -100
    
    var initialYButton: CGFloat!
    let offsetButton: CGFloat = -200
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        initialY = formGroup.frame.origin.y
        initialYButton = createButton.frame.origin.y
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        _ = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        let durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        let animationDuration = durationValue.doubleValue
        let curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        let animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
            
            self.createButton.frame.origin = CGPoint(x: self.createButton.frame.origin.x, y: self.initialYButton)
            
            self.formGroup.frame.origin = CGPoint(x: self.formGroup.frame.origin.x, y: self.initialY)
            
            }, completion: nil)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        _ = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        let durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        let animationDuration = durationValue.doubleValue
        let curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        let animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
            self.formGroup.frame.origin = CGPoint(x: self.formGroup.frame.origin.x, y: self.initialY + self.offset)
            
            self.createButton.frame.origin = CGPoint(x: self.createButton.frame.origin.x, y: self.initialYButton + self.offsetButton)
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)
    }

    @IBAction func onTap(sender: AnyObject) {
        formGroup.endEditing(true)
        createButton.endEditing(true)
    }
    
    @IBAction func selectButton(sender: UIButton) {
        sender.selected = true
    }
    
    @IBAction func backButton(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    
}
