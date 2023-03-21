import 'dart:async';
import 'dart:io';
import 'package:supabase/supabase.dart';
import 'package:path/path.dart' as p;

void main() async {
  print('Uploading the backgrounds...');
  await upload();
  print('Uploaded.');

  exit(0);
}



Future<List<File>> getAllFilesWithExtension(String path, String extension) async {
  final List<FileSystemEntity> entities = await Directory(path).list().toList();
  return entities.whereType<File>().where((element) => p.extension(element.path) == extension).toList();
}

void upload() async {
  final supabase = await SupabaseClient('http://localhost:54321', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImV4cCI6MTk4MzgxMjk5Nn0.EGIM96RAZx35lJzdJsyH-qQwv8Hdp7fsn3W0YpN81IU');


  final context = p.Context();
  final filesToUpload = await getAllFilesWithExtension('backgrounds', '.png');
  await Future.forEach(filesToUpload, (file) async {
    final basename = context.basename(file.path);
    print ('Uploading ${basename}');

    final storageResponse = await supabase
      .storage
      .from('backgrounds')
      .upload(basename, file);

    print('Uploaded.');
  });
}
