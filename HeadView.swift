//
//  HeadView.swift
//  ProjectSwift
//
//  Created by ZJQ on 2016/12/23.
//  Copyright © 2016年 ZJQ. All rights reserved.
//

import UIKit
import SDCycleScrollView

class HeadView: UIView ,SDCycleScrollViewDelegate{

    
    var cycleView = SDCycleScrollView()
    var headChannelPicArray = Array<HeadChannelModel>()
//    var collectionView = UICollectionView()

    
    override init(frame: CGRect) {
    
        super.init(frame: frame)
        
        cycleView = SDCycleScrollView.init(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 150), delegate: self, placeholderImage: UIImage.init(named: "logo"))
        cycleView.autoScrollTimeInterval = 3;//滚动时间s--gxfeng
        self.addSubview(cycleView)
        
        let itemWH = 50
        let screenWidth = UIScreen.main.bounds.size.width
        let allWidth = self.headChannelPicArray.count * itemWH
        let space = (Int(screenWidth)  - allWidth - 20)/6
        
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: itemWH, height: itemWH + 5)
        layout.sectionInset = .init(top: 0, left: 10, bottom: 0, right: 10)
        layout.minimumInteritemSpacing = CGFloat(space)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView.init(frame: .init(x: 0, y: 150, width: UIScreen.main.bounds.size.width, height: 55), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.tag = 1
        collectionView.register(HeadScrollCell.self, forCellWithReuseIdentifier: "cell")
        self.addSubview(collectionView)
        
    }
    func setScrollPic(picURLArray: Array<RecommendModel>) {
//        var pic = Array<String>()
        var pic = [String]()
        for model: RecommendModel in picURLArray {
        
            pic.append(model.pic_url!)
        }
        cycleView.imageURLStringsGroup = pic//所有要滚动的图片
    }
    
    func setHeadChannelPic(urlArray: Array<HeadChannelModel>) {
        
        self.headChannelPicArray = urlArray
        let collect:UICollectionView = self.viewWithTag(1) as! UICollectionView
        collect.reloadData()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension HeadView : UICollectionViewDelegate,UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.headChannelPicArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HeadScrollCell
        if self.headChannelPicArray.count>0 {
           
            let model: HeadChannelModel = self.headChannelPicArray[indexPath.row]
            cell.img.sd_setImage(with: URL.init(string: model.url), placeholderImage: UIImage.init(named: "logo"))
            cell.backgroundColor = UIColor.red
            cell.title.text = model.name
        }
        
        
        return cell
    }
}

