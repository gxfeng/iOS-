//
//  ProgrameCell.swift
//  ProjectSwift
//
//  Created by ZJQ on 2016/12/23.
//  Copyright © 2016年 ZJQ. All rights reserved.
//

import UIKit

class ProgrameCell: UICollectionViewCell {
    
    var img = UIImageView()
    var name = UILabel()
    
    func sendModel(model: ProgrameModel) {
        img.sd_setImage(with: URL.init(string: model.game_icon!), placeholderImage: UIImage.init(named: "logo"))
        name.text = model.game_name!
    }
    
    override init(frame: CGRect) {
    
        super.init(frame: frame)
        
        img = UIImageView.init(frame: .init(x: 0, y: 0, width: self.contentView.width, height: self.contentView.width))
        self.contentView.addSubview(img)
        
        name = UILabel.init(frame: .init(x: 0, y: img.bottom+8, width: img.width, height: 21))
        name.textAlignment = .center
        name.font = UIFont.systemFont(ofSize: 14)
        self.contentView.addSubview(name)
        
        let line = UIView.init(frame: .init(x: 0, y: name.bottom, width: img.width, height: 1))
        line.backgroundColor = UIColor.orange
        self.contentView.addSubview(line)
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
