//
//  GameAreaView.swift
//  MultiEduca
//
//  Created by Sandra on 1/9/18.
//  Copyright © 2018 Sandra. All rights reserved.
//

import UIKit
import KDDragAndDropCollectionViews

class GameAreaView: BaseViewController<GameAreaPresenter> {
    
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var playgroundCollectionView: KDDragAndDropCollectionView!
    @IBOutlet weak var text: UILabel!
    @IBOutlet var pointsValueLabel: UILabel!
    @IBOutlet var pointsTitleLabel: UILabel!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout!
    
    fileprivate var gameId: String?
    fileprivate var levelId: String?
    fileprivate var barTitle: String?
    var dragAndDropManager : KDDragAndDropManager?
    fileprivate var gameData: [OneTextGameCellViewModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.start()
    }
    
    override func willAnimateRotation(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {}
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { context in
            if UIApplication.shared.statusBarOrientation.isLandscape {
                // activate landscape changes
                self.playgroundCollectionView.backgroundColor = UIColor.orange
                let totalHeight = self.playgroundCollectionView.bounds.height
                self.collectionLayout.sectionInset = UIEdgeInsets(top: totalHeight, left: 0, bottom: 0, right: 0)
            } else {
                // activate portrait changes
                self.playgroundCollectionView.backgroundColor = UIColor.blue
                let totalHeight = self.playgroundCollectionView.bounds.height
                self.collectionLayout.sectionInset = UIEdgeInsets(top: (totalHeight/2) - 105, left: 0, bottom: 0, right: 0)
            }
             self.collectionLayout.invalidateLayout()
        })
    }
    
    func setGameId(_ gameId:String, andLevelId:String, title:String) {
        self.gameId = gameId
        self.levelId = andLevelId
        self.barTitle = title
    }
    
    // MARK: States private implementation
    fileprivate func renderDataState(data: GameAreaViewModel) {
        text.text = data.text
        gameData = data.game
        pointsValueLabel.text = String(data.points)
        pageControl.currentPage = data.currentGamePlaying
        let cellSize = OneTextGameCellCollectionViewCell.calculateCellSize(collectionViewWidth: playgroundCollectionView.frame.width, totalInfo: gameData?.map{$0.title} ?? [])
        collectionLayout.itemSize = cellSize
        collectionLayout.minimumLineSpacing = 10
        collectionLayout.minimumInteritemSpacing = 10
    }
    
    fileprivate func renderErrorState(message: String) {
        self.showSimpleAlert(title: title, message: message, buttonText: "home_error_button".localized) { _ in
            self.presenter.backToLevelScreen()
        }
    }
}

// MARK: - GameAreaViewContract
extension GameAreaView: GameAreaViewContract {
    
    func setupViews() {
        showHomeButtonOnNavigationBar(true)
        if let game = gameId, let level = levelId {
            pageControl.numberOfPages = presenter.getTotalQuestions(gameId: game, levelId: level)
            presenter.getContent(gameId: game, levelId: level)
        }
        OneTextGameCellCollectionViewCell.registerCellForCollectionView(playgroundCollectionView)
        self.dragAndDropManager = KDDragAndDropManager(canvas: self.view, collectionViews: [playgroundCollectionView])
        pointsTitleLabel.text = "game_points_label".localized
        bottomButton.setTitle("game_button_next_page".localized, for: .normal)
        bottomButton.setTitle("game_button_next_page".localized, for: .highlighted)
    }
    
    //Required by ViewContractBase protocol, but not used because of the states implementation
    func showAlert(title: String?, message: String?) {}
    
    func renderState(_ currentState: GameState) {
        switch currentState {
        case .renderData(let data):
            renderDataState(data: data)
        case .error(let message):
            renderErrorState(message: message)
        case .loading:
            print("Loading...")
        }
    }
}

// MARK: - UICollectionViewDataSource
extension GameAreaView {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OneTextGameCellCollectionViewCell.identifier, for: indexPath) as! OneTextGameCellCollectionViewCell
        cell.setData(text: gameData?[indexPath.item].title ?? "")
        cell.isHidden = false
        if let kdCollectionView = collectionView as? KDDragAndDropCollectionView {
            if let draggingPathOfCellBeingDragged = kdCollectionView.draggingPathOfCellBeingDragged {
                if draggingPathOfCellBeingDragged.item == indexPath.item {
                    cell.isHidden = true
                }
            }
        }
        return cell
    }
}

// MARK: - KDDragAndDropCollectionViewDataSource
extension GameAreaView: KDDragAndDropCollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellIsDroppableAtIndexPath indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, cellIsDraggableAtIndexPath indexPath: IndexPath) -> Bool {
        return true
    }

    func collectionView(_ collectionView: UICollectionView, deleteDataItemAtIndexPath indexPath: IndexPath) {
        gameData?.remove(at: indexPath.item)
    }

    func collectionView(_ collectionView: UICollectionView, insertDataItem dataItem: AnyObject, atIndexPath indexPath: IndexPath) {
        if let data = dataItem as? OneTextGameCellViewModel {
            gameData?.insert(data, at: indexPath.item)
        }
    }

    func collectionView(_ collectionView: UICollectionView, moveDataItemFromIndexPath from: IndexPath, toIndexPath to: IndexPath) {
        let fromData: OneTextGameCellViewModel = (gameData?[from.item])!
        gameData?.remove(at: from.item)
        gameData?.insert(fromData, at: to.item)
        print(gameData) //Check sort here!
    }

    func collectionView(_ collectionView: UICollectionView, dataItemForIndexPath indexPath: IndexPath) -> AnyObject {
        return gameData?[indexPath.item] as AnyObject
    }

    func collectionView(_ collectionView: UICollectionView, indexPathForDataItem dataItem: AnyObject) -> IndexPath? {
        guard let candidate = dataItem as? OneTextGameCellViewModel else { return nil }
        for (i,item) in (gameData?.enumerated())! {
            if candidate != item { continue }
            return IndexPath(item: i, section: 0)
        }
        return nil
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension GameAreaView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let totalHeight = collectionView.bounds.height
        return UIEdgeInsets(top: (totalHeight/2) - 105, left: 0, bottom: 0, right: 0)
    }
}

// MARK: - BaseViewControllerDelegate
extension GameAreaView: BaseViewControllerDelegate {
    
    func homeButtonPressed() {
        presenter.backToHomeMenu()
    }
}
