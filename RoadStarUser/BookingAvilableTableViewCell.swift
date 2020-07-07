//
//  BookingAvilableTableViewCell.swift
//  RoadStarUser
//
//  Created by Apple on 05/07/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class BookingAvilableTableViewCell: UITableViewCell {
    var minHeight: CGFloat?
    @IBOutlet weak var ShadowView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        ShadowView.layer.shadowColor = UIColor.lightGray.cgColor
        ShadowView.layer.shadowOpacity = 1
        ShadowView.layer.shadowOffset = .zero
        ShadowView.layer.shadowRadius = 10
        ShadowView.layer.cornerRadius = 10
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        let size = super.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: horizontalFittingPriority, verticalFittingPriority: verticalFittingPriority)
        guard let minHeight = minHeight else { return size }
        return CGSize(width: size.width, height: max(size.height, minHeight))
    }
    
    
}
