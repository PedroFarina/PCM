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
            addTimeButton.trailingAnchor.constraint(equalTo: addTimeView.trailingAnchor, constant: -9)
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
        
    }
    
    override internal func viewDidLayoutSubviews() {
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc private func includeTap (_ sender: UIButton) {
        
    }
    
    @objc private func conclusionTap (_ sender: UIButton) {
       
    }
    
    @objc private func returnTap (_ sender: UIButton) {
        
    }
}
