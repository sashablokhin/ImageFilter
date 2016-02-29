//
//  ViewController.swift
//  ImageFilter
//
//  Created by Alexander Blokhin on 29.02.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

import UIKit
import CoreImage

class ViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let image = imageView?.image, cgimg = image.CGImage else {
            print("imageView doesn't have an image!")
            return
        }
        
        let coreImage = CIImage(CGImage: cgimg)
        
        let filter = CIFilter(name: "CISepiaTone")
        filter?.setValue(coreImage, forKey: kCIInputImageKey)
        filter?.setValue(0.5, forKey: kCIInputIntensityKey)
        
        if let output = filter?.valueForKey(kCIOutputImageKey) as? CIImage {
            let filteredImage = UIImage(CIImage: output)
            imageView?.image = filteredImage
        }
            
        else {
            print("image filtering failed")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

