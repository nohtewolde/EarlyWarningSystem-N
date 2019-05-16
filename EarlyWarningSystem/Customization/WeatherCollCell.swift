//
//  WeatherCollCellCollectionViewCell.swift
//  EarlyWarningSystem
//
//  Created  on 12/24/18.

//

import UIKit

class WeatherCollCell: UICollectionViewCell {
    
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    @IBOutlet weak var timezone: UILabel!
    @IBOutlet weak var date: UILabel!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateCell(highTemp : Double, lowTemp : Double, timezone : String, date : String) {
        self.highTemp.text = "H: \(highTemp)F"
        self.lowTemp.text = "L: \(lowTemp)F"
        self.timezone.text = timezone
        self.date.text = date
    }
}
