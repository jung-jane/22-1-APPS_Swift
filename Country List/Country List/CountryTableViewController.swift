//
//  CountryTableViewController.swift
//  Country List
//
//  Created by 정제인 on 2022/05/04.
//

import UIKit

class CountryTableViewController: UITableViewController {
    
    let flags = ["🇧🇷", "🇳🇿", "🇵🇰", "🇵🇹", "🇹🇷"];

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return flags.count;
    }

    // What is each particular item
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)

        
        cell.textLabel?.text = flags[indexPath.row];
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let selectedCountry = flags[indexPath.row];
        
        performSegue(withIdentifier: "DefinitionSegue", sender: selectedCountry)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let defOfViewController = segue.destination as! CountryDefinitionViewController;
        let selectedCountry = sender as! String;
        
        defOfViewController.country = selectedCountry;
    }


}
