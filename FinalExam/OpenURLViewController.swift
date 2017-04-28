//
//  OpenURLViewController.swift
//  FinalExam
//
//  Created by 楷岷 張 on 2017/4/28.
//  Copyright © 2017年 楷岷 張. All rights reserved.
//

import UIKit
import WebKit

class OpenURLViewController: UIViewController {
    
    
    var getURL:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
         let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        
        if let url = URL(string: getURL!) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        
        view.addSubview(webView)
    }

    
}
