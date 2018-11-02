//
//  SectionsListViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import AnimatedCollectionViewLayout

class SectionsListViewController: DefaultViewController {
    
    var viewModel: SectionsListViewModel!
    
    @IBOutlet weak var sectionNameLabel: UILabel! {
        didSet {
            sectionNameLabel.text = ""
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK: IBActions
    
    @IBAction func leftMenuButtonTapped() {
        self.showLeftMenu()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.contentInsetAdjustmentBehavior = .never
        prepareBackButton(title: "")
        darkAppearance = true
        
        setupCollectionView()
    }
    
    // MARK: - Private
    
    private func setupCollectionView() {
        collectionView?.isPagingEnabled = true
        let layout = AnimatedCollectionViewLayout()
        let direction: UICollectionView.ScrollDirection = .horizontal
        layout.scrollDirection = direction
        layout.animator = ParallaxAttributesAnimator()
        collectionView.collectionViewLayout = layout
        let nib = UINib(nibName: "SectionItemCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: SectionItemCollectionViewCell.reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

extension SectionsListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let numberOfItems = viewModel.numberOfItems()
        self.pageControl.numberOfPages = numberOfItems
        
        return numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SectionItemCollectionViewCell.reuseIdentifier, for: indexPath) as? SectionItemCollectionViewCell else {
            fatalError("Cannot dequeue cell")
        }
        
        let index = indexPath.row
        let itemViewModel = viewModel.getItemViewModel(index: index)
        cell.update(itemViewModel)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.size.width
        let height = self.view.frame.size.height

        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let index = indexPath.row
        let itemViewModel = viewModel.getItemViewModel(index: index)
        
        self.sectionNameLabel.text = itemViewModel.sectionName
        self.pageControl.currentPage = index
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.row
        viewModel.sectionWasSelected(index: index)
    }
}
