//
//  aboutTheAppViewController.swift
//  perifaAPP
//
//  Created by Thallis Sousa on 19/07/21.


import UIKit

class aboutTheAppViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var sobreNos: UILabel!
    @IBOutlet weak var juntosSomosNos: UILabel!
    @IBOutlet weak var tJuntosSomosNos: UITextView!
    
    public let adaptativeColor = UIColor(named: "aColor")
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private let cellTitles = ["Sobre o SPerifa",
                              "Avaliar o aplicativo",
                              "Compartilhar aplicativo",
                              "Enviar sugestão de local",
                              "Reportar erro"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.frame = CGRect(x: 10, y: 30, width: (view.frame.size.width) - 20, height: 230)
        tableView.clipsToBounds = true
        tableView.backgroundColor = .white
        self.tableView.layer.cornerRadius = 14.0
        
        var frame = CGRect.zero
        frame.size.height = .leastNormalMagnitude
        tableView.tableHeaderView = UIView(frame: frame)
        
        view.addSubview(tableView)

        
        configNavBar()
    }
    

    
    
    func configNavBar() {
        //MARK: configurações da navigation e da NavBar
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Sobre"
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "OrangeApp") as Any]
        navBarAppearance.backgroundColor = .white
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        content.text = cellTitles[indexPath.row]
        content.textProperties.color = UIColor(named: "OrangeApp")!
        
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
}
