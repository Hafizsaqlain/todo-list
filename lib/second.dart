import 'package:flutter/material.dart';

class Second extends StatefulWidget {
   const Second({super.key});

  @override
  State<Second> createState() => _secondState();
}

// ignore: camel_case_types
class _secondState extends State<Second> {

  final GlobalKey<AnimatedListState> _globalKey = GlobalKey();
  final TextEditingController _controller = TextEditingController();
  final item = [];
 

  Future<void> addDialog(BuildContext context){
    return showDialog(
    context: context,
    builder: ((context){
      return AlertDialog(
        backgroundColor: const Color.fromARGB(255, 174, 144, 93),
        title: const Text('Add to list'),
        content: TextField(
          
          controller: _controller,
          decoration: const InputDecoration(
            hintText: 'E.g Laptop & School',
            enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
                        
             ),focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)
             ),
             
             fillColor: Color.fromARGB(255, 194, 189, 189),
             filled: true,
          ),
        ),
        actions: [
          TextButton(onPressed: (){
            addItem(_controller.text);
            Navigator.pop(context);
          },
           child: const Text('save',style: TextStyle(color:Color.fromARGB(255, 33, 32, 32)),)
          ),
        ],
      );
    }
    ),
    );
  }
  void addItem(String title){
    item.insert(0, title);
    _globalKey.currentState!.insertItem(0, duration: const Duration(seconds: 1));
  }
 void removeItem(int index, BuildContext content){
  AnimatedList.of(content).removeItem(index, (_, animation){
    return FadeTransition(opacity: animation,
    child: SizeTransition(sizeFactor: animation,
    child: 
     Card(
           elevation: 0,
              color:const Color.fromARGB(255, 165, 116, 42),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                title: Text(item[index],style:const TextStyle( fontSize: 15, color: Colors.black),),
                subtitle:
                 Text(DateTime.now().toString().substring(0,10),
                 style: const TextStyle(fontSize: 12, color: Colors.black),
                
                 ),
                 trailing:IconButton(
                  onPressed: ()=> removeItem(index, context),
                 
                  icon:const Icon(Icons.delete)) ,
              ),
            ),
            ),
    );
  }
  );
 if(_controller.text.isEmpty){
  print('Delete Successfully');
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text('Delete Successfully',
    style: Theme.of(context).textTheme.displaySmall,
    ),
    
  ));

 }else{
  print('write valid text');
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  backgroundColor: Colors.red,
  content: Text('Delete Successfully',
  style: Theme.of(context).textTheme.displaySmall,),));
  // Navigator.push(context, MaterialPageRoute(builder: (context){
  //   return
  // }
  


 }
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 184, 146, 80),
     appBar: AppBar(
      title: const Text('ToDo list ',style: TextStyle(color: Color.fromARGB(255, 24, 23, 23)),),
      backgroundColor: const Color.fromARGB(255, 165, 116, 42),
     ),
     drawer: Drawer(
      surfaceTintColor: Colors.black12,
      
      backgroundColor: const Color.fromARGB(255, 184, 146, 80),
      child: ListView(
        
        children: [
          ListTile(
            title: const Text('person 1'),
            onTap: () { },
            tileColor: const  Color.fromARGB(255, 165, 116, 42),
            subtitle:const Text('list 1'),
            leading: const Icon(Icons.person,color: Colors.black,),
            trailing:const Icon(Icons.add) ,
            
          ),
          const SizedBox(
            height: 25,
          ),
           ListTile(
            title: const Text('person 2'),
            onTap: () {},
            tileColor: const  Color.fromARGB(255, 165, 116, 42),
            subtitle:const Text('list 2'),
            leading: const Icon(Icons.person,color: Colors.black,),
            trailing:const Icon(Icons.add) ,
            
          ),
          const SizedBox(
            height: 25,
          ),
           ListTile(
            title: const Text('person 3'),
            onTap: () {},
            tileColor: const  Color.fromARGB(255, 165, 116, 42),
            subtitle:const Text('list 3'),
            leading: const Icon(Icons.person,color: Colors.black,),
            trailing:const Icon(Icons.add) ,
            
          
          ),
          const  SizedBox(
            height: 25,
          ),
           ListTile(
            title: const Text('person 4'),
            onTap: () {},
            tileColor: const  Color.fromARGB(255, 165, 116, 42),
            subtitle:const Text('list 4'),
            leading: const Icon(Icons.person,color: Colors.black,),
            trailing:const Icon(Icons.add) ,
        
          ),
          
        ],
      ),
      
     
      
      
     ),
     body: Padding(
      
      padding: const EdgeInsets.all(16),
      child: AnimatedList(
        key: _globalKey,
        initialItemCount: item.length,
        itemBuilder: (context, index, animation) {
          return FadeTransition(
            opacity: animation,
            child: SizeTransition(
            sizeFactor: animation,
            key: UniqueKey(),
            child: Card(
              elevation: 0,
              color:const Color.fromARGB(255, 147, 116, 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                title: Text(item[index],style: const TextStyle(),),
                subtitle:
                 Text(DateTime.now().toString().substring(0,10),
                 style: const TextStyle(fontSize: 12, color: Colors.black),
                 
                 
                 ),
                 trailing:IconButton(
                  onPressed: ()=> removeItem(index, context),
                  icon:const Icon(Icons.delete,color:   Color.fromARGB(255, 33, 32, 32)),
                  
                ) ,
              ),
            ),
            ),
            
          );
        },
      ), 
      ),
      
      floatingActionButton: FloatingActionButton(onPressed: (){
        _controller.clear();
        addDialog(context);
      },
      backgroundColor:const Color.fromARGB(255, 165, 116, 42),
      child: Icon(Icons.add,color: const Color.fromARGB(255, 33, 32, 32),),
      
      ),

      
      );

  }
}