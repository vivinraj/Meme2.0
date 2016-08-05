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
    
 //var memes = (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var memes = (UIApplication.sharedApplication().delegate as! AppDelegate).memes
        return memes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var memes = (UIApplication.sharedApplication().delegate as! AppDelegate).memes
        let cell = tableView.dequeueReusableCellWithIdentifier("tableViewCell")!
        let meme = memes[indexPath.row]
        print("Meme: \(meme)")
        cell.textLabel!.text = "test"
        
        
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
