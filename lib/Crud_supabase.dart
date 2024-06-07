import 'package:learner_prokit/supabase_client.dart';


  Future<void> createData(var name, var msg, var img, var isOnline) async {
  final response = await supabase
      .from('learnerchatmodel')
      .insert({
        'name': name,
        'msg': msg,
        'img': img,
        'duration': isOnline,
      });

  if (response.error != null) {
    print('Error inserting data: ${response.error!.message}');
  } else {
    print('Data inserted successfully');
  }
}


Future<void> deleteData(var name) async {
  final response = await supabase
      .from('learnerchatmodel')
      .delete()
      .eq('name', name);

  if (response.error != null) {
    print('Error deleting data: ${response.error!.message}');
  } else {
    print('Data deleted successfully');
  }
}


Future<void> updateData(var name, var msg, var img, var isOnline) async {
  final response = await supabase
      .from('learnerchatmodel')
      .update({
         
        'msg': msg,
        'img': img,
        'duration': isOnline,
      })
      .eq('name', name);

  if (response.error != null) {
    print('Error updating data: ${response.error!.message}');
  } else {
    print('Data updated successfully');
  }
}
