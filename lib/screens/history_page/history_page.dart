import 'package:flutter/material.dart';



class HistoryPage extends StatelessWidget {
  // const HistoryPage({super.key});
  final List<String> items=List<String>.generate(100, (index) =>'Item $index' );

  // HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Row(children: [
          SizedBox(width: 3,),Icon(Icons.arrow_back_ios,color: Colors.black,),Text('Back',style:
          TextStyle(

              fontFamily: 'Lato',
              // fontSize: 16,
              // fontWeight: FontWeight.w400,
              color: Colors.black
          ),)],),
        leadingWidth: 60,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 300,
                height: 100,
                // color: Colors.cyan,
                child: Row(
                  children: [

                    Container(width: 50,height: 50, margin:EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(100),color: Colors.grey
                    ),),
                    SizedBox(width: 20,),
                    Text('John Smith',style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                    ),),
                    //i would use absolute positioning for the upload picture

                  ],

                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                width: 37,
                height: 37,
                // color: Colors.red,
                child: Icon(Icons.menu_open,size: 37,),

              )
            ],
          ),

          Row(
            children: [
              SizedBox(width: 20,),
              Text('Recent Activities',style:TextStyle(

                  fontFamily: 'Lato',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black
              ),)
            ],
          ),
          SizedBox(height: 20,),
          Container(
            width: 570,
            height: 567,
            color: Colors.purple,
            child: ListView.builder(
              itemCount: items.length,
              prototypeItem: ListTile(
                title:Text(items.first),
              ),
              itemBuilder: (context,index){
                return ListTile(title: Text(items[index]),);
              },
            ),
          ),

          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Container(
              child: Row(children: [Icon(Icons.scuba_diving,color: Colors.green,size: 30,),Text('Upgrade',style: TextStyle(

                  fontFamily: 'Lato',
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Colors.black
              ),)],),
            )],
          )
        ],
      ),
    );
  }
}


