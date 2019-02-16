//
//  DocumentTableViewCell.swift
//  MidwayReview
//
//  Created by Anmol Parande on 2/15/19.
//  Copyright © 2019 Anmol Parande. All rights reserved.
//

import UIKit

class DocumentTableViewCell: UITableViewCell {
    var titleLabel: UILabel?
    var descriptionLabel: UILabel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpTitle()
        setUpDescription()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpTitle() {
        titleLabel = UILabel(frame: CGRect(x: 10, y: 10, width: self.contentView.bounds.width, height: self.contentView.bounds.height * 0.75))
        self.contentView.addSubview(titleLabel!)
    }
    
    private func setUpDescription() {
        descriptionLabel = UILabel(frame: CGRect(x: 10, y: self.titleLabel!.bounds.maxY+10, width: self.contentView.bounds.width, height: self.contentView.bounds.height * 0.25))
        self.contentView.addSubview(descriptionLabel!)
    }
}
