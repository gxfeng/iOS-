//
//  HeadChannelModel.swift
//  ProjectSwift
//
//  Created by ZJQ on 2016/12/23.
//  Copyright © 2016年 ZJQ. All rights reserved.
//

import UIKit
import SwiftyJSON

class HeadChannelModel: NSObject {

    var url = String()
    var name = String()
    
    init(dic: JSON) {
      
        self.url = dic["url"].stringValue
        self.name = dic["name"].stringValue
    }
    
    
    
}
