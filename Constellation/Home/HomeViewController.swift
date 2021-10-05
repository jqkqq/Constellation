//
//  ViewController.swift
//  Constellation

import UIKit

class HomeViewController: UIViewController, HomeViewProtocal {

    //MARK: - IBOulet
    @IBOutlet weak var constellationCollectionView: UICollectionView!
    
    //MARK: - properties
    var present: HomePresentProtocal?
    var constellations = [MyConstellation]()
    
    //MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        HomeWireFrame.createHomeModule(viewController: self)
        setCollectionView()
        present?.viewDidLoad()        
    }

    //MARK: - set up UI
    private func setCollectionView() {
        constellationCollectionView.dataSource = self
        constellationCollectionView.delegate = self
        constellationCollectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCell")
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let width = UIScreen.main.bounds.width / 3
        let height = UIScreen.main.bounds.height / 4.2
        layout.itemSize = CGSize(width: width, height: height)
        constellationCollectionView.collectionViewLayout = layout
    }
    
    func showConstellation(_ constellation: [MyConstellation]) {
        constellations = constellation
        constellationCollectionView.reloadData()
    }
}

//MARK: - UICollectionViewDataSource and delegate
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return constellations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as? HomeCollectionViewCell else {
            fatalError()
        }
        let data = constellations[indexPath.row]
        cell.update(data)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        present?.selectConstellation(constellations[indexPath.row], vc: self)
    }
    
}
