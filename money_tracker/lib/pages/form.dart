import 'package:money_tracker/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyFormPage extends StatefulWidget {
    const MyFormPage({super.key});
    String tipeTransaksi = 'Pengeluaran';
    List<String> listTipeTransaksi = ['Pengeluaran', 'Pemasukan'];

    @override
    State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
final _formKey = GlobalKey<FormState>()
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Form'),
            ),
            drawer: const DrawerMenu(),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                  child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.class_),
                title: const Text(
                  'Tipe Transaksi:',
                ),
                trailing: DropdownButton(
                  value: tipeTransaksi,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: listTipeTransaksi.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      tipeTransaksi = newValue!;
                    });
                  },
                ),
              ),
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: Sebelum masuk semester!",
                    labelText: "Deskripsi Transaksi",
                    // Menambahkan icon agar lebih intuitif
                    icon: const Icon(Icons.notes),
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Menambahkan behavior saat nama diketik
                  onChanged: (String? value) {
                    setState(() {
                      _deskripsiTransaksi = value!;
                    });
                    TextButton(
            child: const Text(
              "Tambah",
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {}
            },
          );
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      _deskripsiTransaksi = value!;
                    });
                    TextButton(
            child: const Text(
              "Tambah",
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {}
            },
          );
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Deskripsi transaksi tidak boleh kosong!';
                    }
                    return null;
                  },
                  onPressed: () {
  if (_formKey.currentState!.validate()) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 15,
          child: Container(
            child: ListView(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              shrinkWrap: true,
              children: <Widget>[
                Center(child: const Text('Informasi Data')),
                SizedBox(height: 20),
                // TODO: Munculkan informasi yang didapat dari form
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Kembali'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
},
                ),
              ),
            ],
              ),
                  ),
                    //mainAxisAlignment: MainAxisAlignment.center,
                    //children: <Widget>[
                      //  Text('Hello World!'),
                    //],
                ),
            ),
        );
    }
}
