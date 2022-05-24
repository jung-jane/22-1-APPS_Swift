//
//  BlogEntriesUITableViewController.swift
//  My Daily Blog
//
//  Created by 정제인 on 2022/05/24.
//

import UIKit

class BlogEntriesUITableViewController: UITableViewController {

    var blogEntries: [BlogEntry] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return blogEntries.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = UITableViewCell();
        
        let blogEntry = blogEntries[indexPath.row];
        
        row.textLabel?.text = blogEntry.content;
        

        return row;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let entryViewController =  segue.destination as?
            BlogEntryViewController {
            
            entryViewController.entriesViewController = self;
        }
    }
}
