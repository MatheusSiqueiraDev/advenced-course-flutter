abstract class Observable {
  void addEventListener(void Function() callback);
  
  void removeEventListener(void Function() callback);
}