//
//  ClubViewController.swift
//  ClubsCollectionView
//
//  Created by tobi adegoroye on 29/05/2021.
//

import UIKit

class ClubViewController: UIViewController {
    
    
    var league: League?
    private lazy var leagueViewModel = LeagueViewModel()
    private lazy var audioManagerViewModel = AudioMangerViewModel()

    init(league: League) {
        super.init(nibName: nil, bundle: nil)
        self.league = league
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.separatorStyle = .none
        tableView.register(TeamTableViewCell.self, forCellReuseIdentifier: TeamTableViewCell.cellId)
        return tableView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
}

extension ClubViewController {
    func setup() {
        
        self.navigationController?.navigationBar.topItem?.title = "Football Chants"
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        view.backgroundColor = .white
        
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ClubViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return leagueViewModel.leagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let team = leagueViewModel.leagues[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: TeamTableViewCell.cellId, for: indexPath) as! TeamTableViewCell
        cell.configure(with: team, delegate: self)
        cell.selectionStyle = .none
        return cell
    }
}

extension ClubViewController: TeamTableViewCellDelegate {
    func didTapPlayBack(for team: League) {
        audioManagerViewModel.playback(team)
        leagueViewModel.togglePlayback(for: team)
        tableView.reloadData()
        print("The item selected:\(team.name)")
    }
 
}
