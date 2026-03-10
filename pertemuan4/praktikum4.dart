void main() {

    // =========================
    // LANGKAH 1
    // =========================

    // var list1 = [1, 2, 3];
    // var list2 = [0, ...list1];

    // print(list1);
    // print(list2);
    // print(list2.length);

    // =========================
    // LANGKAH 3
    // =========================

    var list1 = [1, 2, null]; 
    print(list1);
    var list3 = [0, ...?list1];
    print(list3.length);

    var nim = ['244107060138']; 
    var listDenganNim = [...list3, ...nim];
    print(listDenganNim);

    // =========================
    // LANGKAH 4 
    // =========================
    bool promoActive = true; 
    var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
    print("Nav saat promoActive true: $nav");

    promoActive = false;
    nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
    print("Nav saat promoActive false: $nav\n");

    // =========================
    // LANGKAH 5 
    // =========================

    var login = 'Manager'; 
    var nav2 = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];
    print("Nav2 saat login Manager: $nav2");

    login = 'User';
    nav2 = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];
    print("Nav2 saat login bukan Manager: $nav2\n");

    // =========================
    // LANGKAH 6 
    // =========================
    var listOfInts = [1, 2, 3];
    var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
    assert(listOfStrings[1] == '#1');
    print(listOfStrings);
}