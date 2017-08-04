//
//  LiveViewController.swift
//  ProjectSwift
//
//  Created by ZJQ on 2016/12/22.
//  Copyright © 2016年 ZJQ. All rights reserved.
//

import UIKit
import SwiftyJSON
import MJRefresh

class LiveViewController: RootViewController {

    var liveArray = Array<LiveModel>()
    var offSet = Int()
    
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = .init(width: (self.view.width-10*3)/2, height: 110)
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        layout.sectionInset = .init(top: 10, left: 10, bottom: 0, right: 10);
        
        let collection = UICollectionView.init(frame: .init(x: 0, y: 0, width: self.view.width, height: self.view.height), collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = UIColor.white
        collection.register(LiveCell.self, forCellWithReuseIdentifier: "liveCell")
        
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.collectionView)
        getLiveData()
        
        let header = MJRefreshNormalHeader.init(refreshingBlock: {
            
            self.getLiveData()
        })
        let footer = MJRefreshAutoNormalFooter.init(refreshingBlock: {
            
            self.getLiveMoreData()
        })
        self.collectionView.mj_header = header
        self.collectionView.mj_footer = footer
        
    }

    func getLiveData() {
        
        self.offSet = 0
        self.liveArray.removeAll()
        NetRequest.sharedInstance.getRequest(urlString: "http://www.douyutv.com/api/v1/live?aid=ios&auth=b317487532542c2f8200f374f3153da2&client_sys=ios&limit=20", params: ["offset":"\(self.offSet)","time":getCurrentTime()]) {(response) in
        
            let json = JSON(response)
            for (_,subJson) : (String,JSON) in json["data"] {
            
                let model = LiveModel.init(dic: subJson)
                self.liveArray.append(model)
            }
            self.collectionView.reloadData()
            self.collectionView.mj_header.endRefreshing()
        }
    }
    
    func getLiveMoreData() {
        
        self.offSet += 20
        
        NetRequest.sharedInstance.getRequest(urlString: "http://www.douyutv.com/api/v1/live?aid=ios&auth=b317487532542c2f8200f374f3153da2&client_sys=ios&limit=20", params: ["offset":"\(self.offSet)","time":getCurrentTime()]) {(response) in
            
            let json = JSON(response)
            for (_,subJson) : (String,JSON) in json["data"] {
                
                let model = LiveModel.init(dic: subJson)
                self.liveArray.append(model)
            }
            self.collectionView.reloadData()
            self.collectionView.mj_footer.endRefreshing()
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

extension LiveViewController: UICollectionViewDelegate,UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.liveArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "liveCell", for: indexPath) as! LiveCell
        
        cell.sendModel(model: self.liveArray[indexPath.item])
        return cell
    }
}
