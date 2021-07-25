//
//  PhotoCollectionViewCell.swift
//  Instagram
//
//  Created by Abdelrahman Moustafa on 2/5/21.
//
import SDWebImage
import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    static let identifier = "PhotoCollectionViewCell"
    
    private let phototImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        phototImageView.frame = contentView.bounds
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        phototImageView.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(phototImageView)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.clipsToBounds = true
        accessibilityLabel = "User Post Image"
        accessibilityHint = "Douple tap to open post"
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func configure(with model: UserPost){
        let url = model.thumbnailImage
        phototImageView.sd_setImage(with: url, completed: nil)
    }
    public func congifure(debug imageName: String){
        phototImageView.image = UIImage(named: imageName)
    }
}
