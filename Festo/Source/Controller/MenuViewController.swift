//
//  MenuViewController.swift
//  Festo
//
//  Created by Emilly Maia on 05/12/22.
//

import UIKit

class MenuViewController: UIViewController {
    public var selectedFood: Set<FoodModel> = []
    public var selectedIndexPaths = Set<IndexPath>()
    private var sectionTitle = [String]()
    var menuView = MenuView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = menuView
        menuView.menuTableView.delegate = self
        menuView.menuTableView.dataSource = self
        sectionTitle = ["Comidas", "Doces", "Bebidas", "Bebidas +18"]

    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        switch section {
        case 0:
            return foods.count
        case 1:
            return drinks.count
        case 2:
            return alcoholicDrinks.count
        default:
            return 3
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 24
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.identifier, for: indexPath) as?
                MenuTableViewCell else {
            return UITableViewCell(style: .default, reuseIdentifier: MenuTableViewCell.identifier)
        }

        switch indexPath.section {
        case 0:
            cell.configureCellInformations(text: foods[indexPath.row].name,
                                           imageName: foods[indexPath.row].imageFood ?? "")
        case 1:
            cell.configureCellInformations(text: drinks[indexPath.row].name,
                                           imageName: drinks[indexPath.row].imageDrink ?? "")
        case 2:
            cell.configureCellInformations(text: alcoholicDrinks[indexPath.row].name,
                                           imageName: alcoholicDrinks[indexPath.row].imageAlcoholic ?? "")
        default:
            cell.configureCellInformations(text: "menu", imageName: "pizza")
        }

        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? MenuTableViewCell else { return }
        if selectedIndexPaths.contains(indexPath) {
            cell.checkList.image = UIImage(systemName: "circle.fill")
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? MenuTableViewCell else {
            return
        }
        if
            let indexPathsForSelectedRowstableView = tableView.indexPathsForSelectedRows,
            indexPathsForSelectedRowstableView.contains(indexPath)
        {
            tableView.deselectRow(at: indexPath, animated: true)
        }

        let food = foods[indexPath.row]

        if selectedIndexPaths.contains(indexPath) {
            cell.checkList.image = UIImage(systemName: "circle")
            selectedIndexPaths.remove(indexPath)
            selectedFood.remove(food)
        } else {
            cell.checkList.image = UIImage(systemName: "circle.fill")
            selectedIndexPaths.insert(indexPath)
            selectedFood.insert(food)
            print(selectedFood.count)
        }
    }
}
