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

        memes = (UIApplication.sharedApplication().delegate as! AppDelegate).memes
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        self.navigationItem.leftBarButtonItem = self.editButtonItem();
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // var memes = (UIApplication.sharedApplication().delegate as! AppDelegate).memes
        print("number of rows called: \(memes.count)")
        return memes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //var memes = (UIApplication.sharedApplication().delegate as! AppDelegate).memes
        let cell = tableView.dequeueReusableCellWithIdentifier("memeTableCell")!
        print("index path for cellforRowIndexPath: \(indexPath.row)")
        let meme = memes[indexPath.row]
        print("Meme: \(meme)")
        cell.textLabel?.text = meme.text + "..." + meme.text2
        cell.imageView?.image = meme.memedImage
        return cell
    }

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailViewController = storyboard!.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        detailViewController.meme = memes[indexPath.row]
        presentViewController(detailViewController, animated: true, completion: nil)
       // navigationController!.pushViewController(detailViewController, animated: true)
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
           // deletePlanetIndexPath = indexPath
            let meme = memes[indexPath.row]
            print("Meme in edit: \(meme)")
            (UIApplication.sharedApplication().delegate as! AppDelegate).memes.removeAtIndex(indexPath.row)
            tableView.reloadData()
            
        }
    }
    


    @IBAction func addButton(sender: AnyObject) {
        var controller: ViewController
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("MemeViewController") as! ViewController
        self.presentViewController(controller, animated: true, completion: nil)
        
    }
    
}
