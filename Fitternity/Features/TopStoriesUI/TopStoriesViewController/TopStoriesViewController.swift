//
//  TopStoriesViewController.swift
//  TopStoriesUI
//
//  Created by Vinodh Govindaswamy on 24/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import NewsShared
import UIKit
import VSCollectionKit

enum NewsSectionType: String {
    case loading
    case news
    case error
}

enum NewsCellType: String {
    case loadingskeleton
    case fullWidthCard
    case card
    case groupedList
    case list
    case error
}

class ButtonWithImage: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if imageView != nil {
            imageEdgeInsets = UIEdgeInsets(top: 15, left: (bounds.width - 20), bottom: 0, right: 0)
            titleEdgeInsets = UIEdgeInsets(top: 15, left: -20, bottom: 0, right: (imageView?.frame.width)!)
        }
    }
}

class TopStoriesViewController: VSCollectionViewController {

    var viewModel: TopStoriesViewAPI?

    override func willAddSectionControllers() {
        super.willAddSectionControllers()
        sectionHandler.addSectionHandler(handler: LoadingSectionHandler())
        sectionHandler.addSectionHandler(handler: newsSectionHandler())
        sectionHandler.addSectionHandler(handler: errorSectionHandler())
    }

    override func viewDidLoad() {
        super.viewDidLoad() 
        observeViewModelUpdates()
        viewModel?.fetchTopStories()

        configureNavigationBar()
        view.backgroundColor = .white
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    func newsSectionHandler() -> SectionHandler {
        return NewsSectionHandler(parentViewController: self.parent)
    }

    func errorSectionHandler() -> SectionHandler {
        return ErrorSectionHandler(viewModel: viewModel as? TopStoriesViewRetryAction)
    }

    override func configureCollectionView() {
        super.configureCollectionView()
        collectionView.backgroundColor =  AppColor.defaultBackgroundColor
    }

    private func configureNavigationBar() {
        //navigationItem.title = viewModel?.title
        //navigationController?.navigationBar.prefersLargeTitles = true
        
        let scanImage    = UIImage(named: "QR_Code_Scanner")!.withRenderingMode(.alwaysOriginal)
        let offerImage    = UIImage(named: "CampaignOffer")!.withRenderingMode(.alwaysOriginal)
        let searchImage  = UIImage(named: "Search")!.withRenderingMode(.alwaysOriginal)

        let scanButton   = UIBarButtonItem(image: scanImage,  style: .plain, target: self, action: #selector(didScanButton))
        let offerButton   = UIBarButtonItem(image: offerImage,  style: .plain, target: self, action: #selector(didOfferButton))
        let searchButton = UIBarButtonItem(image: searchImage,  style: .plain, target: self, action: #selector(didTapSearchButton))
          
        navigationItem.rightBarButtonItems = [scanButton, offerButton, searchButton]
        
        
        let locationButton =  ButtonWithImage(type: .custom)
        locationButton.setImage(UIImage(named: "arrow_down")?.withRenderingMode(.alwaysTemplate), for: .normal)
        locationButton.imageView?.tintColor = UIColor.gray
        locationButton.setTitle("Andheri East, Mumbai", for: .normal)
        locationButton.setTitleColor(UIColor.black, for: .normal)
        locationButton.addTarget(self, action: #selector(didTapSearchButton), for: .touchUpInside)
        locationButton.frame = CGRect(x: 0, y: 0, width: 100, height: 44)
        //button.backgroundColor = UIColor.red
//        button.imageEdgeInsets = UIEdgeInsets(top: 25, left: 50, bottom: 1, right: -50)//move image to the right
//        button.titleEdgeInsets = UIEdgeInsets(top: 25, left: -20, bottom: 1, right: 1)//move image to the right
        let label = UILabel(frame: CGRect(x: 3, y: 0, width: 100, height: 20))
        label.font = UIFont(name: "Roboto-Light", size: 14)
        label.text = "Your Location"
        label.textAlignment = .left
        label.textColor = UIColor.gray
        label.backgroundColor =   UIColor.clear
        locationButton.addSubview(label)
        let barButton = UIBarButtonItem(customView: locationButton)
        self.navigationItem.leftBarButtonItem = barButton
        
    }
    
    @objc func didScanButton(){
        print("scan pressed")
    }
    
    @objc func didOfferButton(){
        print("offer pressed")
    }

    @objc func didTapSearchButton()
    {
        print("search pressed")
    }

    @objc func didTapLocationButton()
    {
        print("location pressed")
    }
    
    private func observeViewModelUpdates() {
        viewModel?.viewUpdateHandler = { [weak self] (collectionData, errrMessage) in
            guard let self = self else { return }
            guard let collectionViewData = collectionData else { return }
            self.apply(collectionData: collectionViewData, animated: true)
        }
    }
}

extension TopStoriesViewController {
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (context) in
            self.collectionView.collectionViewLayout.invalidateLayout()
            self.collectionView.reloadData()
        }, completion: nil)
    }
}
