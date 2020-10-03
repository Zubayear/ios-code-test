import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var table: UITableView!
    
    var res = [Resource]()
    var anotherArray = [Custom]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeName()
        self.table.dataSource = self
        self.table.delegate = self
        self.table.reloadData()
        table.register(UINib(nibName: "DetailCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    func helper(title: String, fullname: String, primaryTeam: String, avater: String, caption: String, photo: String) {
        self.anotherArray.append(Custom(avatar: avater, fullname: fullname, primaryTeam: primaryTeam, title: title, photo: photo, caption: caption))
        
    }
    
    func observeName() {
        InfoAPI.retrieveInfo { (value, error) in
            DispatchQueue.main.async {
                self.res = value?.results.resources as! [Resource]
                self.table.reloadData()
                for i in self.res {
                    self.helper(title: i.event.title, fullname: i.owner.fullname, primaryTeam: i.owner.primaryTeam.rawValue, avater: i.owner.avatar, caption: i.caption, photo: i.photo)
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        res.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! DetailCell
        let custom = self.anotherArray[indexPath.row]
        cell.updateView(custom: custom)
        return cell
    }
}

