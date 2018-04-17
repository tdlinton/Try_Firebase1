//
//  ProjectTableVC.swift
//  Try_Firebase1
//
//  Created by Thomas Linton on 3/26/18.
//  Copyright © 2018 Thomas Linton. All rights reserved.
//

import UIKit

class ProjectTableVC: UITableViewController {
    
    struct Constants {
        static let SegueToPartsTable = "SegueToPartsTable"
    }
    
    var projects = [ KrfProject(name: "Proj 1"), KrfProject(name: "Proj 2")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.title = "Projects"

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "aaa")
        {
            print("vc - aaa TRUE")
        } else {
            print("vc - aaa FALSE")
        }
        if UserDefaults.standard.bool(forKey: "firebase_analytics_collection_enabled")
        {
            tableView.backgroundColor = UIColor.red
            print("vc - analytics ENABLED")
        } else {
            tableView.backgroundColor = UIColor.white
            print("vc - analytics DISABLED")
        }
    }

  
    @IBAction func addProject(_ sender: Any)
    {
        projects.append(KrfProject(name: "Project \(projects.count+1)"))
        tableView.reloadData()
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return projects.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectTableCell", for: indexPath) as! ProjectTableCell
        cell.projectName.text  = projects[indexPath.row].name
        cell.projectPartCount.text = "\(projects[indexPath.row].parts.count) parts"
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.SegueToPartsTable {
            if let vc = segue.destination as? PartTableVC {
                if let cell = sender as? ProjectTableCell {
                    if let ip = tableView.indexPath(for: cell) {
                        vc.project = projects[ip.row]
                    }
                }
            }
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
