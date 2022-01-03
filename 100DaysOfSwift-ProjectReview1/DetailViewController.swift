//
//  DetailViewController.swift
//  100DaysOfSwift-ProjectReview1
//
//  Created by Lucas Maniero on 03/01/22.
//

import UIKit

class DetailViewController: UIViewController {
    var country: Country?
    
    let countryImage: UIImageView = {
        let iv = UIImageView(image: nil)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let countryName: UILabel = {
        let cl = UILabel()
        cl.text = "Country Name"
        cl.font = .systemFont(ofSize: 18)
        cl.textAlignment = .center
        cl.textColor = .darkGray
        cl.translatesAutoresizingMaskIntoConstraints = false
        return cl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.largeTitleDisplayMode = .never
        setupConstraints()
        setupNavigationBar()
    }
    
    private func setupConstraints() {
        view.addSubview(countryImage)
        view.addSubview(countryName)
        let safeArea = view.safeAreaLayoutGuide
        
        //Country Image constraints
        NSLayoutConstraint.activate([
            countryImage.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 8),
            countryImage.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 9),
            countryImage.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -8),
            countryImage.heightAnchor.constraint(lessThanOrEqualTo: safeArea.heightAnchor, multiplier: 0.3)
        ])
        
        // Country Name constraints
        NSLayoutConstraint.activate([
            countryName.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 8),
            countryName.topAnchor.constraint(equalTo: countryImage.bottomAnchor, constant: 16),
            countryName.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -8)
        ])
    }
    
    private func setupNavigationBar() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(tappedShareButton))
    }
    
    @objc func tappedShareButton(){
        let shareItem: [Any] = [country?.name]
        let ac = UIActivityViewController(activityItems: shareItem, applicationActivities: nil)
        present(ac, animated: true)
    }
}
