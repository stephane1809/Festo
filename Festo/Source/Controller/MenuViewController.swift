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
        sectionTitle = ["", "Convidados", "Comidas", "Doces", "Bebidas", "Bebidas +18"]

    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return foods.count
        case 3:
            return candies.count
        case 4:
            return drinks.count
        case 5:
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
        switch indexPath.section {
        case 0:
            return 200
        default:
            return 84
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let header = tableView.dequeueReusableCell(withIdentifier: MenuFolderCell.identifier, for: indexPath) as?
                    MenuFolderCell else {
                return UITableViewCell(style: .default, reuseIdentifier: MenuFolderCell.identifier)
            }
            return header
        case 1:
            guard let stepper = tableView.dequeueReusableCell(withIdentifier: StepperViewCell.identifier, for: indexPath) as?
                    StepperViewCell else {
                return UITableViewCell(style: .default, reuseIdentifier: StepperViewCell.identifier)
            }
            return stepper
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.identifier, for: indexPath) as?
                    MenuTableViewCell else {
                return UITableViewCell(style: .default, reuseIdentifier: MenuTableViewCell.identifier)
            }
            cell.configureCellInformations(text: foods[indexPath.row].name,
                                           imageName: foods[indexPath.row].imageFood ?? "")
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.identifier, for: indexPath) as?
                    MenuTableViewCell else {
                return UITableViewCell(style: .default, reuseIdentifier: MenuTableViewCell.identifier)
            }
            cell.configureCellInformations(text: candies[indexPath.row].name,
                                           imageName: candies[indexPath.row].imageFood ?? "")
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.identifier, for: indexPath) as?
                    MenuTableViewCell else {
                return UITableViewCell(style: .default, reuseIdentifier: MenuTableViewCell.identifier)
            }
            cell.configureCellInformations(text: drinks[indexPath.row].name,
                                           imageName: drinks[indexPath.row].imageDrink ?? "")
            return cell
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.identifier, for: indexPath) as?
                    MenuTableViewCell else {
                return UITableViewCell(style: .default, reuseIdentifier: MenuTableViewCell.identifier)
            }
            cell.configureCellInformations(text: alcoholicDrinks[indexPath.row].name,
                                           imageName: alcoholicDrinks[indexPath.row].imageAlcoholic ?? "")
            return cell
        default:
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? MenuTableViewCell else { return }
        if selectedIndexPaths.contains(indexPath) {
            cell.checkList.image = UIImage(systemName: "checkmark.circle.fill")
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
            cell.checkList.image = UIImage(systemName: "checkmark.circle.fill")
            selectedIndexPaths.insert(indexPath)
            selectedFood.insert(food)
            print(selectedFood)
        }
    }
}
