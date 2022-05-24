//
//  BlogEntryViewController.swift
//  My Daily Blog
//
//  Created by 정제인 on 2022/05/24.
//

import UIKit

class BlogEntryViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var BlogEntryTextView: UITextView!
    
    var entriesViewController : BlogEntriesUITableViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //Make Entry
        let blogEntry = BlogEntry()
        blogEntry.date = datePicker.date
        blogEntry.content = BlogEntryTextView.text
        
        //Add entry tableview array
        entriesViewController?.blogEntries.append(blogEntry);
        entriesViewController?.tableView.reloadData();
    }

}
