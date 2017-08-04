//
//  RecommendModel.swift
//  ProjectSwift
//
//  Created by ZJQ on 2016/12/22.
//  Copyright © 2016年 ZJQ. All rights reserved.
//

import UIKit
import SwiftyJSON

class RecommendModel: NSObject {

    var pic_url : String?
    
    init(dic : JSON) {
        
        super.init()
        
        self.pic_url = dic["pic_url"].string
    }
    
}
