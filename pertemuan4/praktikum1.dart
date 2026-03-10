void main() {
    // ============================
    // LANGKAH 1
    // ============================

    var list = [1, 2, 3];
    assert(list.length == 3);
    assert(list[1] == 2);
    print(list.length);
    print(list[1]);

    list[1] = 1;
    assert(list[1] == 1);
    print(list[1]);
    
    // ============================
    // LANGKAH 3
    // ============================

    final List<String?> biodata = List<String?>.filled(5, null);

    biodata[1] = "Rifat Djibran";
    biodata[2] = "244107060138";

    print("\nLangkah 3");
    print("${biodata[0]}");
    print("${biodata[1]}");
    print("${biodata[2]}");
    print("${biodata[3]}");
    print("${biodata[4]}");
}