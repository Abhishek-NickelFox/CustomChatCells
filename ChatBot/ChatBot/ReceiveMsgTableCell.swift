//
//  ReceiveMsgTableCell.swift
//  ChatBot
//
//  Created by Abhishek on 29/05/17.
//  Copyright © 2017 Abhishek. All rights reserved.
//

import UIKit

class ReceiveMsgTableCell: BotCell {

    @IBOutlet weak var txtLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    
    let gradientColor = GradientColor()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func draw(_ rect: CGRect) {
        self.setUpCellUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func configure(cellData: Any?) {
        guard let celldata = cellData as? CellModel else { return }
        txtLabel.text = celldata.text
    }

    func setUpCellUI() {
        
        let bgLayer = gradientColor.gradientLayer
        bgLayer.frame = backView.bounds
        
        backView.layer.insertSublayer(bgLayer, at: 0)
        backView.setRoundedConrners(corners: [.bottomRight, .topLeft, .topRight], radius: 15)
        backView.layer.masksToBounds = true
    }
    
}
