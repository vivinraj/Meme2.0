//
//  tableViewController.swift
//  MemeRaj
//
//  Created by vivin raj on 05/08/16.
//  Copyright © 2016 Vivin Raj. All rights reserved.
//

import Foundation
import UIKit

class tableViewController: UITableViewController {
    
 var memes = (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    
    override func viewWillAppear(animated: Bool) {

//        memes = (UIApplication.sharedApplication().delegate as! AppDelegate).memes
        
        // Provoke the table view data source protocol methods to be called when subesequent memes are added to the memes collection.
        self.tableView.reloadData()
    }
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var memes = (UIApplication.sharedApplication().delegate as! AppDelegate).memes
        print("number of rows called: \(memes.count)")
        return memes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var memes = (UIApplication.sharedApplication().delegate as! AppDelegate).memes
        let cell = tableView.dequeueReusableCellWithIdentifier("memeTableCell")!
        let meme = memes[indexPath.row]
        print("Meme: \(meme)")
        cell.textLabel?.text = meme.text + "..." + meme.text2
        cell.imageView?.image = meme.memedImage
        return cell
    }
    
    
    
    /*
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    
    } */
   
    @IBAction func addButton(sender: AnyObject) {
        var controller: ViewController
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("MemeViewController") as! ViewController
        self.presentViewController(controller, animated: true, completion: nil)
        
    }
    
}
