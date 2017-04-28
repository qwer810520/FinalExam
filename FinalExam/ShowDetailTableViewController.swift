//
//  ShowDetailTableViewController.swift
//  FinalExam
//
//  Created by 楷岷 張 on 2017/4/28.
//  Copyright © 2017年 楷岷 張. All rights reserved.
//

import UIKit

class ShowDetailTableViewController: UITableViewController {
    
    @IBAction func goMapButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "name", bundle: nil)
        let mapViewController = storyboard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        mapViewController.getAddress = selectIndex?.address
        navigationController?.pushViewController(mapViewController, animated: true)
    }
    @IBAction func callPhoneButton(_ sender: UIButton) {
        if let phoneCallURL = URL(string: "tel:\(showPhone)") {
            let application = UIApplication.shared
            if application.canOpenURL(phoneCallURL) {
                let alertController = UIAlertController(title: "Are you sure you want to call?", message: " \(self.showPhone)", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
                    application.openURL(phoneCallURL)
                }))
                alertController.addAction(UIAlertAction(title: "NO", style: .cancel, handler: nil))
                present(alertController, animated: true, completion: nil)
            }
        }
    }
    @IBAction func toSafari(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "book", bundle: nil)
        let openURLViewController = storyboard.instantiateViewController(withIdentifier: "OpenURLViewController") as! OpenURLViewController
        openURLViewController.getURL = selectIndex?.url
        navigationController?.pushViewController(openURLViewController, animated: true)
    }
    @IBOutlet weak var showPhone: UIButton!
    @IBOutlet weak var showDetail: UILabel!
    @IBOutlet weak var showURL: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var showAddress: UIButton!
    @IBOutlet weak var photoImage: UIImageView!
    var selectIndex:Bookmodel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       showPhone.titleLabel!.text = selectIndex?.phone
       showDetail.text = selectIndex?.detail
       showURL.titleLabel!.text = selectIndex?.url
        let image = UIImage(named: selectIndex!.phone!)
       photoImage.image = image
        nameLabel.text = selectIndex!.name
        showAddress.titleLabel!.text = selectIndex!.address

    }

}
