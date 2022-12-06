//
//  MenuViewController.swift
//  Festo
//
//  Created by Emilly Maia on 05/12/22.
//

import UIKit

class MenuViewController: UIViewController {

   public var selectedFood: [FoodModel] = []

    var menuView = MenuView()
    private var sectionTitle = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = menuView
        menuView.menuTableView.delegate = self
        menuView.menuTableView.dataSource = self
        sectionTitle = ["Comidas", "Doces", "Bebidas", "Bebidas +18"]

//        if let selectedIndexPaths = menuView.menuTableView.indexPathsForSelectedRows {
//            let selectedFoods = selectedIndexPaths.map { indexPath in
//                let food = all[indexPath.section][indexPath.row]
//                return food
//            }
//        }
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? MenuTableViewCell else {
                    return
                }
        
        selectedFood.append(foods[indexPath.row])
            print(selectedFood)
        //        tableView.cellForRow(at: )
//        print()
    }

//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        guard section == 0 else {
//            return nil
//        }
//        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: MenuHeaderView.identifier)
//        return header
//    }
//
//    private func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat? {
//        return section == 0 ? 200 : 0
//    }
}
