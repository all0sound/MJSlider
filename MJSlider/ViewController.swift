//
//  ViewController.swift
//  MJSlider
//
//  Created by Martin Jaroszewicz on 11/17/17.
//  Copyright © 2017 martinjaroszewicz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: MJSlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // get image for background
        let image = UIImage(named: "stone.jpg")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill;
        imageView.frame = self.view.bounds
        view.insertSubview(imageView, at: 0)
        // blur the background
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.insertSubview(blurEffectView, at: 1)
        // add a slider
        slider.backgroundColor = UIColor.black
        slider.tintColor = UIColor.white
        slider.cornerRadius = 50
        slider.value = 0.25
        slider.transparency = 0.5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func sliderAction(_ sender: MJSlider) {
      print(sender.value)
    }
    

}

