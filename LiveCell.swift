//
//  LiveCell.swift
//  ProjectSwift
//
//  Created by ZJQ on 2016/12/26.
//  Copyright © 2016年 ZJQ. All rights reserved.
//

import UIKit

class LiveCell: UICollectionViewCell {
  
    var img = UIImageView()
    var title = UILabel()
    
    
    
    override init(frame: CGRect) {
    
        super.init(frame: frame)
        
        setSubViews()
    }
    
    func setSubViews() {
        img = UIImageView.init(frame: .init(x: 0, y: 0, width: self.contentView.width, height: 80))
        self.contentView.addSubview(img)
        
        title = UILabel.init(frame: .init(x: 0, y: img.bottom, width: img.width, height: 30))
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(title)
    }
    
    func sendModel(model: LiveModel) {
        
        img.sd_setImage(with: URL.init(string: model.room_src), placeholderImage: UIImage.init(named: "logo"))
        title.text = model.room_name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
