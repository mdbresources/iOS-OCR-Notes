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
    var dateLabel: UILabel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setUpTitle()
        setUpDescription()
        setUpDateLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpTitle() {
        titleLabel = UILabel(frame: CGRect(x: 10, y: 10, width: self.contentView.bounds.width, height: 25))
        titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.contentView.addSubview(titleLabel!)
    }
    
    private func setUpDescription() {
        descriptionLabel = UILabel(frame: CGRect(x: 10, y: self.titleLabel!.bounds.maxY+10, width: self.contentView.bounds.width, height: 75))
        
        descriptionLabel?.textColor = UIColor.gray
        descriptionLabel?.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel?.numberOfLines = 0
        descriptionLabel?.lineBreakMode = .byWordWrapping
        
        self.contentView.addSubview(descriptionLabel!)
    }
    
    private func setUpDateLabel() {
        dateLabel = UILabel(frame: CGRect(x: self.contentView.bounds.width, y: 30, width: 40, height: 40))
        
        dateLabel?.textColor = UIColor.gray
        dateLabel?.font = UIFont.systemFont(ofSize: 14)
        
        self.contentView.addSubview(dateLabel!)
    }
}
