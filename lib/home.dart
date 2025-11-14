import 'dart:core';
import 'package:flutter/material.dart';
import 'package:sow/GetStarted.dart';
import 'package:sow/HelpPage.dart';
import 'package:carousel_slider/carousel_slider.dart';


void main() {
  runApp(const Netflix());
}

class Netflix extends StatelessWidget {
  const Netflix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Netflix',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  static const List<Widget> Options = <Widget>[
    CategoriesPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Options.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 3, 3, 3),
        currentIndex: selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: '',
          ),
        ],
        selectedItemColor: const Color.fromARGB(255, 189, 210, 27),
        onTap: _onItemTapped,
      ),
    );
  }
}

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final List<String> imageUrls = [
    "https://source.boomplaymusic.com/buzzgroup1/M00/32/AE/rBEevGHXumKAKqbrAAGqmG-A7hY70.jpeg",
    "https://charlottesometimesgoestothemovies.com/wp-content/uploads/2017/12/jumanji_2_2017_11_13_11_32_47.jpg",
    "https://i0.wp.com/exquisitemag.com/wp-content/uploads/2022/07/B671019A-61AE-4F1D-A13A-7A9D4653B067.jpeg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9DlHPpkenwxU2HLiT5HibUx07gLjzeRZc77jMV4BX8Q&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQs_mPTaQDWEoaRauKYa4gU2TJxypCPmqzQxPQJzdrqZQ&s",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Categories',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HelpPage()),
              );
            },
            icon: const Icon(Icons.help,
                color: Color.fromARGB(255, 244, 238, 238)),
          ),
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => const GetStarted()));
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon:  Icon(Icons.search,  color: const Color.fromARGB(255, 89, 82, 82).withOpacity(0.3),),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 89, 82, 82).withOpacity(0.3),
                ),
                style: const TextStyle(color: Colors.black),
              ),
            ),
            const Text(
              'Top Rated Movies',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: CarouselSlider.builder(
                itemCount: imageUrls.length,
                itemBuilder: (context, itemIndex, pageViewIndex) {
                  return Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 9, 9, 9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 300,
                    width: 200,
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      imageUrls[itemIndex],
                      fit: BoxFit.fill,
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 300,
                  autoPlay: true,
                  viewportFraction: 0.55,
                  enlargeCenterPage: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayAnimationDuration: const Duration(seconds: 2),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(children: [
                  Text(
                    'Trending',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_circle_right_outlined,
                    color: Colors.white,
                  )
                ]),
              ),
              Container(
                height: 150,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      movieCard(
                          context,
                          'https://www.indiaherald.com/cdn-cgi/image/width=350/imagestore/images/movies/movies_latestnews/dhanush-stands-out-in-a-mixed-bage03acdfd-e97e-4e0c-a9d8-a532aaa050bf-415x250.jpg',
                          'Captain Miller',
                          'The film centers around the character Captain Miller, portrayed by Dhanush, who is depicted as a fierce and valiant rebel fighting against the British forces. The narrative weaves through his journey, struggles, and the larger freedom movement, showcasing his bravery and the challenges he faces during the tumultuous times of British rule in India.',
                          4.5),
                      movieCard(
                          context,
                          'https://assets.mspimages.in/gear/wp-content/uploads/2022/11/Wednesday.jpg',
                          'Wednesday',
                          'The series follows Wednesday Addams, portrayed by Jenna Ortega, as she navigates her teenage years at Nevermore Academy, a peculiar boarding school. With her unique outlook on life and macabre interests, Wednesday finds herself embroiled in solving a supernatural mystery that has haunted her family for decades. The series blends elements of dark humor, mystery, and supernatural phenomena, staying true to the quirky and gothic essence of the Addams Family.',
                          4.0),
                            movieCard(
                          context,
                          'https://www.digitaltrends.com/wp-content/uploads/2022/11/vDGr1YdrlfbU9wxTOdpf3zChmv9.jpg',
                          'Glass Onion',
                          'The film follows renowned detective Benoit Blanc as he takes on a new case on a private Greek island. Tech billionaire Miles Bron invites a group of friends for a lavish getaway, but the trip turns deadly when one of the guests is found murdered. As Blanc delves into the complex relationships and hidden secrets of the eclectic group, he must piece together the clues to uncover the murderer.',
                          4.5),
                      movieCard(
                          context,
                          'https://www.digitaltrends.com/wp-content/uploads/2021/10/riyinlsq2kf1awogm80jqw5dlkp.jpg',
                          'Enola Homles',
                          'Set in 1884 England, the film follows Enola Holmes (Millie Bobby Brown), the younger sister of Sherlock Holmes (Henry Cavill) and Mycroft Holmes (Sam Claflin). Raised by her unconventional mother Eudoria (Helena Bonham Carter), Enola grows up learning skills like jiu-jitsu and cryptography, rather than traditional "ladylike" pursuits On her 16th birthday, Enola discovers that her mother has gone missing, leaving behind a series of cryptic clues. Refusing to be sent away to a finishing school by her brothers, Enola escapes and sets off on a journey to find her mother. Along the way, she encounters a young runaway lord, Viscount Tewksbury (Louis Partridge), who is also in danger. Enola must use her wits and detective skills to uncover the truth behind her mother disappearance and protect Tewksbury from those who wish him harm.',
                          4.0),
                            movieCard(
                          context,
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNryqXNj0ICnZ24K86i3YAMKA0eeQOmP_QNzv-T9nyZQ&s',
                          'All Queens in the  Western Front',
                          'The film follows Paul Bäumer (Felix Kammerer), a young German soldier who, along with his school friends, is excited to join the army and fight for his country in World War I. Their initial enthusiasm quickly fades as they are confronted with the grim realities of trench warfare. Paul’s journey is one of transformation from a naive and patriotic youth to a battle-weary and disillusioned soldier.The narrative delves into the physical and psychological horrors of war, showcasing the daily struggles of soldiers in the trenches, the constant threat of death, and the devastating impact of war on human lives. Through Paul eyes, the film explores themes of comradeship, loss, and the inhumanity of warfare.',
                          4.5),
                      movieCard(
                          context,
                          'https://miro.medium.com/v2/resize:fit:512/1*DtI_4xHTl1aRksB7XZAfqQ.jpeg',
                          'Cruella',
                          '',
                          4.0),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(children: [
                  Text(
                    'Thiller',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_circle_right_outlined,
                    color: Colors.white,
                  )
                ]),
              ),
              Container(
                height: 150,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      movieCard(
                          context,
                          'https://qph.cf2.quoracdn.net/main-qimg-eecd6a7de309aa97779af69500c96fb9-lq',
                          'Shutter Island',
                          'The film is set in 1954 and follows U.S. Marshal Teddy Daniels (Leonardo DiCaprio) and his new partner Chuck Aule (Mark Ruffalo) as they travel to Shutter Island, a remote island off the coast of Massachusetts. They are investigating the disappearance of a patient named Rachel Solando from the Ashecliffe Hospital for the criminally insane. As Teddy and Chuck delve deeper into the investigation, they uncover disturbing truths about the hospital, its staff, and its patients.',
                          4.5),
                      movieCard(
                          context,
                          'https://m.media-amazon.com/images/M/MV5BNWU1ZTEzYTMtZmQ1Ny00Y2ZjLWJmMTUtNGE0NzNhZjBhMzU1XkEyXkFqcGdeQXVyMTExMDczNTI@._V1_.jpg',
                          'Thriller',
                          '"The Silence of the Lambs" is a masterclass in psychological tension and suspense. Anthony Hopkins delivers a chilling performance as Hannibal Lecter, creating an iconic and terrifying character. Jodie Foster shines as Clarice Starling, a determined and complex protagonist. The film tight direction, gripping plot, and unforgettable characters make it a timeless thriller that continues to captivate audiences decades after its release.',
                          4.0),
                            movieCard(
                          context,
                          'https://hips.hearstapps.com/hmg-prod/images/girl-on-the-train2016-2-1596039575.jpg?crop=1xw:0.631578947368421xh;center,top&resize=980:*',
                          'The Girl',
                          '"The Silence of the Lambs" is a masterclass in psychological tension and suspense. Anthony Hopkins delivers a chilling performance as Hannibal Lecter, creating an iconic and terrifying character. Jodie Foster shines as Clarice Starling, a determined and complex protagonist. The film tight direction, gripping plot, and unforgettable characters make it a timeless thriller that continues to captivate audiences decades after its release.',
                          4.5),
                      movieCard(
                          context,
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdxifspM4hgTqB-LwijF5ANwfaTb3jecEGd3QqqAejmQ&s',
                          'OpenHeimer',
                          'During World War II, Lt. Gen. Leslie Groves Jr. appoints physicist J. Robert Oppenheimer to work on the top-secret Manhattan Project. Oppenheimer and a team of scientists spend years developing and designing the atomic bomb. Their work comes to fruition on July 16, 1945, as they witness the world first nuclear explosion, forever changing the course of history.',
                          4.0),
                            movieCard(
                          context,
                          'https://pbs.twimg.com/media/FxhHnbzX0AQzMr-.jpg:large',
                          'No Exit',
                          'The film follows Darby Thorne (Havana Rose Liu), a young woman who gets stranded at a mountain rest stop during a blizzard. Desperate to find shelter, she discovers a group of strangers also seeking refuge. However, as the storm intensifies, Darby makes a horrifying discovery: one of the strangers is holding a kidnapped girl captive in their vehicle. Trapped by the blizzard and with no way to call for help, Darby must confront the kidnapper and find a way to save the girl before it too late.',
                          4.5),
                      movieCard(
                          context,
                          'https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC/et00377865-gtprsqvgaj-portrait.jpg',
                          'Furiosa',
                          'Set in a dystopian future where resources are scarce and society has collapsed, "Furiosa" follows the titular character on her quest for freedom and survival. Born into a world of chaos and violence, Furiosa rises from her humble origins to become a fierce warrior and leader.The film explores Furiosa early life, including her upbringing in the oppressive society of the Citadel, ruled by the tyrant Immortan Joe. As she witnesses the injustices and brutality around her, Furiosa rebels against the system and embarks on a dangerous journey to find her own path.Along the way, Furiosa encounters allies and adversaries, navigates treacherous landscapes, and confronts the demons of her past. The film promises high-octane action sequences, stunning visuals, and a compelling narrative that sheds light on the enigmatic character of Furiosa.',
                          4.0),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(children: [
                  Text(
                    'Fantasy',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_circle_right_outlined,
                    color: Colors.white,
                  )
                ]),
              ),
              Container(
                height: 150,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      movieCard(
                          context,
                          'https://resizing.flixster.com/zp-uO8WA0O9pEAAic3-jp0pe4hQ=/fit-in/180x240/v2/https://resizing.flixster.com/3w9ZfQQ50dBeWrV7k-ip4L76eTA=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzLzY1NGZkZmZkLTUyYjMtNDY4OC1iOTRmLTVlYTJjZjZkYjg1OC53ZWJw',
                          'Beauty and the Beast',
                          '"Beauty and the Beast" follows the story of a young woman named Belle who lives in a small village. Belle is considered peculiar by her fellow villagers due to her love of reading and her independent spirit. One day, her father Maurice, an inventor, gets lost in the forest and seeks refuge in a mysterious castle. However, the castle is inhabited by a fearsome Beast who curses Maurice to remain imprisoned unless Belle agrees to take his place.',
                          4.5),
                      movieCard(
                          context,
                          'https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC/et00371686-tmtfppvltr-portrait.jpg',
                          'Wish',
                          '"Wish Upon" follows a teenage girl named Clare Shannon (Joey King) who discovers a mysterious Chinese music box that grants her seven wishes. Initially, Clare wishes seem to come true, but she soon realizes that each wish comes with a deadly consequence. As Clare desires spiral out of control, she must find a way to break the curse of the music box before it consumes her and everyone she loves.',
                          4.0),
                            movieCard(
                          context,
                          'https://resizing.flixster.com/S3vCO4RXvBVfJ-mH1pOngQGLzbo=/fit-in/180x240/v2/https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/p10569326_p_v8_af.jpg',
                          'Into The Woods',
                          '"Into the Woods" combines several classic fairy tales, including Cinderella, Little Red Riding Hood, Jack and the Beanstalk, and Rapunzel, into a single interconnected story. The film follows a Baker and his Wife who venture into the woods to lift a curse placed on their family by a vengeful Witch. Along the way, they encounter familiar characters from various fairy tales, each on their own quest.',
                          4.0),
                      movieCard(
                          context,
                          'https://www.commonsensemedia.org/sites/default/files/styles/ratio_2_3_medium/public/product-images/csm-movie/disenchanted-2022-character-poster-smaller.jpg',
                          'Disenchanted',
                          '"Disenchanted" continues the story of Giselle, a fairy-tale princess from the animated kingdom of Andalasia, who finds herself in the real world of New York City. In the sequel, Giselle, played by Amy Adams, faces new challenges as she grapples with the realities of married life and motherhood. As she navigates the complexities of her relationships, Giselle begins to question whether "happily ever after" truly exists.',
                          4.0),
                            movieCard(
                          context,
                          'https://images.squarespace-cdn.com/content/v1/51b3dc8ee4b051b96ceb10de/1583164576290-HVI58WJODGJTVXL2G6FA/artemis-fowl-poster-1209380.jpegAdventurous+New+Trailer+For+Disney%27s+Fantasy+Film+ARTEMIS+FOUL1',
                          'Artemis Fowl',
                          '"Artemis Fowl" follows the story of Artemis Fowl II, a young Irish criminal mastermind, who embarks on a quest to find his missing father, Artemis Fowl I. Along with his loyal bodyguard, Domovoi Butler, and a fairy named Holly Short from an underground world of magical creatures, Artemis delves into a dangerous and mystical adventure.',
                          4.5),
                      movieCard(
                          context,
                          'https://resizing.flixster.com/PZE6Ap6nuhr8i_bpofcrFsTSs2Y=/fit-in/180x240/v2/https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/p163182_p_v8_al.jpg',
                          'Bridge to Terabithia',
                          '"Bridge to Terabithia" follows the story of Jesse Aarons, a fifth-grader who lives in a rural community and struggles with fitting in at school. Jesse befriends Leslie Burke, a new girl in town with a vivid imagination and a love for storytelling. Together, they create an imaginary kingdom called Terabithia in the nearby woods, where they rule as king and queen, escaping from the challenges of their everyday lives.',
                          4.0),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(children: [
                  Text(
                    'Action',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_circle_right_outlined,
                    color: Colors.white,
                  )
                ]),
              ),
              Container(
                height: 150,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      movieCard(
                          context,
                          'https://hips.hearstapps.com/hmg-prod/images/best-action-movies-the-woman-king-1675183833.jpeg',
                          'Women King',
                          'While most of The Woman King and its characters were largely fictionalized, a few of its central roles were inspired by actual accounts of Agojie women; Mbedu adolescent character Nawi was known as one of the last of the Agojie warriors, who passed away in 1979 at over 100 years in age.',
                          4.5),
                      movieCard(
                          context,
                          'https://i.ytimg.com/vi/Kw0rrqKqS34/hq720.jpg?sqp=-oaymwEXCK4FEIIDSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLDWlPddHIkkD_H3SFycy5RVGtbkQQ',
                          'Street Cred',
                          '"A Streetcar Named Desire" follows the story of Blanche DuBois, a troubled and fragile Southern belle who moves in with her sister Stella and her brutish husband Stanley Kowalski in their cramped New Orleans apartment. Blanche arrival disrupts the already tense dynamic between Stella and Stanley, leading to clashes and conflicts fueled by Blanche delusions and Stanley aggression.As the story unfolds, secrets from Blanche past come to light, revealing her tragic descent into madness and her desperate attempts to hold onto her fading dignity. The film explores themes of desire, illusion, reality, and the destructive power of human emotions.',
                          4.0),
                            movieCard(
                          context,
                          'https://hips.hearstapps.com/hmg-prod/images/best-action-movies-the-hurt-locker-1675267236.jpeg',
                          'The Hurt Locker',
                          '"The Hurt Locker" follows an elite Army Explosive Ordnance Disposal (EOD) team during the Iraq War. The film centers on Staff Sergeant William James, played by Jeremy Renner, a fearless and reckless bomb disposal expert who thrives on the adrenaline rush of his dangerous job. As James and his team navigate the streets of Baghdad, they face the constant threat of improvised explosive devices (IEDs) planted by insurgents.',
                          4.5),
                      movieCard(
                          context,
                          'https://m.media-amazon.com/images/M/MV5BYzlhNzBmYjUtNjRmZC00MDg3LWE4NDMtZDNjODUwNTljMzhlXkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_.jpg',
                          'Rebel Moon',
                          '"Rebel Moon" is set in a distant future where a peaceful colony on the edge of the galaxy is threatened by a tyrannical ruler named Balisarius. In a desperate bid for survival, the colony sends out a plea for help to a neighboring planet, leading to the arrival of a group of warriors, mercenaries, and rebels who join forces to defend the colony against Balisarius and his formidable army.',
                          4.0),
                            movieCard(
                          context,
                          'https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC/et00331567-ewajffmjtz-portrait.jpg',
                          'June Part 2',
                          '"June" tells the story of the titular character, June Sara Joy, played by Rajisha Vijayan, who is a vibrant and spirited young girl with big dreams. The film follows June journey from her school days through adolescence as she navigates the challenges and experiences of growing up.June is raised in a loving and supportive family, but she faces various trials and tribulations as she deals with friendship, love, heartbreak, and the pursuit of her aspirations. Along the way, she forms meaningful relationships with those around her, including her father, mother, brother, and friends.',
                          4.5),
                      movieCard(
                          context,
                          'https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC/et00377865-gtprsqvgaj-portrait.jpg',
                          'Furidsa a Had Max Saba',
                          'It seems you are referring to "Furiosa", which is a prequel to the "Mad Max" film series, focusing on the character Imperator Furiosa. However, there is no known character named "Max Saba" associated with this film. Max Rockatansky, portrayed by Mel Gibson and later by Tom Hardy in the "Mad Max" series, is the protagonist in the original films.In the upcoming "Furiosa" film, the character of Furiosa will be portrayed by Anya Taylor-Joy, taking over the role from Charlize Theron, who played Furiosa in "Mad Max: Fury Road." The film will explore Furiosa backstory and her rise to become one of the most iconic characters in the "Mad Max" universe.',
                          4.0),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(children: [
                  Text(
                    'Sci-fi',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_circle_right_outlined,
                    color: Colors.white,
                  )
                ]),
              ),
              Container(
                height: 150,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      movieCard(
                          context,
                          
                          'https://m.media-amazon.com/images/M/MV5BYzlhNzBmYjUtNjRmZC00MDg3LWE4NDMtZDNjODUwNTljMzhlXkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_.jpg',
                          'Moon Part One: A Child of Fire',
                          'Moon ,has become a cult classic in the science fiction genre, admired for its compelling narrative and philosophical themes. It has inspired discussions about the future of space exploration, artificial intelligence, and the ethical dilemmas posed by corporate interests. Duncan Jones debut film has solidified his reputation as a filmmaker to watch and has left a lasting impact on audiences.',
                          4.5),
                      movieCard(
                          context,
                          'https://m.media-amazon.com/images/M/MV5BZjdkOTU3MDktN2IxOS00OGEyLWFmMjktY2FiMmZkNWIyODZiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg',
                          'IntraStellar',
                          '"Interstellar" explores themes of love, sacrifice, the survival of humanity, and the mysteries of the universe. The film delves into scientific concepts such as black holes, time dilation, and the theory of relativity, while also examining the emotional bonds that connect people across space and time.Christopher Nolan signature style is evident in the film complex narrative structure, stunning visual effects, and intricate sound design. Hans Zimmer haunting musical score further enhances the film emotional depth and epic scale.',
                          4.0),
                            movieCard(
                          context,
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2f_O9njY3k7aDzrZpxegHjeClO9ZJNZ-95uoRNp7Tpw&s',
                          'Journey to the Center of Earth',
                          '"Journey to the Center of the Earth" explores themes of exploration, discovery, and the wonders of the natural world. It combines elements of adventure, science fiction, and fantasy to create an immersive and thrilling cinematic experience.The film utilizes 3D technology to enhance its visual effects and create a sense of depth and immersion for audiences. Spectacular CGI sequences bring to life the fantastic landscapes and creatures encountered by the characters on their journey.',
                          4.5),
                      movieCard(
                          context,
                          'https://resizing.flixster.com/GyVub9rGU6uhdW6x-BeT35DqyDQ=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzLzM1YmEwZGJhLTkyMzYtNGNmMy1hN2VhLTk2Y2RhNDBjOTA3Yi5qcGc=',
                          'Parallet',
                          'Description of Movie 2',
                          4.0),
                            movieCard(
                          context,
                          'https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC/et00377865-dmvphdzrqp-portrait.jpg',
                          'Furiosa',
                          'Set in a dystopian future where resources are scarce and society has collapsed, "Furiosa" follows the titular character on her quest for freedom and survival. Born into a world of chaos and violence, Furiosa rises from her humble origins to become a fierce warrior and leader.The film explores Furiosa early life, including her upbringing in the oppressive society of the Citadel, ruled by the tyrant Immortan Joe. As she witnesses the injustices and brutality around her, Furiosa rebels against the system and embarks on a dangerous journey to find her own path.',
                          4.5),
                      movieCard(
                          context,
                          'https://i.ytimg.com/vi/Fgh6yGbakyQ/maxresdefault.jpg',
                          'Space',
                          'In the near future, Earth is facing severe environmental decline, with crop blights and dust storms threatening humanity survival. Cooper (Matthew McConaughey), a former NASA pilot turned farmer, is struggling to provide for his family, particularly his daughter Murph (Mackenzie Foy, later Jessica Chastain), who shares his scientific curiosity.Cooper is recruited by a secretive NASA group led by Professor Brand (Michael Caine) to pilot the Endurance spacecraft. The mission is to travel through a wormhole near Saturn, believed to be placed by an unknown intelligence, to explore potentially habitable planets in another galaxy. The goal is to find a new home for humanity.Along with a team of scientists including Brand daughter, Amelia (Anne Hathaway), Cooper embarks on a perilous journey through space and time. As they explore strange new worlds, they face numerous challenges, including the effects of time dilation, which causes time to pass differently on the planets they visit compared to Earth. This leads to emotional and dramatic consequences for Cooper and his relationship with Murph.',
                          4.0),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              
            ],
          ),
        ),
    );
  }

  Widget movieCard(BuildContext context, String imageUrl, String title, String description, double rating) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailPage(
              imageUrl: imageUrl,
              title: title,
              description: description,
              rating: rating,
            ),
          ),
        );
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.all(8.0),
        color: Colors.grey,
        child: Image.network(
          imageUrl,
          height: 300,
          width: 150,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class MovieDetailPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final double rating;

  MovieDetailPage({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.rating,
  });
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),titleTextStyle: TextStyle(color: Colors.white,fontSize: 23),
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => const GetStarted()));
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            )),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(imageUrl, height: 300, width: double.infinity, fit: BoxFit.cover),
            const SizedBox(height: 35),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.yellow),
                Text(
                  rating.toString(),
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
               
              },
              child: const Text('Add to Watch Later'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
               
              },
              child: const Text('Download'),
            ),
          ],
        ),
      ),
    );
  }
}


class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding:
              const EdgeInsets.only(bottom: 16, top: 65, right: 16, left: 16),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 65,
                    backgroundImage: NetworkImage(
                        'https://i.pinimg.com/736x/1c/a5/67/1ca567198de000e54f9d71c01dcb4e2d.jpg'),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mahithaa',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Mahithaasri2005@gmail.com',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 89, 82, 82)
                          .withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.downloading_sharp, color: Colors.white),
                          SizedBox(height: 8),
                          Text(
                            "Downloads",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 50),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 89, 82, 82)
                          .withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.watch_later_outlined, color: Colors.white),
                          SizedBox(height: 8),
                          Text(
                            "Watch Later",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 50),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 89, 82, 82)
                          .withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.settings, color: Colors.white),
                          SizedBox(height: 8),
                          Text(
                            "Settings",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 89, 82, 82).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Data Saver",
                            style: TextStyle(color: Colors.white),
                          ),
                          Spacer(),
                          Icon(
                            Icons.data_saver_on_outlined,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 89, 82, 82).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Notification",
                            style: TextStyle(color: Colors.white),
                          ),
                          Spacer(),
                          Icon(
                            Icons.notifications_active,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 89, 82, 82).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Watch history",
                            style: TextStyle(color: Colors.white),
                          ),
                          Spacer(),
                          Icon(
                            Icons.download_done,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 89, 82, 82).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Manage Bookmarks",
                            style: TextStyle(color: Colors.white),
                          ),
                          Spacer(),
                          Icon(
                            Icons.bookmark_add,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 89, 82, 82).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Accessbility",
                            style: TextStyle(color: Colors.white),
                          ),
                          Spacer(),
                          Icon(
                            Icons.accessible_forward_outlined,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
