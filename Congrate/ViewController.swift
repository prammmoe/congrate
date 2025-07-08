//
//  ViewController.swift
//  Congrate
//
//  Created by Pramuditha Muhammad Ikhwan on 08/07/25.
//

import UIKit

class ViewController: UIViewController {
    // UI Elements
    private let promptLabel: UILabel = {
        let label = UILabel()
        label.text = "What things can you be grateful of this day?"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let gratitudeTextField: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 8
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Simpan", for: .normal)
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 8
        button.addTarget(ViewController.self, action: #selector(saveGratitude), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    private func setupLayout() {
        view.addSubview(promptLabel)
        view.addSubview(gratitudeTextField)
        view.addSubview(saveButton)
        
        // Constraints
        NSLayoutConstraint.activate([
            // Prompt Label
            promptLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            promptLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            promptLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            // TextField
            gratitudeTextField.topAnchor.constraint(equalTo: promptLabel.bottomAnchor, constant: 20),
            gratitudeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            gratitudeTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            gratitudeTextField.heightAnchor.constraint(equalToConstant: 200),
            
            // Save Button
            saveButton.topAnchor.constraint(equalTo: gratitudeTextField.bottomAnchor, constant: 20),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.widthAnchor.constraint(equalToConstant: 200),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: - Actions
    @objc private func saveGratitude() {
        guard let gratitudeText = gratitudeTextField.text, !gratitudeText.isEmpty else {
            // Show an alert if no text is entered
            let alert = UIAlertController(title: "Oops!", message: "Please enter something you're grateful for today.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        // Save the gratitude text, here we just print it for now
        print("Saved gratitude: \(gratitudeText)")
        
        // Clear the text field
        gratitudeTextField.text = ""
    }
}

