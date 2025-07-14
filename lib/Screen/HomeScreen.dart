import 'package:flutter/material.dart';
import 'package:todolist/model/todo.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Hive'dan todos adında bir kutu(veri deposu) açılır
  //.box<Todo>() tipi belirler,todos kutusu daha önce Hive.openBox<Todo>('todos') şeklinde açılmış olmalı main'de
  final _todoBox = Hive.box<Todo>('todos');

  //TextField'daki kullanıcı girişini kontrol etmek için kullanılır.
  //Görev başlığı burada kontrol edilir
  final _controller = TextEditingController();

  void _addTodo() {
    //Yeni görev ekleme fonksiyonu
    final title =
        _controller.text
            .trim(); //TextField'daki metni alır ve boşlukları siler.
    if (title.isNotEmpty) {
      //başlık boş değilse devam eder
      final todo = Todo(title: title); //Yeni bir Todo nesnesi oluşturur.
      _todoBox.add(todo); //Hive kutusuna bu yeni görevi ekler
      _controller.clear(); //TextField'ı temizler(Yazı yazılan yer)
    }
  }

  void _toggleTodo(Todo todo) {
    //Görev tamamlandı olarak işaretleme
    todo.isDone = !todo.isDone; //isDone durumunu tersine çevirir.
    todo.save(); //ile Hive veritabanına kaydeder.
  }

  void _deleteTodo(int index) {
    //Görev silme fonksiyonu
    _todoBox.deleteAt(index); //Belirli bir indexteki görevi Hiveden siler
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Flutterdaki temel sayfa yapısı
      body: Column(
        //Dikey olarak içerikleri sıralar
        children: [
          Padding(
            //TextFielda padding verdik.
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: _controller, //Bu textfield'ı kontrol eder
              decoration: InputDecoration(
                //Kullanıcıya ipucu gösterir
                labelText: 'Yeni Görev',
                suffixIcon: IconButton(
                  //TextField'ın sağ tarafına bir + butonu koyar.
                  icon: Icon(Icons.add),
                  onPressed:
                      _addTodo, //Basıldığında _addTodo() fonksiyonu çağrılır.
                ),
              ),
            ),
          ),
          Expanded(
            //Bu alan kalan tüm yüksekliği kaplar
            child: ValueListenableBuilder(
              //Hive kutusunda bir değişiklik olursa UI'yı otomatik olarak günceller.
              valueListenable:
                  _todoBox.listenable(), //Bu kutududaki değişiklikleri dinler.
              builder: (context, Box<Todo> box, _) {
                if (box.values.isEmpty) {
                  //Eğer kutu boşsa kullanıcıya bilgi verir.
                  return Center(child: Text('"Hiç Görev Yok'));
                }
                //Hive kutusundaki her öğe için bir ListTile oluşturur.
                return ListView.builder(
                  //Liste varsa görevleri gösterir.
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    final todo = box.getAt(index)!;

                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: Checkbox(
                          //sol tarafa bir ckeckbox koyar
                          value: todo.isDone,
                          onChanged:
                              (_) => _toggleTodo(
                                todo,
                              ), //kullanıcı kutucuğu işaretleyince _toggleTodo() çalışır.
                        ),
                        title: Text(
                          //Görev başlığı burada yazılır.
                          todo.title,
                          style: TextStyle(
                            decoration:
                                todo.isDone
                                    ? TextDecoration.lineThrough
                                    : null, //tamamlandıysa üzeri çizili olarka gösterilir.
                          ),
                        ),
                        trailing: IconButton(
                          //Sağ tarafa bir silme butonu yerleştirilir.
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed:
                              () => _deleteTodo(
                                index,
                              ), //tıklanınca _deleteTodo() çağrılır.
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
