import 'package:flutter/material.dart';
class Dish{
  final String name;
  final String mealtype;
  final String cuisinetype;
  final double price;

  Dish({required this.name, required this.mealtype, required this.cuisinetype, required this.price});
}

void main(){
  runApp(RecipeManagementApp());
}

class RecipeManagementApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: HomePage(),
      title: "Recipe Management",
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  final TextEditingController searchcontroller = TextEditingController();

  List<Dish> dishes = [
    Dish(
        name: 'Dosa',
        mealtype: 'Breakfast',
        cuisinetype: 'Indian',
        price: 200
    ),
    Dish(
        name: 'Sandwich',
        mealtype: 'Breakfast',
        cuisinetype: 'American',
        price: 200
    ),
    Dish(
        name: 'Noodles',
        mealtype: 'Lunch',
        cuisinetype: 'Chinese',
        price: 200
    )
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Management'),
      ),

      body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left:5, right:10, top:10),
              child: Row(
                    children: [
                    Expanded(
                      child: SizedBox(
                        width: 350,
                         child: TextField(
                            controller: searchcontroller,
                            decoration: InputDecoration(
                                hintText: "Search your recipes",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                              )
                            ) ,
                           onChanged: (value){
                              searchitem(value);
                           },
                          ) ,
                        ),
                      ),
                    IconButton(
                        onPressed: (){
                          showDialog(
                              context: context,
                              builder: (BuildContext context){
                                return AlertDialog(
                                  title: Text('Filter by'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        title: Text('Cuisine'),
                                        onTap: (){
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      ListTile(
                                        title: Text('Meal'),
                                        onTap: (){
                                          Navigator.of(context).pop();
                                        }
                                      )
                                    ],
                                  ),
                                );
                              }
                          );
                        },
                        icon: Icon(Icons.filter_list))
                      ]
                  ),
                ),
            Expanded(
              child: ListView.builder(
                itemCount: dishes.length,
                itemBuilder: (context, index) {
                  final product = dishes[index];
                  return Container(
                    height: 150, // Set the height of the container
                    padding: EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 4, // Add elevation for a shadow effect
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ListTile(
                              contentPadding: EdgeInsets.all(16.0),
                              title: Text(product.name),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(product.name, style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text('${product.mealtype} - ${product.cuisinetype}'),
                                  Text('Rs. ${product.price}')
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 40,bottom: 20),
                child:SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () => Additem(context),
                    child:Text('Add New Recipe'),
            ),
                ),
    ),
          ],
      ),
    );
  }
  void Additem(BuildContextcontex) async{
    final formkey = GlobalKey<FormState>();
    String add_name = '';
    String add_mealtype = '';
    String add_cuisinetype = '';
    double add_price = 0.0;

    await showDialog(
        context: context,
        builder: (context)=> AlertDialog(
          title: Text('Add New Recipe'),
          content: SingleChildScrollView(
            child: Form(
              key:formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  onSaved: (value)=> add_name = value!,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Meal Type'),
                  onSaved: (value)=> add_mealtype = value!,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Cuisine Type'),
                  onSaved: (value)=> add_cuisinetype = value!,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Price'),
                  onSaved: (value)=> add_price = double.parse(value!),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();
                        add_to_list(Dish(
                          
                            name: add_name,
                            mealtype: add_mealtype,
                            cuisinetype: add_cuisinetype,
                            price: add_price));
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Add'),
                )
              ],
            ),
          ) ,
          ),
        ),
    );
  }

void add_to_list(Dish newDish){
    setState(() {
      dishes.add(newDish);
    });
}

void searchitem(String query){
    List<Dish> dish_copy = [];
    dish_copy.addAll(dishes);
    if(query.isNotEmpty){
      List<Dish> res = [];
      dish_copy.forEach((item){
        if (item.name.toLowerCase().contains(query.toLowerCase())){
          res.add(item);
        }
      });
      setState(() {
        dishes = res;
      });
      return;
    }

    else{
      setState(() {
        dishes = dish_copy;
      });
    }
}
}