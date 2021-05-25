//
//  SermonTableViewCell.swift
//  JesusPeople
//
//  Created by Desiree on 5/25/21.
//

import UIKit

class SermonTableViewCell: UITableViewCell {
    
    @IBOutlet var thumbnail: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(for row: Int) {
        if let url = URL(string: SermonsDataManger.instance.sermonVideosArray[row].thumbnail) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async { [self] in
                        thumbnail.image = UIImage(data: data)
                        titleLabel.text = SermonsDataManger.instance.sermonVideosArray[row].title.uppercased()
                        dateLabel.text = SermonsDataManger.instance.sermonVideosArray[row].date
                    }
                         
                }
            }
        }
        
    }

}
