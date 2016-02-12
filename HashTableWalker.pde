class HashTableWalker extends Walker {
 HashTable hashTable; 
 
  HashTableWalker(PVector initialPosition){
    super(initialPosition);
    hashTable = new HashTable();
  }
  
  void eat(Food f){
    hashTable.add(f);
  }
  
  void draw(){
    ellipse(location.x, location.y, WIDTH, WIDTH);
    hashTable.display();
  }
  
}