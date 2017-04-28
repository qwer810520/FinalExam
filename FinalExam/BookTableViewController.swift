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
    let bookRef = FIRDatabase.database().reference().child("Book")
    
    @IBAction func addBookButton(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "book", bundle: nil)
        let addTableViewController = storyboard.instantiateViewController(withIdentifier: "AddTableViewController")
        
        navigationController?.pushViewController(addTableViewController, animated: true)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        dowloadData()
    }
    
    
    func dowloadData() {
        self.bookRef.observe(.childAdded, with: { (snapshot) in
            var model:Bookmodel?
            if let dict = snapshot.value as? [String: AnyObject] {
                let key = snapshot.key
                let name = dict["name"] as? String
                let address = dict["address"] as? String
                let phone = dict["phone"] as? String
                let url = dict["url"] as? String
                let detail = dict["detail"] as? String
                let photoURLString = dict["photo"] as? String
                let photoURL = URL(string: photoURLString!)
                do {
                    let data = try Data(contentsOf: photoURL!)
                    let image = UIImage(data: data)
                    model = Bookmodel(key: key, name: name!, address: address!, photo: image!, phone: phone!, url: url!, detail: detail!)
                    self.book.append(model!)
                } catch {
                    
                }
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        })
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return book.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BookTableViewCell
        cell.bookImage.image = book[indexPath.row].photo!
        cell.bookName.text = book[indexPath.row].name
        
        return cell
    }

}
