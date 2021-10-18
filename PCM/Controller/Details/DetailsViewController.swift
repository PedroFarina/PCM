//
//  DetailsViewController.swift
//  PCM
//
//  Created by Francielly Cristina Ortiz Candido on 18/10/21.
//

import Foundation
import UIKit

internal class DetailsViewController: UIViewController{
    
    private lazy var conclusionButton: UIBarButtonItem = {
        var conclusionButton = UIBarButtonItem()
        conclusionButton = UIBarButtonItem(title: "Concluir", style: UIBarButtonItem.Style.plain, target: self, action: #selector(conclusionTap(_:)))
        conclusionButton.tintColor = .buttonColor
        return conclusionButton
    }()
    
    private lazy var commentButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(includeTap(_:)), for: .touchUpInside)
        button.setImage(UIImage(systemName: "plus.bubble.fill"), for: .normal)
        button.tintColor = .buttonColor
        return button
    }()
    
    private lazy var problemsButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(includeTap(_:)), for: .touchUpInside)
        button.setImage(UIImage(systemName: "nosign"), for: .normal)
        button.tintColor = .buttonColor
        return button
    }()
    
    private lazy var qrcodeButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(includeTap(_:)), for: .touchUpInside)
        button.setImage(UIImage(systemName: "qrcode.viewfinder"), for: .normal)
        button.tintColor = .buttonColor
        return button
    }()
        
    private var infoContainer: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .bgColor
        containerView.layer.cornerRadius = 7
        containerView.layer.shadowColor = UIColor.shadowColor?.cgColor
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowOffset = CGSize(width: 0, height: 3)
        containerView.layer.shadowRadius = 1
        return containerView
    }()
    
    private var addTimeView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .segmentedColor
        containerView.layer.cornerRadius = 7
        return containerView
    }()
    
    private var addTimeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(includeTap(_:)), for: .touchUpInside)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .buttonColor
        return button
    }()
    
    private var day: Int = {
        var day = Int()
        day = 0
        return day
    }()
    
    private var hour: Int = {
        var hour = Int()
        hour = 0
        return hour
    }()
    
    private var min: Int = {
        var min = Int()
        min = 0
        return min
    }()
    
    private var addTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .headline)
        label.adjustsFontForContentSizeCategory = true
        label.text = "0d 0h 0m"
        label.textColor = .blackProt
        return label
    }()
    
    private var infoText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.text = "Construção do segundo andar do prédio Chateaux d’Artigny"
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 3
        label.textColor = .blackProt
        return label
    }()
    
    // TODO: verificar se essa função realmente será necessária quando mergear essa PR na develop
    private lazy var backButton: UIBarButtonItem = {
        var backButton = UIBarButtonItem()
        backButton = UIBarButtonItem(title: "Atividades", style: UIBarButtonItem.Style.plain, target: self, action: #selector(returnTap(_:)))
        backButton.tintColor = .buttonColor
        return backButton
    }()
    
    private lazy var constraints: [NSLayoutConstraint] = {
        [
            infoContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.135),
            infoContainer.heightAnchor.constraint(equalToConstant: 104),
            infoContainer.widthAnchor.constraint(equalToConstant: 345),
            infoContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            addTimeView.topAnchor.constraint(equalTo: infoContainer.topAnchor, constant: 10),
            addTimeView.heightAnchor.constraint(equalToConstant: 30),
            addTimeView.widthAnchor.constraint(equalToConstant: 159),
            addTimeView.leadingAnchor.constraint(equalTo: infoContainer.leadingAnchor, constant: 10),
            
            addTimeButton.topAnchor.constraint(equalTo: addTimeView.topAnchor, constant: 4),
            addTimeButton.trailingAnchor.constraint(equalTo: addTimeView.trailingAnchor, constant: -9),
            
            addTimeLabel.topAnchor.constraint(equalTo: addTimeView.topAnchor, constant: 4),
            addTimeLabel.leadingAnchor.constraint(equalTo: addTimeView.leadingAnchor, constant: 10),
            
            infoText.topAnchor.constraint(equalTo: addTimeView.bottomAnchor, constant: 10),
            infoText.leadingAnchor.constraint(equalTo: infoContainer.leadingAnchor, constant: 10),
            infoText.widthAnchor.constraint(equalToConstant: 345),
            
            commentButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.height * 0.05),
            commentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            problemsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.height * 0.05),
            problemsButton.trailingAnchor.constraint(equalTo: commentButton.leadingAnchor, constant: -20),
            
            qrcodeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.height * 0.05),
            qrcodeButton.trailingAnchor.constraint(equalTo: commentButton.leadingAnchor, constant: -60)
            
        ]
    }()
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .detailsBg
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        self.navigationItem.title = "Atividade X"
        navigationItem.rightBarButtonItem = conclusionButton
        navigationItem.leftBarButtonItem = backButton
       
        
        view.addSubview(infoContainer)
        view.addSubview(addTimeView)
        view.addSubview(addTimeButton)
        view.addSubview(addTimeLabel)
        view.addSubview(infoText)
        view.addSubview(commentButton)
        view.addSubview(problemsButton)
        view.addSubview(qrcodeButton)
        
    }
    
    internal override func viewDidLayoutSubviews() {
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc private func includeTap (_ sender: UIButton) {
        day = day + 1
        hour = hour + 1
        min = min + 30
        if min == 60 {
            min = 0
            hour = hour + 1
        }
        addTimeLabel.text = "\(day)d \(hour)h \(min)m"
    }
    
    @objc private func conclusionTap (_ sender: UIButton) {
       
    }
    
    @objc private func returnTap (_ sender: UIButton) {
        
    }
}
