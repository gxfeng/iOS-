//
//  RecommendViewController.swift
//  ProjectSwift
//
//  Created by ZJQ on 2016/12/22.
//  Copyright © 2016年 ZJQ. All rights reserved.
//

let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height



import UIKit
import SDCycleScrollView
import SwiftyJSON

class RecommendViewController: RootViewController,SDCycleScrollViewDelegate {


    
    var picArray = Array<Any>()
    var headChannelPicArray = Array<Any>()
    var detailChannelArray = Array<Any>()
    var headView = HeadView()
    
    
    
    lazy var tableView: UITableView = {
    
        let table = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), style: .grouped)
        table.delegate = self
        table.dataSource = self
        return table

    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let logoImg = UIImageView.init(image: UIImage.init(named: "logo"))
        self.navigationItem.titleView = logoImg
        self.view.addSubview(tableView)
        headView = HeadView.init(frame: .init(x: 0, y: 0, width: SCREEN_WIDTH, height: 205))
        tableView.tableHeaderView = headView
        getData()
        getHeadChannel()
        getDetailChannel()
    }

    
    func getData() {
        NetRequest.sharedInstance.getRequest(urlString: "http://www.douyutv.com/api/v1/slide/6", params: ["aid":"ios","auth":"97d9e4d3e9dfab80321d11df5777a107","client_sys":"ios","time":getCurrentTime()]){(response) in
        
            let json = JSON(response)
            for (_,subJson) : (String,JSON) in json["data"] {
            
                let model = RecommendModel.init(dic: subJson)
                self.picArray.append(model)
            }
            self.headView.setScrollPic(picURLArray: self.picArray as! Array<RecommendModel>)
        }
    }
    
    func getHeadChannel() {
        
        var urlString = "http://www.douyutv.com/api/v1/getCyclePicture?aid=ios&client_sys=ios&auth=e4b6593bc6962292d21146ae6920856c&time="
        urlString = urlString.appending(getCurrentTime())
        
        NetRequest.sharedInstance.getRequest(urlString: urlString, params: ["":""]){(response) in
            
            let json = JSON(response)
            for (_,subJson) : (String,JSON) in json["data"]["result"] {
            
                let model = HeadChannelModel.init(dic: subJson)
                self.headChannelPicArray.append(model)
            }
            self.headView.setHeadChannelPic(urlArray: self.headChannelPicArray as! Array<HeadChannelModel>)
        }
    }
    
    func getDetailChannel() {
        
        var urlString = "http://www.douyutv.com/api/v1/channel?aid=ios&auth=6a4c6b01d851ceece76aee1980b9e5bb&client_sys=ios&limit=4&time="
        urlString = urlString.appending(getCurrentTime())
        
        NetRequest.sharedInstance.getRequest(urlString: urlString, params: ["":""]){(response) in
            
            let json = JSON(response)
            for (_,subJson) : (String,JSON) in json["data"] {
                
                let model = DetailChannelModel.init(dic: subJson)
                self.detailChannelArray.append(model)
            }
            self.tableView.reloadData()
        }

    }
    
    func getCurrentTime() -> String{
        
        let date = NSDate.init(timeIntervalSinceNow: 0)
        let a = date.timeIntervalSince1970;
        
        let b = Int(a)
        
        let str = "\(b)"
        
        return str
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension RecommendViewController : UITableViewDelegate,UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return self.detailChannelArray.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cellID = "cell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? ShowCell
        if cell == nil {
            cell = ShowCell.init(style: .default, reuseIdentifier: cellID) 
        }
        
        
        let model = self.detailChannelArray[indexPath.section] as! DetailChannelModel
        cell?.sendModel(model: model)

        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
}

