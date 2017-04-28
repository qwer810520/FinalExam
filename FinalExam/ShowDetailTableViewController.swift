//
//  ShowDetailTableViewController.swift
//  FinalExam
//
//  Created by 楷岷 張 on 2017/4/28.
//  Copyright © 2017年 楷岷 張. All rights reserved.
//

import UIKit

class ShowDetailTableViewController: UITableViewController {
    
    
    var selectIndex:Bookmodel?
    
    @IBOutlet weak var photoImage: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var showAddress: UIButton!
    @IBAction func goMapButton(_ sender: UIButton) {
        
        
    }
    
    @IBOutlet weak var showPhone: UIButton!
    @IBAction func callPhoneButton(_ sender: UIButton) {
        if let phoneCallURL:URL = URL(string: "tel:\(showPhone)") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                let alertController = UIAlertController(title: "MyApp", message: "Are you sure you want to call \n\(self.showPhone)?", preferredStyle: .alert)
                let yesPressed = UIAlertAction(title: "Yes", style: .default, handler: { (action) in
                    application.openURL(phoneCallURL)
                })
                let noPressed = UIAlertAction(title: "No", style: .default, handler: { (action) in
                    
                })
                alertController.addAction(yesPressed)
                alertController.addAction(noPressed)
                present(alertController, animated: true, completion: nil)
            }
        }
    }
    @IBOutlet weak var showURL: UIButton!
    @IBAction func toSafari(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "book", bundle: nil)
        let openURLViewController = storyboard.instantiateViewController(withIdentifier: "OpenURLViewController") as! OpenURLViewController
        openURLViewController.getURL = selectIndex?.url
        navigationController?.pushViewController(openURLViewController, animated: true)
    }
    
    @IBOutlet weak var showDetail: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

}
