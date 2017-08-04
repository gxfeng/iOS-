//
//  LiveModel.swift
//  ProjectSwift
//
//  Created by ZJQ on 2016/12/26.
//  Copyright © 2016年 ZJQ. All rights reserved.
//

import UIKit
import SwiftyJSON

class LiveModel: NSObject {

    var room_src = String()
    var room_name = String()
    
    init(dic: JSON) {
        
        self.room_src = dic["room_src"].stringValue
        self.room_name = dic["room_name"].stringValue
    }
    
    
}
