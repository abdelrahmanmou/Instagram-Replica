//
//  ProfileInfoHeaderCollectionReusableView.swift
//  Instagram
//
//  Created by Abdelrahman Moustafa on 2/5/21.
//

import UIKit
protocol ProfileInfoHeaderCollectionReusableViewDelegate: AnyObject {
    func prfoileHeaderDidTapPostsButton(_ header: ProfileInfoHeaderCollectionReusableView )
    func prfoileHeaderDidTapFollowersButton(_ header: ProfileInfoHeaderCollectionReusableView )
    func prfoileHeaderDidTapFollowingButton(_ header: ProfileInfoHeaderCollectionReusableView )
    func prfoileHeaderDidTapEditProfileButton(_ header: ProfileInfoHeaderCollectionReusableView )
    
}
final class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileInfoHeaderCollectionReusableView"
    public weak var Delegate: ProfileInfoHeaderCollectionReusableViewDelegate?
    private let profilePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemRed
        imageView.layer.masksToBounds = true
        return imageView
        
    }()
    private let postsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Posts", for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button
        
    }()
    private let followingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Following", for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button
        
    }()
    private let followersButton: UIButton = {
        let button = UIButton()
        button.setTitle("Followers", for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button
        
    }()
    private let editProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit Profile", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
        
    }()
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Abdo"
        label.textColor = .label
        label.numberOfLines = 1
        return label
        
    }()
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.text = "First Account"
        label.textColor = .label
        label.numberOfLines = 0
        return label
        
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        clipsToBounds = true
        addButtonActions()
        addSubviews()
        
    }
    private func addSubviews(){
        addSubview(profilePhotoImageView)
        addSubview(followingButton)
        addSubview(followersButton)
        addSubview(nameLabel)
        addSubview(bioLabel)
        addSubview(editProfileButton )
        addSubview(postsButton)
        
    }
    
    func addButtonActions(){
        followersButton.addTarget(self,
                                  action: #selector(didTapFollowerButton),
                                  for: .touchUpInside)
        followingButton.addTarget(self,
                                  action: #selector(didTapFollowingButton),
                                  for: .touchUpInside)
        postsButton.addTarget(self,
                                  action: #selector(didTapPostsButton),
                                  for: .touchUpInside)
        editProfileButton.addTarget(self,
                                  action: #selector(didTapEditProfileButton),
                                  for: .touchUpInside)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let profilePhotoSize = width / 4
        
        profilePhotoImageView.layer.cornerRadius = profilePhotoSize / 2.0
        profilePhotoImageView.frame = CGRect(
            x: 5,
            y: 5,
            width: profilePhotoSize,
            height: profilePhotoSize)
            .integral
        profilePhotoImageView.layer.cornerRadius = profilePhotoSize / 2.0
        let buttonHieght = profilePhotoSize / 2
        let countButtonWidth = ( width - 10 - profilePhotoSize) / 3
        
        postsButton.frame = CGRect(
            x: profilePhotoImageView.right,
            y: 5,
            width: countButtonWidth,
            height: buttonHieght
            ).integral
        followersButton.frame = CGRect(
            x: postsButton.right,
            y: 5,
            width: countButtonWidth,
            height: buttonHieght
            ).integral
        followingButton.frame = CGRect(
            x: followersButton.right,
            y: 5,
            width: countButtonWidth,
            height: buttonHieght
            ).integral
        editProfileButton.frame = CGRect(
            x: profilePhotoImageView.right,
            y: 5 + buttonHieght ,
            width: countButtonWidth * 3,
            height: buttonHieght
            ).integral
        nameLabel.frame = CGRect(
            x: 5,
            y: 5 + profilePhotoImageView.bottom ,
            width: width - 10 ,
            height: 50
            ).integral
        
        let bioLabelSize = bioLabel.sizeThatFits(frame.size)
        bioLabel.frame = CGRect(
            x: 5,
            y: 5 + nameLabel.bottom ,
            width: width - 10 ,
            height: bioLabelSize.height
            ).integral
    }
    
    // MARK: - Actions
    @objc private func didTapFollowerButton(){
        Delegate?.prfoileHeaderDidTapFollowersButton(self)
    }
    @objc private func didTapFollowingButton(){
        Delegate?.prfoileHeaderDidTapFollowingButton(self)
    }
    @objc private func didTapPostsButton(){
        Delegate?.prfoileHeaderDidTapPostsButton(self)
    }
    @objc private func didTapEditProfileButton(){
        Delegate?.prfoileHeaderDidTapEditProfileButton(self)
    }
}
