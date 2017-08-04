//
//  ProgrameModel.swift
//  ProjectSwift
//
//  Created by ZJQ on 2016/12/23.
//  Copyright © 2016年 ZJQ. All rights reserved.
//

import UIKit
import SwiftyJSON

class ProgrameModel: NSObject {

    var game_icon : String?
    var game_name : String?
    
    
    init(dic: JSON) {
        super.init()
        self.game_icon = dic["game_icon"].string
        self.game_name = dic["game_name"].string
    }
    
}
