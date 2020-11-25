//
//  ViewController.swift
//  flagTableiew
//
//  Created by Tigran on 11/25/20.
//  Copyright © 2020 Tigran. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var countries = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        cell.imageView?.image = UIImage(named: countries[indexPath.row])
        cell.imageView?.layer.borderWidth = 2
        cell.imageView?.layer.borderColor = UIColor.darkGray.cgColor
        
        cell.textLabel?.text = countries[indexPath.row].uppercased()
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let dc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
            dc.imageName = countries[indexPath.row]
            navigationController?.pushViewController(dc, animated: true)
        }
        
        
    }

}

