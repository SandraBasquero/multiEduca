//
//  LevelsView.swift
//  MultiEduca
//
//  Created by Sandra on 25/3/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import UIKit


class LevelsView: BaseViewController<LevelsPresenter>,
    UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var sectionSelectedData:SectionCellViewModel?
    private let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    private var levels:[Int]?
    
    
    // MARK: - Live circle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.start()
        if let id = sectionSelectedData?.id {
            self.presenter.getLevelsForGameId(id)
        }
    }

    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator)
    {
        if UIDevice.current.orientation.isLandscape {
            setLayout()
        } 
    }
    
    
    // MARK: - UITableView data source and delegates
    func setData(data:SectionCellViewModel)
    {
        sectionSelectedData = data
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 1
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return levels?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as! TitleCollectionViewCell
        cell.layer.cornerRadius = 10
        let shadowPath2 = UIBezierPath(rect: cell.bounds)
        cell.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: CGFloat(3.0), height: CGFloat(3.0))
        cell.layer.shadowOpacity = 0.3
        cell.layer.shadowPath = shadowPath2.cgPath
        cell.titleCell.text = String(format: "level_levels_button_text".localized, levels?[indexPath.section] ?? 0)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let cell = collectionView.cellForItem(at: indexPath) as! TitleCollectionViewCell
        if let gameId = sectionSelectedData?.id {
            presenter.goToGame(gameId: gameId, levelId: presenter.getIdLevelOfIndex(indexPath.section, inGame: gameId), title: cell.titleCell.text ?? "")
        }
    }
    
    
    // MARK: - Collection View layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        let totalCellWidth =  (Int(self.collectionView.frame.width)/2)
        let leftInset = (collectionView.frame.width - CGFloat(totalCellWidth))
        let rightInset = leftInset
        return UIEdgeInsets.init(top: 25, left: leftInset, bottom: 0, right: rightInset)
    }
}


// MARK: - LevelsViewContract
extension LevelsView: LevelsViewContract {
    
    func prepareViews()
    {
        setupViews()
    }
    
    
    func setLevelsGame(levels: [Int])
    {
        self.levels = levels
        collectionView.reloadData()
    }
    
    
    func showAlert(title: String?, message: String?)
    {
        self.showSimpleAlert(title: title, message: message, buttonText: "home_error_button".localized) { (alert) in
            self.presenter.goToHomeMenu()
        }
    }
}


// MARK: - LevelsView
extension LevelsView {
    
   fileprivate func setupViews()
    {
        self.navigationItem.title = sectionSelectedData?.name.uppercased()
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = UIColor.darkGray
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.darkGray, NSAttributedString.Key.font: UIFont(name: Constants.Styles.primaryFont, size: 22)!]
        TitleCollectionViewCell.registerCellForCollectionView(collectionView)
        setLayout()
        showHomeButtonOnNavigationBar(false)
    }
    
    
    fileprivate func setLayout()
    {
        layout.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        layout.itemSize = self.setCellSize()
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 15
        collectionView!.collectionViewLayout = layout
        collectionView.contentInset.top = 20
    }
    
    
    fileprivate func setCellSize() -> CGSize
    {
        let cellWidth:Int
        let cellHeight:Int
        cellWidth = (Int(self.collectionView.frame.width)/2)
        cellHeight = 50
        return CGSize(width: cellWidth, height: cellHeight)
    }
}

