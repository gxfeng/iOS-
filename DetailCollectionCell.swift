//
//  DetailCollectionCell.swift
//  ProjectSwift
//
//  Created by ZJQ on 2016/12/23.
//  Copyright © 2016年 ZJQ. All rights reserved.
//

import UIKit

class DetailCollectionCell: UICollectionViewCell {
    
    var img = UIImageView()
    var detail = UILabel()
    
    
    
    override init(frame: CGRect) {
    
        super.init(frame: frame)
    
        img = UIImageView.init(frame: .init(x: 0, y: 0, width: (UIScreen.main.bounds.size.width-30)/2, height: 70))
        self.contentView.addSubview(img)
        
        detail = UILabel.init(frame: CGRect.init(x: 0, y: img.bottom+5, width: img.width, height: 25))
        detail.textAlignment = .center
        detail.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(detail)
        
        
    }
    
    func sendModel(model: RoomModel) {
        
        self.img.sd_setImage(with: URL.init(string: model.room_src), placeholderImage: UIImage.init(named: "logo"))
        self.detail.text = model.room_name

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
