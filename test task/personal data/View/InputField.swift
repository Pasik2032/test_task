//
//  InputField.swift
//  test task
//
//  Created by Даниил Пасилецкий on 03.03.2022.
//

import UIKit

class InputField: UITextField {
    var floatingLabel: UILabel = UILabel(frame: CGRect.zero) // Label
    var floatingLabelHeight: CGFloat = 14
    var textField: UITextField = UITextField()
    var _placeholder: String? {
        didSet {
            placeholder = self._placeholder
        }
    } // we cannot override 'placeholder'
    
    var floatingLabelColor: UIColor = UIColor.gray {
        didSet {
            self.floatingLabel.textColor = floatingLabelColor
            self.setNeedsDisplay()
        }
    }
    
    var activeBorderColor: UIColor = UIColor.blue
    
    var floatingLabelFont: UIFont = UIFont.systemFont(ofSize: 14) {
        didSet {
            self.floatingLabel.font = self.floatingLabelFont
            self.font = self.floatingLabelFont
            self.setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.borderStyle = .roundedRect
        self.floatingLabel = UILabel(frame: CGRect.zero)
        self.addTarget(self, action: #selector(self.addFloatingLabel), for: .editingDidBegin)
        self.addTarget(self, action: #selector(self.removeFloatingLabel), for: .editingDidEnd)
    }
    
    @objc func removeFloatingLabel() {
        if self.text == "" {
            UIView.animate(withDuration: 2) {
                self.subviews.forEach{ $0.removeFromSuperview() }
                self.setNeedsDisplay()
            }
            self.placeholder = self._placeholder
        }
        self.layer.borderColor = UIColor.black.cgColor
    }
    
    @objc func addFloatingLabel() {
        if self.text == "" {
            self.floatingLabel.textColor = floatingLabelColor
            self.floatingLabel.font = floatingLabelFont
            self.floatingLabel.text = self._placeholder
            self.floatingLabel.translatesAutoresizingMaskIntoConstraints = false
            self.floatingLabel.clipsToBounds = true
            self.floatingLabel.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.floatingLabelHeight)
            self.layer.borderColor = self.activeBorderColor.cgColor
            self.addSubview(self.floatingLabel)
            
            self.floatingLabel.bottomAnchor.constraint(equalTo:
                                                        self.topAnchor, constant: 0).isActive = true
            // Remove the placeholder
            self.placeholder = ""
        }
        self.setNeedsDisplay()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
