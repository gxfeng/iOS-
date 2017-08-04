//
//  HeadScrollCell.swift
//  ProjectSwift
//
//  Created by ZJQ on 2016/12/23.
//  Copyright © 2016年 ZJQ. All rights reserved.
//

import UIKit

class HeadScrollCell: UICollectionViewCell {
    
    var img = UIImageView()
    var title = UILabel()
    
    
    
    override init(frame: CGRect) {
    
        super.init(frame: frame)
        
        img = UIImageView.init(frame: CGRect.init(x: 5, y: 5, width: 30, height: 30))
        img.layer.cornerRadius = 15
        img.layer.masksToBounds = true
        self.contentView.addSubview(img)
        
        title = UILabel.init(frame: .init(x: 0, y: 35, width: 40, height: 15))
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 8)
        self.contentView.addSubview(title)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
