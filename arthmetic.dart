import 'dart:math';
class Person {
  String first;
  String last;
  DateTime dob;
  Person(this.first, this.last, this.dob);//constructor for the object with same order as provided in the question
}
DateTime randDate(Random random) {
  final year = random.nextInt(2023);  //any number from 0000 to 2023 for year
  final month = 1 + random.nextInt(12); //generates any number from 1 to 12
  final day = 1 + random.nextInt(31);
  return DateTime(year, month, day);
}
String randSt(Random random,final minL,final maxL,final arr) {
  final len= minL+ random.nextInt(maxL-minL);
  String ans='';
  for(int i=0;i<len;i++) {
    final index = random.nextInt(arr.length);
    ans += arr[index];
  }
  return ans;
}
void main() {
  final rand = Random(); //rand is an object of Random class which is present in math library
  final minLetters=5;
  final maxLetters=10;//assuming the name has 5 to 10 letters
  final allPerson= <Person>[];
  print('FirstName                LastName                    Date of Birth');
  for (int i=1;i<=1e2;i++) {
    final arr = 'abcdefghijklmnopqrstuvwxyz';  //arr is the array where all the letters are accessed this list by generating random index
    final first = randSt(rand,minLetters,maxLetters,arr);
    final last = randSt(rand,minLetters,maxLetters,arr);
    final dob= randDate(rand);


    final object_person = Person(first,last,dob);   //generate random object of person class

    allPerson.add(object_person);
    //print('${object_person.first}                   ${object_person.last}                    ${object_person.dob.year}-${object_person.dob.month}-${object_person.dob.day}');
    //space for formatting the output

  }

  bubbleSort(allPerson);

}
void bubbleSort(List<Person> persons) {
  final n = persons.length;
  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      if (persons[j].dob.isAfter(persons[j + 1].dob)) {
        final temp = persons[j];
        persons[j] = persons[j + 1];
        persons[j + 1] = temp;
      }
    }
  }
  for(int i=0;i<n;i++)
    {
      print('${persons[i].first}     ${persons[i].last}         ${persons[i].dob.hour}-${persons[i].dob.month}-${persons[i].dob.day}');

    }
}




