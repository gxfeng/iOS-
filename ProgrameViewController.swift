//
//  ProgrameViewController.swift
//  ProjectSwift
//
//  Created by ZJQ on 2016/12/22.
//  Copyright © 2016年 ZJQ. All rights reserved.
//




import UIKit
import SwiftyJSON



class ProgrameViewController: RootViewController {

    
    var programeArray = Array<Any>()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = .init(width: (UIScreen.main.bounds.size.width-40)/3, height: (UIScreen.main.bounds.size.width-40)/3+30)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = .init(top: 10, left: 10, bottom: 0, right: 10)
        let collection = UICollectionView.init(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = UIColor.white
        collection.register(ProgrameCell.self, forCellWithReuseIdentifier: "programeCell")
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.collectionView)
        // Do any additional setup after loading the view.
        
        getProgrameData()
    }

    func getProgrameData() {
        
        NetRequest.sharedInstance.getRequest(urlString: "http://www.douyutv.com/api/v1/game?aid=ios&auth=3f252c3294b31a61fbdd890a45609549&client_sys=ios&time=", params:["":""]){(response) in
        
            let json = JSON(response)
            for (_,subJson):(String,JSON) in json["data"] {
            
                let model = ProgrameModel.init(dic: subJson)
                self.programeArray.append(model)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ProgrameViewController : UICollectionViewDelegate,UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.programeArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "programeCell", for: indexPath) as! ProgrameCell
        
        cell.sendModel(model: self.programeArray[indexPath.item] as! ProgrameModel)
        return cell
    }


}
