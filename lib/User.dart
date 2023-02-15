class User {
  late String name;
  late String email;
  late String password;
  late String uid;


  User({required this.name,required this.email,required this.password,required this.uid});

  /*User.fromJson(Map <String, dynamic> json){
    name=json['name'];
    email=json['email'];
    password=json['password'];
    uid=json['uid'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data=new Map<String, dynamic>();
    data['name']=this.name;
    data['email']=this.email;
    data['password']=this.password;
    data['uid']=this.uid;
    return data;
  }

*/
}