//
//  MemeDetailViewController.swift
//  MemeRaj
//
//  Created by vivin raj on 07/08/16.
//  Copyright © 2016 Vivin Raj. All rights reserved.
//

import Foundation

import UIKit

class MemeDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    
    var meme: AppDelegate.Meme!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = meme.memedImage
    }
    
    @IBAction func cancelButton(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}
