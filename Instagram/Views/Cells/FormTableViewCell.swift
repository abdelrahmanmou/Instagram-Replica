//
//  FormTableViewCell.swift
//  Instagram
//
//  Created by Abdelrahman Moustafa on 1/30/21.
//

import UIKit
protocol formTableviewCellDelegate: AnyObject {
    func formTableViewcell(_ cell: FormTableViewCell, didUpdateField updatedModel: editProfileFormModel?)
}
class FormTableViewCell: UITableViewCell, UITextFieldDelegate{
    static let identifier = "FormTableViewCell"
    private var model: editProfileFormModel?
    public weak var delegate: formTableviewCellDelegate?
    private let  formLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    
    private let field: UITextField = {
         let field = UITextField()
        field.returnKeyType = .done
        return field
    }()
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
        contentView.addSubview(formLabel)
        contentView.addSubview(field)
        field.delegate = self
        selectionStyle = .none
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        model?.value = textField.text
        guard let model = model else{
             return true
        }
        delegate?.formTableViewcell(self, didUpdateField: model)
        textField.resignFirstResponder()
        return true
    }
    
    public func configure(with model: editProfileFormModel){
        self.model = model
        formLabel.text = model.label
        field.placeholder = model.placeHolder
        field.text = model.value
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        formLabel.text = nil
        field.placeholder = nil
        field.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Assign frames
        formLabel.frame = CGRect(x: 5,
                                 y: 0,
                                 width: contentView.width/3,
                                 height: contentView.hieght)
        field.frame = CGRect(x: formLabel.right + 5,
                             y: 0,
                             width: contentView.width-10-formLabel.width,
                             height: contentView.hieght)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
