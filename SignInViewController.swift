//
//  SignInViewController.swift
//  Carousel
//
//  Created by Stephanie Parrott on 9/23/15.
//  Copyright © 2015 Stephanie Parrott. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var signInGroup: UIView!
    @IBOutlet weak var formGroup: UIView!
    
    @IBOutlet weak var signIn: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var initialY: CGFloat!
    var initialYIn: CGFloat!
    let offset: CGFloat = -90
    let signInOffset: CGFloat = -250
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        initialY = formGroup.frame.origin.y
        initialYIn = signInGroup.frame.origin.y
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressSignin(sender: AnyObject) {
        
         // if email is blank
        if emailField.text == "" && passwordField.text?.characters.count > 0 {
        let alertController = UIAlertController(title: "Missing Email", message: "Oops! Don't forget to enter your email.", preferredStyle: .Alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) -> Void in
        }
            
        alertController.addAction(OKAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
        }
        
        // if password is blank
        if passwordField.text == "" && emailField.text?.characters.count > 0 {
            let alertController = UIAlertController(title: "Missing Password", message: "Oops! Don't forget to enter your password.", preferredStyle: .Alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) -> Void in
            }
            alertController.addAction(OKAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
        // if email and password are blank
        if passwordField.text == "" && emailField.text == "" {
            let alertController = UIAlertController(title: "Missing Email & Password", message: "Oops! Don't forget to enter your email and password.", preferredStyle: .Alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) -> Void in
            }
            
            alertController.addAction(OKAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
        // if email and password are correct
        if emailField.text == "tim@thecodepath.com" && passwordField.text == "password" {
                let alertController = UIAlertController(title: "", message: "Signing in...", preferredStyle: .Alert)
                
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) -> Void in
            }
            
                self.presentViewController(alertController, animated: true, completion: nil)

            
            func delay(delay:Double, closure:()->()) {
                dispatch_after(
                    dispatch_time(
                        DISPATCH_TIME_NOW,
                        Int64(delay * Double(NSEC_PER_SEC))
                    ),
                    dispatch_get_main_queue(), closure)
                    }
            // Delay for 2 seconds, then run the code between the braces.
            
            delay(2) {
                alertController.dismissViewControllerAnimated(false, completion: nil)
                self.performSegueWithIdentifier("loginSegue", sender: nil)
                
            }
        }
        
        
        if emailField.text == "tim@thecodepath.com" && passwordField.text != "password" && passwordField.text?.characters.count > 0  {
            let alertController = UIAlertController(title: "", message: "Signing in...", preferredStyle: .Alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) -> Void in
            }
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
            
            func delay(delay:Double, closure:()->()) {
                dispatch_after(
                    dispatch_time(
                        DISPATCH_TIME_NOW,
                        Int64(delay * Double(NSEC_PER_SEC))
                    ),
                    dispatch_get_main_queue(), closure)
            }
            // Delay for 2 seconds, then run the code between the braces.
            
            delay(2) {
                alertController.dismissViewControllerAnimated(true, completion: nil)
                
                let alertController = UIAlertController(title: "Sign In Failed", message: "Incorrect email or password.", preferredStyle: .Alert)
                
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) -> Void in
                }
                
                alertController.addAction(OKAction)
                
                self.presentViewController(alertController, animated: true, completion: nil)
            }
            
        }
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
            
            self.formGroup.frame.origin = CGPoint(x: self.formGroup.frame.origin.x, y: self.initialY)
            
            self.signInGroup.frame.origin = CGPoint(x: self.signInGroup.frame.origin.x, y: self.initialYIn)
            
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
            
            self.signInGroup.frame.origin = CGPoint(x: self.signInGroup.frame.origin.x, y: self.initialYIn + self.signInOffset)
            
            }, completion: nil)
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        formGroup.endEditing(true)
        signInGroup.endEditing(true)
    }
    
    @IBAction func backButton(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    
}
