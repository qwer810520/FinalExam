//
//  PhotosViewController.swift
//  FinalExam
//
//  Created by 楷岷 張 on 2017/4/29.
//  Copyright © 2017年 楷岷 張. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var testscrollView: UIScrollView!
    var image:UIImage?
    
    @IBOutlet weak var showImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        testscrollView.delegate = self
        testscrollView.maximumZoomScale = 2.0
        testscrollView.minimumZoomScale = 0.5
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showImage.image = image
    }
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return showImage
    }


}
