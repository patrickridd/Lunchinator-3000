//
//  RestaurantTableViewController.swift
//  Lunchinator 3000
//
//  Created by Patrick Ridd on 7/11/17.
//  Copyright © 2017 PatrickRidd. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

    @IBOutlet weak var backButton: UIBarButtonItem!
    var restaurants: [Restaurant] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationTitles()
        
        // Get sorted restaurants for Data Source
        RestaurantController.sharedController.getRestaurants { (restaurants) in
            guard let restaurants = restaurants else { return }
            self.restaurants = restaurants
            self.tableView.reloadData()
        }
        
        
        
    }
    

    func setupNavigationTitles() {
        self.title = "Browse Restaurants"
        let barButton = UIBarButtonItem()
        barButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = barButton
    }
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restaurantCell", for: indexPath)

        // Configure the cell...
        let restaurant = self.restaurants[indexPath.row]
        cell.textLabel?.text = "\(restaurant.name) - \(restaurant.waitTime) min. wait"
        

        return cell
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        if segue.identifier == "toRestaurantVC" {
            guard let restaurantVC = segue.destination as? RestaurantViewController,
                let indexPath = tableView.indexPathForSelectedRow else {
                    return
            }
            
            // Get the selected restaurant
            let restaurant = self.restaurants[indexPath.row]
            
            // Pass it to RestaurantViewController
            restaurantVC.restaurant = restaurant
        }
        
    }
    
}
