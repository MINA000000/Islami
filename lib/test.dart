void main()
{
  hello();
}
 void hello() {
    String s = '''
  mina 
  nasser 
  wannas ghb
  hello world every body
''';
    List<String> b = s.split('\n');
    print(b);
  }