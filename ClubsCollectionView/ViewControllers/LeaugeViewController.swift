 
 import UIKit
 
 class LeaugeViewController: UICollectionViewController {
    
    private let leaugeViewModel = LeagueViewModel()
    
    init() {
        super.init(collectionViewLayout: LeaugeViewController.createLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionNumber, env -> NSCollectionLayoutSection? in
            
            if sectionNumber == 0 {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(300)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1000)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(top: 32, leading: 16, bottom: 0, trailing: 0)
                return section
            } else {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .absolute(400), heightDimension: .absolute(400)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1000)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(top: 32, leading: 16, bottom: 0, trailing: 0)
                return section
            }
        }
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let leauge = leaugeViewModel.leagues[indexPath.row]
        
        
        
        print("Selected: \(leauge)")
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return leaugeViewModel.leagues.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let club = leaugeViewModel.leagues[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LeaugeCollectionView.cellID, for: indexPath) as! LeaugeCollectionView
        cell.configure(league: club,delegate: self)
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        navigationItem.title = "Leauges"
        
        collectionView.register(LeaugeCollectionView.self, forCellWithReuseIdentifier: LeaugeCollectionView.cellID)
        collectionView.dataSource = self
    }
    
 }
 
 
 extension LeaugeViewController: LeagueCollectionViewCellDelegate {
    func didTapButton(leauge: League) {
        
        for team in leauge.teams {
            print("Team name: \(team.name)")
        }
        let vc =  ClubViewController(league: leauge)
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
 }
 
 
 
 
 
 
 
