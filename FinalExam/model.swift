//
//  model.swift
//  FinalExam
//
//  Created by 楷岷 張 on 2017/4/28.
//  Copyright © 2017年 楷岷 張. All rights reserved.
//

import Foundation
import UIKit


class Bookmodel {
    var key:String?
    var name:String?
    var address:String?
    var photo:UIImage?
    var phone:String?
    var url:String?
    var detail:String?
    
    init(key:String, name:String, address:String, photo:UIImage, phone:String, url:String, detail:String) {
        self.key = key
        self.name = name
        self.address = address
        self.photo = photo
        self.phone = phone
        self.url = url
        self.detail = detail
    }
    
}
