//
//  TableViewCell.swift
//  ToDoAppHw7
//
//  Created by Berkay Tuncel on 2.02.2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var lastChangedTimeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var background: UIView!
    
    var isFirstIndex: Bool = false
    var isLastIndex: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        background.backgroundColor = .systemGray6
        
        if isFirstIndex || isLastIndex {
            if isFirstIndex {
                roundCorners(corners: [.topLeft, .topRight], radius: 20.0)
            } else {
                roundCorners(corners: [.bottomLeft, .bottomRight], radius: 20.0)
            }
        } else {
            roundCorners(corners: [.topLeft, .topRight, .bottomLeft, .bottomRight], radius: 0.0)
        }
    }
}
