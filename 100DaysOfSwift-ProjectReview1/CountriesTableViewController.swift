//
//  ViewController.swift
//  100DaysOfSwift-ProjectReview1
//
//  Created by Lucas Maniero on 03/01/22.
//

import UIKit

class CountriesTableViewController: UITableViewController {
    var countriesImages = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        findFiles()
        self.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Countries"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    private func findFiles(){
        let fs = FileManager.default
        let imagesPath = Bundle.main.resourcePath!
        let bundleItems = try? fs.contentsOfDirectory(atPath: imagesPath)
        
        guard let items = bundleItems else {
            print("Failed to fetch the images. Please try again.")
            return
        }
        
        formatFilesNames(items)
    }
    
    fileprivate func formatFilesNames(_ items: [String]) {
        for item in items {
            if item.hasSuffix("@3x.png") {
                let index = item.firstIndex(of: "@")!
                let countryName = String(item[..<index]).capitalizeFirstLetter()
                countriesImages.append(Country(name: countryName, imageName: item))
                
            }
        }
        countriesImages = countriesImages.sorted(by:  {
            $0.imageName < $1.imageName
        })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countriesImages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell()
        
        // New mode to configure a UITableViewCell using UIListConfiguration
        var content = cell.defaultContentConfiguration()
        content.image = UIImage(named: countriesImages[indexPath.row].imageName)
        content.imageProperties.maximumSize = .init(width: 80, height: 60)
        content.prefersSideBySideTextAndSecondaryText = true
        content.text = countriesImages[indexPath.row].name
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.countryImage.image = UIImage(named: countriesImages[indexPath.row].imageName)
        let countryName = countriesImages[indexPath.row].name
        detailVC.countryName.text = countryName
        detailVC.country = countriesImages[indexPath.row]
        detailVC.navigationItem.title = countryName
        navigationController?.pushViewController(detailVC, animated: true)
    }


}

