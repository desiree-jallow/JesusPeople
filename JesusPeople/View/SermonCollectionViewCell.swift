//
//  SermonCollectionViewCell.swift
//  JesusPeople
//
//  Created by Desiree on 6/3/21.
//

import UIKit

class SermonCollectionViewCell: UICollectionViewCell {
    @IBOutlet var thumbnail: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    
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
