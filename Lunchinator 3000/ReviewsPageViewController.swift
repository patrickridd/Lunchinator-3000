//
//  ReviewsPageViewController.swift
//  Lunchinator 3000
//
//  Created by Patrick Ridd on 7/12/17.
//  Copyright © 2017 PatrickRidd. All rights reserved.
//

import UIKit

class ReviewsPageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    
    var restaurant: Restaurant?
    var reviews: [Review] = []
    var reviewViewControllers: [ReviewViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.dataSource = self
        
        

        let appearance = UIPageControl.appearance(whenContainedInInstancesOf: [UIPageViewController.self])
        appearance.pageIndicatorTintColor = UIColor.lightGray
        appearance.currentPageIndicatorTintColor = UIColor.darkGray

        
        guard let restaurant = self.restaurant else { return }
        getReviews(restaurant: restaurant)
    }
    
    func getReviews(restaurant: Restaurant) {
        
        ReviewController.sharedController.getReviews(for: restaurant.name, completion: { (reviews) in
            if let reviews = reviews {
                self.reviews = reviews
            }

            self.setupReviewViewControllers()
        })
    }
   
    
    func setupReviewViewControllers() {
        for review in reviews {
            guard let reviewVC = storyboard?.instantiateViewController(withIdentifier: "reviewVC") as? ReviewViewController else { continue }
            
            reviewVC.review = review
            self.reviewViewControllers.append(reviewVC)
        }
        setFirstReviewViewController()
    }
    
    func setFirstReviewViewController() {
        if let firstViewController = reviewViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
    }
    
    
    // MARK PageViewController delegate and datasource
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.reviews.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = reviewViewControllers.first,
            let firstViewControllerIndex = reviewViewControllers.index(of: firstViewController) else {
                return 0
        }
        
        return firstViewControllerIndex
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let reviewVC = viewController as? ReviewViewController, let viewControllerIndex = self.reviewViewControllers.index(of: reviewVC) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard reviewViewControllers.count > previousIndex else {
            return nil
        }
        
        return reviewViewControllers[previousIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let reviewVC = viewController as? ReviewViewController, let viewControllerIndex = self.reviewViewControllers.index(of: reviewVC) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = self.reviewViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return reviewViewControllers[nextIndex]
    }

}
