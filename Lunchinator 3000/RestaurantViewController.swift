//
//  RestaurantViewController.swift
//  Lunchinator 3000
//
//  Created by Patrick Ridd on 7/11/17.
//  Copyright © 2017 PatrickRidd. All rights reserved.
//

import UIKit

class RestaurantViewController: UIViewController {
    
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var segmentController: UISegmentedControl!
    
    var restaurant: Restaurant?
    var currentViewController: UIViewController?
    
    // ViewControllers for SegmentControl
    lazy var detailsViewController: UIViewController? = {
        let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "restaurantDetailVC") as? RestaurantDetailViewController
        detailsVC?.restaurant = self.restaurant
        return detailsVC
    }()
    
    lazy var reviewsPageViewController : UIViewController? = {
        let reviewsPageVC = self.storyboard?.instantiateViewController(withIdentifier: "reviewsPageVC") as? ReviewsPageViewController
        reviewsPageVC?.restaurant = self.restaurant
        return reviewsPageVC
    }()

    enum TabIndex : Int {
        case detailsTab = 0
        case reviewsTab = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let restaurant = self.restaurant {
            self.updatePage(with: restaurant)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let currentViewController = currentViewController {
            currentViewController.viewWillDisappear(animated)
        }
    }

    func updatePage(with restaurant: Restaurant) {
        self.title = restaurant.name
        segmentController.selectedSegmentIndex = TabIndex.detailsTab.rawValue
        displayCurrentTab(TabIndex.detailsTab.rawValue)
        

    }
    
    // MARK: - Switching Tabs Functions
    @IBAction func switchTabs(_ sender: UISegmentedControl) {
        self.currentViewController?.view.removeFromSuperview()
        self.currentViewController?.removeFromParentViewController()
        
        displayCurrentTab(sender.selectedSegmentIndex)
    }
    

    func displayCurrentTab(_ tabIndex: Int){
        if let viewController = viewControllerForSelectedSegmentIndex(tabIndex) {
            
            self.addChildViewController(viewController)
            viewController.didMove(toParentViewController: self)
            
            viewController.view.frame = self.containerView.bounds
            self.containerView.addSubview(viewController.view)
            self.currentViewController = viewController
        }
    }
    
    func viewControllerForSelectedSegmentIndex(_ index: Int) -> UIViewController? {
        var viewController: UIViewController?
        switch index {
        case TabIndex.detailsTab.rawValue :
            viewController = detailsViewController
        case TabIndex.reviewsTab.rawValue :
            viewController = reviewsPageViewController
        default:
            return nil
        }
        
        return viewController
    }


    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
