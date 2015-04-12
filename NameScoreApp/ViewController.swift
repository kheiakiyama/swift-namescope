//
//  ViewController.swift
//  NameScoreApp
//
//  Created by kohei akiyama on 2015/04/12.
//  Copyright (c) 2015年 kheiakiyama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.textField.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showAlert() {
        let VERSION: Float = (UIDevice.currentDevice().systemVersion as NSString).floatValue
        if VERSION >= 8.0 {
            let alertController = UIAlertController(title: "Error", message: "please enter your name", preferredStyle: .Alert)
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            self.presentViewController(alertController, animated: true, completion: nil)
        } else {
            let alert = UIAlertView()
            alert.title = "Error"
            alert.message = "Please enter your name"
            alert.addButtonWithTitle("OK")
            alert.show()
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        if identifier == "showResult" {
            if self.textField.text == "" {
                self.showAlert()
                return false
            }
            return true
        }
        return true
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showResult" {
            let resultViewController: ResultViewController = segue.destinationViewController as! ResultViewController
            resultViewController.myName = textField.text
        }
    }
}

