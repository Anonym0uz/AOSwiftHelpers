//
//  ViewControllerTableCell.swift
//  AOSwiftHelpersExample
//
//  Created by Alexander Orlov on 11.05.2019.
//  Copyright © 2019 Alexander Orlov. All rights reserved.
//

import UIKit
import AOSwiftHelpers

protocol VCCellUpdater {
    func updateCell(title: String)
}

class ViewControllerTableCell: UITableViewCell, VCCellUpdater {
    
    var delegate: VCCellUpdater?
    
    var cellTitle: UILabel = {
        let lbl = AOSwiftHelpers.UI.setupLabel(text: "", textFont: nil, textModificator: nil, parentView: nil)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    func updateCell(title: String) {
        self.cellTitle.text = title
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.createTableCellView()
    }
    
    func createTableCellView() {
        addSubviews(views: [cellTitle])
        
        cellTitle.setupAnchor(top: nil, left: contentView.left, bottom: nil, right: nil, padding: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0))
        cellTitle.centerY.constraint(equalTo: self.centerY).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
