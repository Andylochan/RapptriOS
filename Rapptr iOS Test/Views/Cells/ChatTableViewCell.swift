//
//  ChatTableViewCell.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit
import SDWebImage

class ChatTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var bubbleView: UIView!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCellUI()
    }
    
    private func setupCellUI() {
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        bubbleView.layer.cornerRadius = 8
    }
    
    // MARK: - Public
    func setCellData(message: Message) {
        header.text = message.username
        body.text = message.text
        profileImage.sd_setImage(with: message.avatarURL)
    }
}
