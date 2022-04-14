// FutureBuilder(
// future: fetchmovies(),
// builder: (BuildContext context, AsyncSnapshot snapshot){
// if(snapshot.hasData){
// return ListView.builder(itemCount: snapshot.data.length,itemBuilder: (BuildContext context,int index){
// return Row(
// children: [
// Container(height: 250,alignment:Alignment.centerLeft,
// child: Card(
// child: Image.network("https://image.tmdb.org/t/p/w500"+snapshot.data[index+1]["poster_path"]),
// ),),
// SizedBox(width: 20,),
// Container(width: MediaQuery.of(context).size.width/2,
// child: Column(crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(snapshot.data[index+1]["original_title"],style: TextStyle(color: Colors.white),),
// SizedBox(height: 10,),
// Text(snapshot.data[index+11]["release_date"],style: TextStyle(color: Color(0xff868597))),
// SizedBox(height: 10,),
// Text(snapshot.data[index+1]["overview"],style: TextStyle(color:Color(0xff868597))),
// ],
// ),
// ),
// ],
// );
// });
// }
// return Center(child: CircularProgressIndicator(),);
// }
//
// ),