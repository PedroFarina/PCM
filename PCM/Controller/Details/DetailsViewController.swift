//
//  DetailsViewController.swift
//  PCM
//
//  Created by Francielly Cristina Ortiz Candido on 18/10/21.
//

import Foundation
import Simple_QR_Reader
import UIKit

internal class DetailsViewController: UIViewController {

    private var activity: PCMActivity

    init(with activity: PCMActivity) {
        self.activity = activity
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        return nil
    }
    
    private lazy var conclusionButton: UIBarButtonItem = {
        var conclusionButton = UIBarButtonItem()
        conclusionButton = UIBarButtonItem(title: "Concluir", style: UIBarButtonItem.Style.plain, target: self, action: #selector(conclusionTap(_:)))
        conclusionButton.tintColor = .buttonColor
        return conclusionButton
    }()
    
    private lazy var commentButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let configuration = UIImage.SymbolConfiguration(pointSize: 24)
        button.addTarget(self, action: #selector(commentTap(_:)), for: .touchUpInside)
        button.setImage(UIImage(systemName: "plus.bubble.fill", withConfiguration: configuration), for: .normal)
        button.tintColor = .buttonColor
        return button
    }()
    
    private lazy var problemsButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let configuration = UIImage.SymbolConfiguration(pointSize: 24)
        button.addTarget(self, action: #selector(impedimentsTap(_:)), for: .touchUpInside)
        button.setImage(UIImage(systemName: "nosign", withConfiguration: configuration), for: .normal)
        button.tintColor = .buttonColor
        return button
    }()
    
    private lazy var qrcodeButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let configuration = UIImage.SymbolConfiguration(pointSize: 24)
        button.addTarget(self, action: #selector(qrSessionTap(_:)), for: .touchUpInside)
        button.setImage(UIImage(systemName: "qrcode.viewfinder", withConfiguration: configuration), for: .normal)
        button.tintColor = .buttonColor
        return button
    }()
    
    private lazy var turnButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let configuration = UIImage.SymbolConfiguration(pointSize: 24)
        button.addTarget(self, action: #selector(turnTap(_:)), for: .touchUpInside)
        button.setImage(UIImage(systemName: "diamond.circle.fill", withConfiguration: configuration), for: .normal)
        button.tintColor = .buttonColor
        return button
    }()
    
    private var addTimeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(includeTap(_:)), for: .touchUpInside)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .buttonColor
        return button
    }()
    
    private var stopButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .yellowProt
        button.layer.cornerRadius = 14
        button.setTitle("Parar", for: .normal)
        button.setTitleColor(.blackProt, for: .normal)
        button.addTarget(self, action: #selector(includeTap(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var tableViewDataSource = ActivityLogTableViewDataSource(with: activity)
    private let tableViewDelegate = DetailsTableViewDelegate()
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 50
        tableView.dataSource = tableViewDataSource
        tableView.delegate = tableViewDelegate
        tableView.register(ActivityLogTableViewCell.self, forCellReuseIdentifier: ActivityLogTableViewCell.identifier)
        return tableView
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
    
    private var containerFlipView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .bgColor
        containerView.layer.cornerRadius = 7
        containerView.isHidden = true
        return containerView
    }()
    
    private var addTimeView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .segmentedColor
        containerView.layer.cornerRadius = 7
        return containerView
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
    
    private lazy var infoText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.text = activity.description
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 3
        label.textColor = .blackProt
        return label
    }()
    
    private var titleTable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .headline)
        label.adjustsFontForContentSizeCategory = true
        label.text = "Registro de Atividades"
        label.textColor = .blackProt
        return label
    }()
    
    private var resumoView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .headline)
        label.adjustsFontForContentSizeCategory = true
        label.text = "Resumo"
        label.isHidden = true
        label.textColor = .blackProt
        return label
    }()
    
    private var funcOficialView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.text = "Funcionários oficiais: "
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 3
        label.isHidden = true
        label.textColor = .blackProt
        return label
    }()
    
    private var funcMeioOficialView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.text = "Funcionários meio-oficiais: "
        label.isHidden = true
        label.textColor = .blackProt
        return label
    }()
    
    private var hourFuncMeioOficialView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.text = "2h40min"
        label.isHidden = true
        label.textColor = .blackProt
        return label
    }()
    
    private var hourFuncOficialView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.text = "1h30min"
        label.isHidden = true
        label.textColor = .blackProt
        return label
    }()
    
    // TODO: verificar se essa função realmente será necessária quando mergear essa PR na develop
    private lazy var backButton: UIBarButtonItem = {
        var backButton = UIBarButtonItem()
        backButton = UIBarButtonItem(title: "Voltar", style: UIBarButtonItem.Style.plain, target: self, action: #selector(returnTap(_:)))
        backButton.tintColor = .buttonColor
        return backButton
    }()
    
    //TODO: isso aqui é útil?
    private var labels: [UILabel] = []
    
    private func labelGenerator () -> (leftLabel: UILabel, rightLabel: UILabel) {
        let leftLabel = UILabel()
        leftLabel.translatesAutoresizingMaskIntoConstraints = false
        leftLabel.font = .preferredFont(forTextStyle: .body)
        leftLabel.textAlignment = .left
        let rightLabel = UILabel()
        rightLabel.translatesAutoresizingMaskIntoConstraints = false
        rightLabel.font = .preferredFont(forTextStyle: .body)
        rightLabel.textAlignment = .right
        return (leftLabel, rightLabel)
    }
    
    private lazy var constraints: [NSLayoutConstraint] = {
        [
            infoContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.135),
            infoContainer.heightAnchor.constraint(equalToConstant: 104),
            infoContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            infoContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
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
            //TODO: trocar ordem da 145 com a 143 pra manter consistência
            infoText.widthAnchor.constraint(equalToConstant: 345),
            
            commentButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.height * 0.05),
            commentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            problemsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.height * 0.05),
            problemsButton.trailingAnchor.constraint(equalTo: commentButton.leadingAnchor, constant: -20),
            
            qrcodeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.height * 0.05),
            qrcodeButton.trailingAnchor.constraint(equalTo: commentButton.leadingAnchor, constant: -70),
            
            turnButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.height * 0.05),
            turnButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            titleTable.topAnchor.constraint(equalTo: infoContainer.bottomAnchor, constant: 20),
            titleTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            tableView.topAnchor.constraint(equalTo: titleTable.bottomAnchor, constant: -20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            tableView.bottomAnchor.constraint(equalTo: stopButton.topAnchor, constant: -view.frame.height * 0.07),
            
            stopButton.heightAnchor.constraint(equalToConstant: 56),
            stopButton.widthAnchor.constraint(equalToConstant: 240),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.bottomAnchor.constraint(equalTo: commentButton.topAnchor, constant: -view.frame.height * 0.04),
            
            containerFlipView.topAnchor.constraint(equalTo: infoContainer.bottomAnchor, constant: 50),
            containerFlipView.heightAnchor.constraint(equalToConstant: 260),
            containerFlipView.widthAnchor.constraint(equalToConstant: 360),
            containerFlipView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            resumoView.topAnchor.constraint(equalTo: containerFlipView.topAnchor, constant: 10),
            resumoView.centerXAnchor.constraint(equalTo: containerFlipView.centerXAnchor),
            
            funcOficialView.topAnchor.constraint(equalTo: resumoView.bottomAnchor, constant: 10),
            funcOficialView.leadingAnchor.constraint(equalTo: containerFlipView.leadingAnchor, constant: 10),
            
            hourFuncOficialView.topAnchor.constraint(equalTo: resumoView.bottomAnchor, constant: 10),
            hourFuncOficialView.leadingAnchor.constraint(equalTo: funcOficialView.trailingAnchor, constant: 93),
            hourFuncOficialView.trailingAnchor.constraint(equalTo: containerFlipView.trailingAnchor, constant: -10),
            
            funcMeioOficialView.topAnchor.constraint(equalTo: funcOficialView.bottomAnchor, constant: 10),
            funcMeioOficialView.leadingAnchor.constraint(equalTo: containerFlipView.leadingAnchor, constant: 10),
            
            hourFuncMeioOficialView.topAnchor.constraint(equalTo: hourFuncOficialView.bottomAnchor, constant: 10),
            hourFuncMeioOficialView.leadingAnchor.constraint(equalTo: funcMeioOficialView.trailingAnchor),
            hourFuncMeioOficialView.trailingAnchor.constraint(equalTo: containerFlipView.trailingAnchor, constant: -25),
            
            
            
        ]
    }()
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .detailsBg
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        self.navigationItem.title = activity.name
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
        view.addSubview(titleTable)
        view.addSubview(tableView)
        view.addSubview(stopButton)
        view.addSubview(turnButton)
        view.addSubview(containerFlipView)
        view.addSubview(resumoView)
        view.addSubview(funcOficialView)
        view.addSubview(hourFuncOficialView)
        view.addSubview(funcMeioOficialView)
        view.addSubview(hourFuncMeioOficialView)
    }
    
    internal override func viewDidLayoutSubviews() {
        NSLayoutConstraint.activate(constraints)
    }

    @objc private func includeTap (_ sender: UIButton) {
        activity.timeElapsed += 6000
        addTimeLabel.text = activity.getTimeElapsedString()
    }
    
    @objc private func conclusionTap (_ sender: UIButton) {
       
    }
    
    @objc private func returnTap (_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

    @objc private func impedimentsTap (_ sender: UIButton){
        let vc = ImpedimentsViewController()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .popover
        self.present(nav, animated: true)
    }
    
    @objc private func turnTap(_ sender: UIButton){
        tableView.isHidden.toggle()
        if tableView.isHidden == true{
            titleTable.text = "Relatório"
            containerFlipView.isHidden = false
            funcOficialView.isHidden = false
            hourFuncOficialView.isHidden = false
            resumoView.isHidden = false
            hourFuncMeioOficialView.isHidden = false
            funcMeioOficialView.isHidden = false
        }
        else {
            titleTable.text = "Registro de atividades"
            containerFlipView.isHidden = true
            funcOficialView.isHidden = true
            hourFuncOficialView.isHidden = true
            resumoView.isHidden = true
            hourFuncMeioOficialView.isHidden = true
            funcMeioOficialView.isHidden = true
        }
        
        
    }

    @objc private func qrSessionTap (_ : UIButton){
        let vc = SimpleQRViewController()
        vc.delegate = self
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true)
    }
    
    @objc private func commentTap (_ sender: UIButton) {
        let alertController = UIAlertController(title: "Adicionar comentário", message: "", preferredStyle: .alert)
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Comentário"
            textField.becomeFirstResponder()
        }
        
        let saveAction = UIAlertAction(title: "Concluir", style: .default, handler: { alert -> Void in
            guard let firstTextField = alertController.textFields?[0] else {return}
            if let text = firstTextField.text, text.trimmingCharacters(in: .whitespaces) != "" {
                let comment = ModelController.createComment(with: firstTextField.text ?? "Comentário vazio")
                self.activity.comments.append(comment)
                self.tableView.reloadData()
            }
        })
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: { (action : UIAlertAction!) -> Void in })


        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)

        self.present(alertController, animated: true, completion: nil)
    }
}

extension DetailsViewController: SimpleQROutputDelegate {
    func viewDidSetup() {
        
    }
    
    func qrCodeFound(_ value: String) {
        print(value)
    }
    
    func viewWasDismissed() {
        
    }
}
 
