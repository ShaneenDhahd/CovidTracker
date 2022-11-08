//
//  CovidCell.swift
//  Covid Tracker
//
//  Created by Shaneen Dhahd on 04/11/2022.
//

import UIKit

class CovidCell: UITableViewCell {

	@IBOutlet var hospitalLabel: UILabel!
	@IBOutlet var deathLabel: UILabel!
	@IBOutlet var negativeLabel: UILabel!
	@IBOutlet var infectedLabel: UILabel!
	@IBOutlet var covidContentView: UIView!
	override func awakeFromNib() {
        super.awakeFromNib()
		
		contentView.layer.cornerRadius = 15
        // Initialization code
    }

	func initCell(_ data: CovidModelElement) {
		if let positive = data.positive?.format() {
			infectedLabel.text = "\(positive)"
		}
		if let negative = data.negative?.format() {
			negativeLabel.text = "\(negative)"
		}
		if let hospital = data.hospitalized?.format() {
			hospitalLabel.text = "\(hospital)"
		}
		if let death = data.death?.format() {
			deathLabel.text = "\(death)"
		}
	}
	@IBOutlet var neg: UILabel!
	override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
