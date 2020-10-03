import UIKit

class DetailCell: UITableViewCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var fullname: UILabel!
    @IBOutlet weak var primaryTeam: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var caption: UILabel!

    
    func updateView(custom: Custom) {
        avatar.image = getImage(from: custom.avatar)
        fullname.text = custom.fullname
        primaryTeam.text = custom.primaryTeam
        title.text = custom.title
        photo.image = getImage(from: custom.photo)
        caption.text = custom.caption
    }
    
    func getImage(from string: String) -> UIImage? {

        guard let url = URL(string: string)
            else {
//                print("Unable to create URL")
                return nil
        }

        var image: UIImage? = nil
        do {
 
            let data = try Data(contentsOf: url, options: [])


            image = UIImage(data: data)
        }
        catch {
//            print(error.localizedDescription)
        }

        return image
    }
    
}
