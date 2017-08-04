//
//  DetailChannelModel.swift
//  ProjectSwift
//
//  Created by ZJQ on 2016/12/23.
//  Copyright © 2016年 ZJQ. All rights reserved.
//

import UIKit
import SwiftyJSON

class DetailChannelModel: NSObject {

    var title = String()
    var roomlist = Array<Any>()
    
    init(dic: JSON) {
        
        self.title = dic["title"].stringValue
        for (_,subJson) : (String,JSON) in dic["roomlist"] {
            let room = RoomModel.init(dic: subJson)
            self.roomlist.append(room)
        }
    }

    
}

class RoomModel: NSObject {
    
    var room_name = String()
    var room_src = String()
    
    init(dic: JSON) {
        
        self.room_name = dic["room_name"].stringValue
        self.room_src = dic["room_src"].stringValue
    }
}
