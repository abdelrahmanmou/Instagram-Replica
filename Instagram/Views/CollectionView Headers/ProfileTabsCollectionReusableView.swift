//
//  ProfileTabsCollectionReusableView.swift
//  Instagram
//
//  Created by Abdelrahman Moustafa on 2/5/21.
//

import UIKit
protocol ProfileTabsCollectionReusableViewDelegate: AnyObject {
    func didTapGridButtontab()
    func didTapTaggedButtontab()

}

class ProfileTabsCollectionReusableView: UICollectionReusableView {
    struct Constants {
        static let padding: CGFloat = 8
    }
    static let identifier = "ProfileTabsCollectionReusableView"
    
    public weak var delegate: ProfileTabsCollectionReusableViewDelegate?
    
   
    private let gridButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.tintColor = .systemBlue
        button.setBackgroundImage(UIImage(systemName: "square.grid.2x2"), for: .normal)
        return button
    }()
    private let taggedButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.tintColor = .lightGray
        button.setBackgroundImage(UIImage(systemName: "tag"), for: .normal)
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(gridButton)
        addSubview(taggedButton)
        
        gridButton.addTarget(self,
                            action: #selector(didTapGridButton),
                            for: .touchUpInside)
        taggedButton.addTarget(self,
                            action: #selector(didTapTaggedButton),
                            for: .touchUpInside)
    }
    
    @objc private func didTapGridButton() {
        gridButton.tintColor = .systemBlue
        taggedButton.tintColor = .lightGray
        delegate?.didTapGridButtontab()
    }
    @objc private func didTapTaggedButton() {
        gridButton.tintColor = .lightGray
        taggedButton.tintColor = .systemBlue
 
        delegate?.didTapTaggedButtontab()

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size = hieght - (Constants.padding + 2)
        let gridButtonX = ((width / 2) - size) / 2
        gridButton.frame = CGRect(x: gridButtonX,
                                  y: Constants.padding,
                                  width: size,
                                  height: size)
        taggedButton.frame = CGRect(x: gridButtonX + (width/2),
                                  y: Constants.padding,
                                  width: size,
                                  height: size)
    }
    
}
