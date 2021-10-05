//
//  SetTableViewCell.swift
//  Constellation

import UIKit

class SetTableViewCell: UITableViewCell {

    //MARK: - IBOulet
    @IBOutlet weak var setImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK: - view init
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func update(_ data: UserSet) {
        titleLabel.text = data.title
        setImageView.image = UIImage(named: data.image)
    }
    
}
