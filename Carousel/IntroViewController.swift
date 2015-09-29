//
//  IntroViewController.swift
//  Carousel
//
//  Created by Stephanie Parrott on 9/23/15.
//  Copyright © 2015 Stephanie Parrott. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

   
    @IBOutlet weak var signIn: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var tile1View: UIImageView!
    @IBOutlet weak var tile2View: UIImageView!
    @IBOutlet weak var tile3View: UIImageView!
    @IBOutlet weak var tile4View: UIImageView!
    @IBOutlet weak var tile5View: UIImageView!
    @IBOutlet weak var tile6View: UIImageView!
    
    var yOffsets : [Float] = [-285, -240, -415, -408, -480, -500]
    var xOffsets : [Float] = [-30, 75, -66, 10, -200, -15]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = imageView.image!.size
        // Do any additional setup after loading the view.
        scrollView.delegate = self
        
        scrollView.sendSubviewToBack(imageView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInPressed(sender: AnyObject) {
         performSegueWithIdentifier("firstSegue", sender: self)
    }
    
   
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let offset = CGFloat(scrollView.contentOffset.y)
        
        // content offset: 0-568
        // x offset: -30-0
        // y offset: -285-0
        
        let tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -80, r2Max: 0)
        let ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -285, r2Max: 0)
        let scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1, r2Max: 1)
        let rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        tile1View.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        tile1View.transform = CGAffineTransformScale(tile1View.transform, CGFloat(scale), CGFloat(scale))
        tile1View.transform = CGAffineTransformRotate(tile1View.transform, CGFloat(Double(rotation) * M_PI / 180))
        
        // content offset: 0->568
        // x offset: 75->0
        // y offset: -245->0
        
        let txTwo = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 30, r2Max: 0)
        let tyTwo = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -260, r2Max: 0)
        let scaleTwo = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        let rotationTwo = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        tile2View.transform = CGAffineTransformMakeTranslation(CGFloat(txTwo), CGFloat(tyTwo))
        tile2View.transform = CGAffineTransformScale(tile2View.transform, CGFloat(scaleTwo), CGFloat(scaleTwo))
        tile2View.transform = CGAffineTransformRotate(tile2View.transform, CGFloat(Double(rotationTwo) * M_PI / 180))
        
        // content offset: 0->568
        // x offset: -66->0
        // y offset: -415->0
        
        let txThree = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 5, r2Max: 0)
        let tyThree = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -415, r2Max: 0)
        let scaleThree = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.7, r2Max: 1)
        let rotationThree = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        tile3View.transform = CGAffineTransformMakeTranslation(CGFloat(txThree), CGFloat(tyThree))
        tile3View.transform = CGAffineTransformScale(tile3View.transform, CGFloat(scaleThree), CGFloat(scaleThree))
        tile3View.transform = CGAffineTransformRotate(tile3View.transform, CGFloat(Double(rotationThree) * M_PI / 180))
        
        // content offset: 0->568
        // x offset: 10->0
        // y offset: -408->0
        
        let txFour = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 70, r2Max: 0)
        let tyFour = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -408, r2Max: 0)
        let scaleFour = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.6, r2Max: 1)
        let rotationFour = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        tile4View.transform = CGAffineTransformMakeTranslation(CGFloat(txFour), CGFloat(tyFour))
        tile4View.transform = CGAffineTransformScale(tile4View.transform, CGFloat(scaleFour), CGFloat(scaleFour))
        tile4View.transform = CGAffineTransformRotate(tile4View.transform, CGFloat(Double(rotationFour) * M_PI / 180))
        
        // content offset: 0->568
        // x offset: -200->0
        // y offset: -480->0
        
        let txFive = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -105, r2Max: 0)
        let tyFive = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -495, r2Max: 0)
        let scaleFive = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.75, r2Max: 1)
        let rotationFive = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        tile5View.transform = CGAffineTransformMakeTranslation(CGFloat(txFive), CGFloat(tyFive))
        tile5View.transform = CGAffineTransformScale(tile5View.transform, CGFloat(scaleFive), CGFloat(scaleFive))
        tile5View.transform = CGAffineTransformRotate(tile5View.transform, CGFloat(Double(rotationFive) * M_PI / 180))
        
        // content offset: 0->568
        // x offset: -15->0
        // y offset: -500->0
        
        let txSix = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -100, r2Max: 0)
        let tySix = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -485, r2Max: 0)
        let scaleSix = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.6, r2Max: 1)
        let rotationSix = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        tile6View.transform = CGAffineTransformMakeTranslation(CGFloat(txSix), CGFloat(tySix))
        tile6View.transform = CGAffineTransformScale(tile6View.transform, CGFloat(scaleSix), CGFloat(scaleSix))
        tile6View.transform = CGAffineTransformRotate(tile6View.transform, CGFloat(Double(rotationSix) * M_PI / 180))
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
