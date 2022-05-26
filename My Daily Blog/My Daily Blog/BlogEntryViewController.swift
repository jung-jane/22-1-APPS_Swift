//
//  BlogEntryViewController.swift
//  My Daily Blog
//
//  Created by 정제인 on 2022/05/24.
//

import UIKit

class BlogEntryViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var BlogEntryTextView: UITextView!
    @IBOutlet weak var botConstraint: NSLayoutConstraint!
    var blogEntry: BlogEntry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        if blogEntry == nil {
            //create entry
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                
                blogEntry = BlogEntry(context: context);
                blogEntry?.date = datePicker.date
                blogEntry?.content = "Thank you"
                BlogEntryTextView.becomeFirstResponder();
            }
        }
        
        BlogEntryTextView.text = blogEntry?.content
        if let dataToBeDisplayed = blogEntry?.date {
            datePicker.date = dataToBeDisplayed
        }
        
        BlogEntryTextView.delegate = self;
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext();
        
    }
    
    @objc func keyboardWillShow(_ notiofication: NSNotification) {
        if let keyboardFrame: NSValue =
            notiofication.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            botConstraint.constant = keyboardHeight
        }
    }
    
    
    @IBAction func onDelete(_ sender: Any) {
        if blogEntry != nil {
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                
                context.delete(blogEntry!);
                try? context.save()
            }
        }
        navigationController?.popViewController(animated: true)
        
    }
    
    func textViewDidChange(_ textView: UITextView) {
        blogEntry?.content = BlogEntryTextView.text
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext();
    }
    
    
    @IBAction func onDateChanged(_ sender: Any) {
        blogEntry?.date = datePicker.date;
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext();
    }
}


