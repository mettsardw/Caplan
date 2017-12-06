//
//  HelpViewController.swift
//  IndomitableProject
//
//  Created by Samuel Theodorus Junius on 11/30/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

class HelpViewController: UITableViewController{
    //created a string array to display on table view
    var tableItems = ["How to add a task?","Python","PHP","Java","JavaScript","C#"]
    var isian = ["isian 1","isian 2","isian 3","isian 4","isian 5","isian 6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //this method will populate the table view
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableRow = tableView.dequeueReusableCell(withIdentifier: "Cell") as UITableViewCell!
        
        //adding the item to table row
        tableRow?.textLabel?.text = tableItems[indexPath.row]
        tableRow?.accessoryType = .disclosureIndicator
        return tableRow!
    }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue"{
            let destination = segue.destination as! HelpNextViewController
            
            destination.textUtama = tableItems[(tableView.indexPathForSelectedRow?.row)!]
            destination.textIsi = isian[(tableView.indexPathForSelectedRow?.row)!]
            //destination.animalText = animalData[dataPicker.selectedRow(inComponent: 1)]
        }
    }
    
    //this method will return the total rows count in the table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableItems.count
    }

}
