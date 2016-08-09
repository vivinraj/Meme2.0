//
//  CollectionViewController.swift
//  MemeRaj
//
//  Created by vivin raj on 05/08/16.
//  Copyright © 2016 Vivin Raj. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewController: UICollectionViewController {
    
    var memes = (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    
    
    override func viewWillAppear(animated: Bool) {
        memes = (UIApplication.sharedApplication().delegate as! AppDelegate).memes
        print("Meme count in view will appear: \(memes.count)")
        self.collectionView?.reloadData()
    }
   
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print("CollectionView Count: \(memes.count)")
        return memes.count
    }
    
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        print("Collection View Cell for index path called")
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("memeCollectionCell", forIndexPath: indexPath) as! CollectionViewCell
        let meme = memes[indexPath.item]
        print("Meme from Collection view: \(meme)")
      //  cell.setText(meme.top, bottomString: meme.bottom)
        let imageView = UIImageView(image: meme.memedImage)
        cell.backgroundView = imageView
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let detailViewController = storyboard!.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        detailViewController.meme = memes[indexPath.row]
        //navigationController!.pushViewController(detailViewController, animated: true)
        presentViewController(detailViewController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func addButton(sender: AnyObject) {
        
        var controller: ViewController
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("MemeViewController") as! ViewController
        self.presentViewController(controller, animated: true, completion: nil)
        
    }
    
}
