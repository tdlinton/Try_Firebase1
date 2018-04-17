//
//  PartEditorVC.swift
//  Try_Firebase1
//
//  Created by Thomas Linton on 3/27/18.
//  Copyright © 2018 Thomas Linton. All rights reserved.
//

import UIKit
import Firebase
import Crashlytics

class PartEditorVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func doSave(_ sender: Any)
    {
        Analytics.logEvent("SavePart", parameters: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doCrash(_ sender: Any)
    {
    Crashlytics.sharedInstance().crash()
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doCancel(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
