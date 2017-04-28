//
//  BookTableViewController.swift
//  FinalExam
//
//  Created by 楷岷 張 on 2017/4/28.
//  Copyright © 2017年 楷岷 張. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class BookTableViewController: UITableViewController {
    
    var book:[Bookmodel] = []
    
    
    @IBAction func addBookButton(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "book", bundle: nil)
        let addTableViewController = storyboard.instantiateViewController(withIdentifier: "AddTableViewController")
        
        navigationController?.pushViewController(addTableViewController, animated: true)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return book.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BookTableViewCell
        cell.bookImage.image = UIImage(named: book[indexPath.row].photo!)
        cell.bookName.text = book[indexPath.row].name
        
        return cell
    }

}
