//
//  HomeCollectionViewCell.swift
//  Constellation

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    //MARK: - IBOulet
    @IBOutlet weak var constellationImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK: - view init
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func update(_ data: MyConstellation) {
        titleLabel.text = data.title.rawValue
        constellationImage.image = UIImage(named: data.image)
    }
}
