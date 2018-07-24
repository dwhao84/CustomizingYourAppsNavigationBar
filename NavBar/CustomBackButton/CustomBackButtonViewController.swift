/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Demonstrates using a custom back button image (no back arrow and text).
*/

import UIKit

class CustomBackButtonViewController: UITableViewController {

    /// Our data source is an array of city names, populated from Cities.json.
    var dataSource: CitiesDataSource!
    
    /// - Tag: BackImageButtonExample
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = CitiesDataSource()
        tableView.dataSource = dataSource
        
        /*  Note that images configured as the back bar button's background do
            not have the current tintColor applied to them, they are displayed as it.
         
            The background should be pinned to the left and not stretch.
        */

        var backButtonBackgroundImage = #imageLiteral(resourceName: "Menu")
        
        backButtonBackgroundImage =
            backButtonBackgroundImage.resizableImage(withCapInsets:
                UIEdgeInsets(top: 0, left: backButtonBackgroundImage.size.width - 1, bottom: 0, right: 0))
        
        let barAppearance =
            UINavigationBar.appearance(whenContainedInInstancesOf: [CustomBackButtonNavController.self])
        barAppearance.backIndicatorImage = backButtonBackgroundImage
        barAppearance.backIndicatorTransitionMaskImage = backButtonBackgroundImage
        
        // Provide an empty backBarButton to hide the 'Back' text present by default in the back button.
        let backBarButtton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtton
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue" {
            let indexPath = tableView.indexPathForSelectedRow
            let city = dataSource.city(index: (indexPath?.row)!)
            if let destinationViewController = segue.destination as? CustomBackButtonDetailViewController {
                destinationViewController.city = city
            }
        }
    }

}
