//
//  EditProfileViewController.swift
//  Instagram
//
//  Created by Abdelrahman Moustafa on 1/17/21.
//

import UIKit

struct editProfileFormModel {
    let label: String
    let placeHolder: String
    var value: String?
}

final class EditProfileViewController: UIViewController, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FormTableViewCell.self, forCellReuseIdentifier: FormTableViewCell.identifier)
        return tableView
    
    }()
    
    private var models = [[editProfileFormModel]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
        view.backgroundColor = .systemBackground
        tableView.tableHeaderView = createTableHeaderView()
        tableView.dataSource = self
        view.addSubview(tableView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapSave))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(didTapCancel))
    }
    private func configureModels(){
        // Name, Username, Website, Bio
        let sectionLabels = ["Name", "Username", "Bio"]
        var section1 = [editProfileFormModel]()
        for label in sectionLabels {
            let model = editProfileFormModel(label: label, placeHolder: "Enter \(label)..", value: nil)
            section1.append(model)
        }
        
        models.append(section1)
        
        // Email, Phone, Gender
        
        let section2Labels = ["Email", "Phone", "Gender"]
        var section2 = [editProfileFormModel]()
        for label in section2Labels {
            let model = editProfileFormModel(label: label, placeHolder: "Enter \(label)..", value: nil)
            section1.append(model)
        }
        
        models.append(section1)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame =  view.bounds
    }
    // MARK: - TableView
    
    private func  createTableHeaderView() -> UIView{
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: view.hieght / 4).integral)
        let size = header.hieght / 1.5
        let profilePhotoButton = UIButton(frame: CGRect(x: (view.width - size)/2, y: (header.hieght - size)/2 , width: size, height: size))
        header.addSubview(profilePhotoButton)
        profilePhotoButton.layer.masksToBounds = true
        profilePhotoButton.layer.cornerRadius = size / 2
        profilePhotoButton.tintColor = .label
        profilePhotoButton.addTarget(self, action: #selector(didTapProfilePhotoButton), for: .touchUpInside)
        profilePhotoButton.setBackgroundImage(UIImage(systemName: "person.circle"), for: .normal)
        profilePhotoButton.layer.borderWidth = 1
        profilePhotoButton.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        return header
    }
    @objc private func didTapProfilePhotoButton(){
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: FormTableViewCell.identifier, for: indexPath) as! FormTableViewCell
        cell.configure(with: model)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard section == 1 else {
            return nil
        }
        return "Private Information "
    }
    // MARK: - Action

    @objc private func didTapSave(){
         // Save info to database
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func didTapCancel(){
         dismiss(animated: true, completion: nil)
        
    }
    @objc private func didTapChangeProfilePicture (){
        let actionSheet = UIAlertController(title: "Profile Picture",
                                            message: "Change profile Picture",
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Take Picture", style: .default, handler: {_ in
            
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Choose From Gallery", style: .default, handler: {_ in
            
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        actionSheet.popoverPresentationController?.sourceView = view
        actionSheet.popoverPresentationController?.sourceRect = view.bounds
        present(actionSheet, animated: true)
    }

}
extension EditProfileViewController: formTableviewCellDelegate {
   
    
    func formTableViewcell(_ cell: FormTableViewCell, didUpdateField updatedModel: editProfileFormModel?) {
        
        // Update The Model
        
        
        
    }
    
    
}
