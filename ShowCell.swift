//
//  ShowCell.swift
//  ProjectSwift
//
//  Created by ZJQ on 2016/12/23.
//  Copyright © 2016年 ZJQ. All rights reserved.
//

import UIKit

class ShowCell: UITableViewCell {

    
    var dataArray = Array<RoomModel>()
    
    var title = UILabel()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        setSubViews()
    }
    
    func setSubViews() {
        
        title = UILabel.init(frame: CGRect.init(x: 15, y: 5, width: 200, height: 15))
        title.font = UIFont.systemFont(ofSize: 13)
        self.contentView.addSubview(title)
        
        
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = .init(width: (UIScreen.main.bounds.size.width-3*10)/2, height: 100)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5;
        layout.sectionInset = .init(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView.init(frame: .init(x: 0, y: 20, width: UIScreen.main.bounds.size.width, height: 210), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        self.contentView.addSubview(collectionView)
        collectionView.register(DetailCollectionCell.self, forCellWithReuseIdentifier: "detailCell")
        
    }
    
    func sendModel(model: DetailChannelModel) {
        title.text = model.title
        self.dataArray = model.roomlist as! Array<RoomModel>
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ShowCell : UICollectionViewDelegate,UICollectionViewDataSource{

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailCell", for: indexPath) as! DetailCollectionCell
        
        cell.sendModel(model: self.dataArray[indexPath.item])
        return cell
    }
}

