//
//  NetRequest.swift
//  ProjectSwift
//
//  Created by ZJQ on 2016/12/22.
//  Copyright © 2016年 ZJQ. All rights reserved.
//

import UIKit
import Alamofire

private let NetRequestShareInstance = NetRequest()

class NetRequest: NSObject {
    
    class var sharedInstance : NetRequest {
        return NetRequestShareInstance
    }

}

extension NetRequest{

    func getRequest(urlString: String, params : [String : Any], success : @escaping (_ response : [String : AnyObject])->()) {
    
        print("----->url:\(urlString)")
        Alamofire.request(urlString, method: .get, parameters: params)
            .responseJSON { (response) in
        
                if response.result.isSuccess{
                
                   success(response.result.value as! [String : AnyObject])
                }else{
                
                    print("error")
                }
        }
    }

}

