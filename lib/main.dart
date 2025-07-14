import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:todolist/Central.dart';
import 'model/todo.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //Asenkron olmasının sebei aşağıda await ile çalışan asenktron işlemler olmasıdır.(Örneğin Hive başlatma ve kutu açma işlemleri)
  WidgetsFlutterBinding.ensureInitialized(); //Flutterın main() fonksiyonu içinde asenkron işlemler yapmadan önce bu satır zorunludur.
  await Hive.initFlutter(); //Hive veritabanı flutter ortamında başlatılır. Bu işlem cihazda Hive'ın dosya sistemine erişebilmesini sağlar
  Hive.registerAdapter(
    TodoAdapter(),
  ); //Todo sınıfını Hive ile kullanabilmek için, bu sınıfa ait TypeAdapter'ın kaydetilmesi gerekir.Bu adapter sayesinde Hive, Todo nesnelerini saklayabilir,geri okuyabilir ve anlayabilir.
  await Hive.openBox<Todo>(
    'todos',
  ); //todos adında bir veri kutusu(box) açılır.Bu kutu Todo nesnelerini tutmak için ayarlanmıştır.Hive da kutular veri saklama alanlarıdır.
  //Bu kutu artık uygulama boyunca şu şekilde kullanılabilir: final box = Hive.box<Todo>('todos');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Central());
  }
}
