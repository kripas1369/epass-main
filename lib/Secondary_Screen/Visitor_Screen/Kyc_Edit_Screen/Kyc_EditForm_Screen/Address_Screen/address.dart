class Address {
  static List<String> country = ['Nepal'];

  static List<String> province1 = [
    'Province 1',
    'Province 2',
    'Bagmati',
    'Gandaki',
    'Lumbini',
    'Karnali',
    'Sudur Paschim',
  ];
  static Map<String, List<String>> province = {
    'Nepal': [
      'Province 1',
      'Province 2',
      'Bagmati',
      'Gandaki',
      'Lumbini',
      'Karnali',
      'Sudur Paschim',
    ]
  };
  static Map<String, List<String>> district = {
    'Province 1': [
      'Bhojpur',
      'Dhankuta',
      'Ilam',
      'Jhapa',
      'Khotang',
      'Morang',
      'Okhaldhunga',
      'Panchthar',
      'Sankhuwasabha',
      'Solukhumbu',
      'Sunsari',
      'Taplejung',
      'Terhathum',
      'Udayapur',
    ],
    'Province 2': [
      'Bara',
      'Dhanusa',
      'Mahottari',
      'Parsa',
      'Rautahat',
      'Saptari',
      'Sarlahi',
      'Siraha',
    ],
    'Bagmati': [
      'Bhaktapur',
      'Chitwan',
      'Dhading',
      'Dolakha',
      'Kathmandu',
      'Kavrepalanchok',
      'Lalitpur',
      'Makawanpur',
      'Nuwakot',
      'Ramechhap',
      'Rasuwa',
      'Sindhuli',
      'Sindhupalchok',
    ],
    'Gandaki': [
      'Baglung',
      'Gorkha',
      'Kaski',
      'Lamjung',
      'Manang',
      'Mustang',
      'Myagdi',
      'Nawalparasi (Bardaghat Susta Purba)',
      'Parbat',
      'Syangja',
      'Tanahu',
    ],
    'Lumbini': [
      'Arghakhanchi',
      'Banke',
      'Bardiya',
      'Dang',
      'Gulmi',
      'Kapilvastu',
      'Nawalparasi (Bardaghat Susta Paschim)',
      'Palpa',
      'Pyuthan',
      'Rolpa',
      'Rukum (Purba)',
      'Rupandehi',
    ],
    'Karnali': [
      'Dailekh',
      'Dolpa',
      'Humla',
      'Jajarkot',
      'Jumla',
      'Kalikot',
      'Mugu',
      'Rukum (Paschim)',
      'Salyan',
      'Surkhet',
    ],
    'Sudur Paschim': [
      'Achham',
      'Baitadi',
      'Bajhang',
      'Bajura',
      'Dadeldhura',
      'Darchula',
      'Doti',
      'Kailali',
      'Kanchanpur',
    ]
  };

  static Map<String, List<String>> municipalites = {
    'Bhojpur': [
      'Arun Rural Municipality',
      'Aamchowk Rural Municipality',
      'Hatuwagadhi Rural Municipality',
      'Pauwadungma Rural Municipality',
      'Temkemaiyung Rural Municipality',
      'Salpasilichho Rural Municipality',
      'Ramprasad Rai Rural Municipality',
      'Shadananda Municipality',
      'Bhojpur Municipality',
    ],
    'Dhankuta': [
      'Chaubise Rural Municipality',
      'Shahidbhumi Rural Municipality',
      'Sangurigadhi Rural Municipality',
      'Chhathar Jorpati Rural Municipality',
      'Pakhribas Municipality',
      'Mahalaxmi Municipality',
      'Dhankuta Municipality',
    ],
    'Ilam': [
      'Rong Rural Municipality',
      'Mangsebung Rural Municipality',
      'Chulachuli Rural Municipality',
      'Sandakpur Rural Municipality',
      'Fakphokthum Rural Municipality',
      'Maijogmai Rural Municipality',
      'Illam Municipality',
      'Mai Municipality',
      'Deumai Municipality',
      'Suryodaya Municipality',
    ],
    'Jhapa': [
      'Kamal Rural Municipality',
      'Jhapa Rural Municipality',
      'Kachankawal Rural Municipality',
      'Gauriganj Rural Municipality',
      'Barhadashi Rural Municipality',
      'Haldibari Rural Municipality',
      'Buddhashanti Rural Municipality',
      'Shivasataxi Municipality',
      'Bhadrapur Municipality',
      'Kankai Municipality',
      'Birtamod Municipality',
      'Mechinagar Municipality',
      'Damak Municipality',
      'Arjundhara Municipality',
      'Gauradhaha Municipality',
    ],
    'Khotang': [
      'Sakela Rural Municipality',
      'Khotehang Rural Municipality',
      'Barahapokhari Rural Municipality',
      'Ainselukhark Rural Municipality',
      'Rawa Besi Rural Municipality',
      'Kepilasagadhi Rural Municipality',
      'Jantedhunga Rural Municipality',
      'Diprung Chuichumma Rural Municipality',
      'Halesi Tuwachung Municipality',
      'Diktel Rupakot Majhuwagadhi Municipality',
    ],
    'Morang': [
      'Jahada Rural Municipality',
      'Katahari Rural Municipality',
      'Gramthan Rural Municipality',
      'Dhanpalthan Rural Municipality',
      'Kerabari Rural Municipality',
      'Budhiganga Rural Municipality',
      'Kanepokhari Rural Municipality',
      'Miklajung Rural Municipality',
      'Letang Municipality',
      'Sunwarshi Municipality',
      'Rangeli Municipality',
      'Patahrishanishchare Municipality',
      'Biratnagar Metropolitian City',
      'Uralabari Municipality',
      'Belbari Municipality',
      'Sundarharaicha Municipality',
      'Ratuwamai Municipality',
    ],
    'Okhaldhunga': [
      'Likhu Rural Municipality',
      'Molung Rural Municipality',
      'Sunkoshi Rural Municipality',
      'Champadevi Rural Municipality',
      'Chisankhugadhi Rural Municipality',
      'Khijidemba Rural Municipality',
      'Manebhanjyang Rural Municipality',
      'Siddhicharan Municipality',
    ],
    'Panchthar': [
      'Yangwarak Rural Municipality',
      'Hilihang Rural Municipality',
      'Falelung Rural Municipality',
      'Tumbewa Rural Municipality',
      'Kummayak Rural Municipality',
      'Miklajung Rural Municipality',
      'Falgunanda Rural Municipality',
      'Phidim Municipality',
    ],
    'Sankhuwasabha': [
      'Makalu Rural Municipality',
      'Chichila Rural Municipality',
      'Silichong Rural Municipality',
      'Bhotkhola Rural Municipality',
      'Sabhapokhari Rural Municipality',
      'Dharmadevi Municipality',
      'Madi Municipality',
      'Panchakhapan Municipality',
      'Chainpur Municipality',
      'Khandbari Municipality',
    ],
    'Solukhumbu': [
      'Sotang Rural Municipality',
      'Mahakulung Rural Municipality',
      'Likhupike Rural Municipality',
      'Nechasalyan Rural Municipality',
      'Thulung Dudhkoshi Rural Municipality',
      'Maapya Dudhkoshi Rural Municipality',
      'Khumbupasanglahmu Rural Municipality',
      'Solududhakunda Municipality',
    ],
    'Sunsari': [
      'Gadhi Rural Municipality',
      'Koshi Rural Municipality',
      'Barju Rural Municipality',
      'Harinagar Rural Municipality',
      'Dewanganj Rural Municipality',
      'Bhokraha Narsing Rural Municipality',
      'Ramdhuni Municipality',
      'Barahchhetra Municipality',
      'Duhabi Municipality',
      'Inaruwa Municipality',
      'Dharan Sub-Metropolitian City',
      'Itahari Sub-Metropolitian City',
    ],
    'Taplejung': [
      'Sidingba Rural Municipality',
      'Meringden Rural Municipality',
      'Maiwakhola Rural Municipality',
      'Phaktanglung Rural Municipality',
      'Sirijangha Rural Municipality',
      'Mikwakhola Rural Municipality',
      'Aathrai Tribeni Rural Municipality',
      'Pathivara Yangwarak Rural Municipality',
      'Phungling Municipality',
    ],
    'Terhathum': [
      'Chhathar Rural Municipality',
      'Phedap Rural Municipality',
      'Aathrai Rural Municipality',
      'Menchayam Rural Municipality',
      'Laligurans Municipality',
      'Myanglung Municipality',
    ],
    'Udayapur': [
      'Tapli Rural Municipality',
      'Rautamai Rural Municipality',
      'Udayapurgadhi Rural Municipality',
      'Limchungbung Rural Municipality',
      'Chaudandigadhi Municipality',
      'Triyuga Municipality',
      'Katari Municipality',
      'Belaka Municipality',
    ],
    'Bara': [
      'Pheta Rural Municipality',
      'Devtal Rural Municipality',
      'Prasauni Rural Municipality',
      'Suwarna Rural Municipality',
      'Baragadhi Rural Municipality',
      'Karaiyamai Rural Municipality',
      'Parwanipur Rural Municipality',
      'Bishrampur Rural Municipality',
      'Adarshkotwal Rural Municipality',
      'Jitpur Simara Sub-Metropolitian City',
      'Kalaiya Sub-Metropolitian City',
      'Pacharauta Municipality',
      'Nijgadh Municipality',
      'Simraungadh Municipality',
      'Mahagadhimai Municipality',
      'Kolhabi Municipality',
    ],
    'Dhanusa': [
      'Aaurahi Rural Municipality',
      'Dhanauji Rural Municipality',
      'Bateshwor Rural Municipality',
      'Janaknandani Rural Municipality',
      'Lakshminiya Rural Municipality',
      'Mukhiyapatti Musarmiya Rural Municipality',
      'Mithila Bihari Municipality',
      'Kamala Municipality',
      'Nagarain Municipality',
      'Ganeshman Charnath Municipality',
      'Mithila Municipality',
      'Dhanusadham Municipality',
      'Bideha Municipality',
      'Sabaila Municipality',
      'Hansapur Municipality',
      'Janakpurdham Sub-Metropolitian City',
      'Sahidnagar Municipality',
      'Chhireshwornath Municipality',
    ],
    'Mahottari': [
      'Pipra Rural Municipality',
      'Sonama Rural Municipality',
      'Samsi Rural Municipality',
      'Ekdanra Rural Municipality',
      'Mahottari Rural Municipality',
      'Gaushala Municipality',
      'Ramgopalpur Municipality',
      'Aurahi Municipality',
      'Bardibas Municipality',
      'Bhangaha Municipality',
      'Jaleswor Municipality',
      'Balwa Municipality',
      'Manra Siswa Municipality',
      'Matihani Municipality',
      'Loharpatti Municipality',
    ],
    'Parsa': [
      'Thori Rural Municipality',
      'Dhobini Rural Municipality',
      'Chhipaharmai Rural Municipality',
      'Jirabhawani Rural Municipality',
      'Jagarnathpur Rural Municipality',
      'Kalikamai Rural Municipality',
      'Bindabasini Rural Municipality',
      'Pakahamainpur Rural Municipality',
      'SakhuwaPrasauni Rural Municipality',
      'Paterwasugauli Rural Municipality',
      'Birgunj Metropolitian City	Metropolitian City',
      'Bahudaramai Municipality',
      'Pokhariya Municipality',
      'Parsagadhi Municipality',
    ],
    'Rautahat': [
      'Yemunamai Rural Municipality',
      'Durga Bhagwati Rural Municipality',
      'Katahariya Municipality',
      'Maulapur Municipality',
      'Madhav Narayan Municipality',
      'Gaur Municipality',
      'Gujara Municipality',
      'Garuda Municipality',
      'Ishanath Municipality',
      'Chandrapur Municipality',
      'Dewahhi Gonahi Municipality',
      'Brindaban Municipality',
      'Rajpur Municipality',
      'Rajdevi Municipality',
      'Gadhimai Municipality',
      'Phatuwa Bijayapur Municipality',
      'Baudhimai Municipality',
      'Paroha Municipality',
    ],
    'Saptari': [
      'Rajgadh Rural Municipality',
      'Rupani Rural Municipality',
      'Tirahut Rural Municipality',
      'Mahadeva Rural Municipality',
      'Bishnupur Rural Municipality',
      'Chhinnamasta Rural Municipality',
      'Balan Bihul Rural Municipality',
      'Tilathi Koiladi Rural Municipality',
      'Agnisair Krishna Savaran Rural Municipality',
      'Hanumannagar Kankalini Municipality',
      'Kanchanrup Municipality',
      'Rajbiraj Municipality',
      'Khadak Municipality',
      'Dakneshwori Municipality',
      'Saptakoshi Rural Municipality',
      'Surunga Municipality',
      'Shambhunath Municipality',
      'Bode Barsain Municipality',
    ],
    'Sarlahi': [
      'Dhankaul Rural Municipality',
      'Parsa Rural Municipality',
      'Bishnu Rural Municipality',
      'Ramnagar Rural Municipality',
      'Kaudena Rural Municipality',
      'Basbariya Rural Municipality',
      'Chandranagar Rural Municipality',
      'Chakraghatta Rural Municipality',
      'Bramhapuri Rural Municipality',
      'Barahathawa Municipality',
      'Haripur Municipality',
      'Ishworpur Municipality',
      'Lalbandi Municipality',
      'Malangawa Municipality',
      'Kabilasi Municipality',
      'Bagmati Municipality',
      'Hariwan Municipality',
      'Balara Municipality',
      'Haripurwa Municipality',
      'Godaita Municipality',
    ],
    'Siraha': [
      'Aurahi Rural Municipality',
      'Naraha Rural Municipality',
      'Arnama Rural Municipality',
      'Bhagawanpur Rural Municipality',
      'Nawarajpur Rural Municipality',
      'Bishnupur Rural Municipality',
      'Bariyarpatti Rural Municipality',
      'Laxmipur Patari Rural Municipality',
      'Sakhuwanankarkatti Rural Municipality',
      'Mirchaiya Municipality',
      'Lahan Municipality',
      'Siraha Municipality',
      'Dhangadhimai Municipality',
      'Kalyanpur Municipality',
      'Karjanha Municipality',
      'Golbazar Municipality',
      'Sukhipur Municipality',
    ],
    'Bhaktapur': [
      'Changunarayan Municipality',
      'Suryabinayak Municipality',
      'Bhaktapur Municipality',
      'Madhyapur Thimi Municipality',
    ],
    'Chitwan': [
      'Bharatpur Metropolitian City',
      'Ichchhyakamana Rural Municipality',
      'Kalika Municipality',
      'Khairahani Municipality',
      'Madi Municipality',
      'Rapti Municipality',
      'Ratnanagar Municipality',
    ],
    'Dhading': [
      'Gajuri Rural Municipality',
      'Galchi Rural Municipality',
      'Thakre Rural Municipality',
      'Siddhalek Rural Municipality',
      'Khaniyabash Rural Municipality',
      'Jwalamukhi Rural Municipality',
      'Gangajamuna Rural Municipality',
      'Rubi Valley Rural Municipality',
      'Tripura Sundari Rural Municipality',
      'Netrawati Dabjong Rural Municipality',
      'Benighat Rorang Rural Municipality',
      'Nilakantha Municipality',
      'Dhunibesi Municipality',
    ],
    'Dolakha': [
      'Bigu Rural Municipality',
      'Sailung Rural Municipality',
      'Melung Rural Municipality',
      'Baiteshwor Rural Municipality',
      'Tamakoshi Rural Municipality',
      'Gaurishankar Rural Municipality',
      'Kalinchok Rural Municipality',
      'Jiri Municipality',
      'Bhimeshwor Municipality',
    ],
    'Kathmandu': [
      'Kirtipur Municipality',
      'Shankharapur Municipality',
      'Nagarjun Municipality',
      'Kageshwori Manahora Municipality',
      'Dakshinkali Municipality',
      'Budhanilakantha Municipality',
      'Tarakeshwor Municipality',
      'Kathmandu Metropolitian City',
      'Tokha Municipality',
      'Chandragiri Municipality',
      'Gokarneshwor Municipality',
    ],
    'Kavrepalanchok': [
      'Roshi Rural Municipality',
      'Temal Rural Municipality',
      'Bhumlu Rural Municipality',
      'Mahabharat Rural Municipality',
      'Bethanchowk Rural Municipality',
      'Khanikhola Rural Municipality',
      'Chaurideurali Rural Municipality',
      'Banepa Municipality',
      'Mandandeupur Municipality',
      'Dhulikhel Municipality',
      'Panauti Municipality',
      'Namobuddha Municipality',
      'Panchkhal Municipality',
    ],
    'Lalitpur': [
      'Bagmati Rural Municipality',
      'Mahankal Rural Municipality',
      'Konjyosom Rural Municipality',
      'Lalitpur Metropolitian City',
      'Mahalaxmi Municipality',
      'Godawari Municipality',
    ],
    'Makawanpur': [
      'Bakaiya Rural Municipality',
      'Kailash Rural Municipality',
      'Manahari Rural Municipality',
      'Bhimphedi Rural Municipality',
      'Bagmati Rural Municipality',
      'Raksirang Rural Municipality',
      'Makawanpurgadhi Rural Municipality',
      'Indrasarowar Rural Municipality',
      'Hetauda Sub-Metropolitian City',
      'Thaha Municipality',
    ],
    'Nuwakot': [
      'Kakani Rural Municipality',
      'Tadi Rural Municipality',
      'Likhu Rural Municipality',
      'Myagang Rural Municipality',
      'Shivapuri Rural Municipality',
      'Kispang Rural Municipality',
      'Suryagadhi Rural Municipality',
      'Tarkeshwar Rural Municipality',
      'Panchakanya Rural Municipality',
      'Dupcheshwar Rural Municipality',
      'Belkotgadhi Municipality',
      'Bidur Municipality',
    ],
    'Ramechhap': [
      'Sunapati Rural Municipality',
      'Doramba Rural Municipality',
      'Umakunda Rural Municipality',
      'Khadadevi Rural Municipality',
      'Gokulganga Rural Municipality',
      'Likhu Tamakoshi Rural Municipality',
      'Manthali Municipality',
      'Ramechhap Municipality',
    ],
    'Rasuwa': [
      'Kalika Rural Municipality',
      'Naukunda Rural Municipality',
      'Uttargaya Rural Municipality',
      'Gosaikunda Rural Municipality',
      'Amachodingmo Rural Municipality',
    ],
    'Sindhuli': [
      'Marin Rural Municipality',
      'Phikkal Rural Municipality',
      'Tinpatan Rural Municipality',
      'Sunkoshi Rural Municipality',
      'Golanjor Rural Municipality',
      'Ghanglekh Rural Municipality',
      'Hariharpurgadhi Rural Municipality',
      'Dudhouli Municipality',
      'Kamalamai Municipality',
    ],
    'Sindhupalchok': [
      'Jugal Rural Municipality',
      'Balefi Rural Municipality',
      'Sunkoshi Rural Municipality',
      'Helambu Rural Municipality',
      'Bhotekoshi Rural Municipality',
      'Lisangkhu Pakhar Rural Municipality',
      'Indrawati Rural Municipality',
      'Tripurasundari Rural Municipality',
      'Panchpokhari Thangpal Rural Municipality',
      'Chautara SangachokGadhi Municipality',
      'Barhabise Municipality',
      'Melamchi Municipality',
    ],
    'Baglung': [
      'Bareng Rural Municipality',
      'Badigad Rural Municipality',
      'Nisikhola Rural Municipality',
      'Kanthekhola Rural Municipality',
      'Tara Khola Rural Municipality',
      'Taman Khola Rural Municipality',
      'Jaimuni Municipality',
      'Baglung Municipality',
      'Galkot Municipality',
      'Dhorpatan Municipality',
    ],
    'Gorkha': [
      'Gandaki Rural Municipality',
      'Dharche Rural Municipality',
      'Aarughat Rural Municipality',
      'Ajirkot Rural Municipality',
      'Sahid Lakhan Rural Municipality',
      'Siranchok Rural Municipality',
      'Bhimsenthapa Rural Municipality',
      'Chum Nubri Rural Municipality',
      'Barpak Sulikot Rural Municipality',
      'Palungtar Municipality',
      'Gorkha Municipality',
    ],
    'Kaski': [
      'Rupa Rural Municipality',
      'Madi Rural Municipality',
      'Annapurna Rural Municipality',
      'Machhapuchchhre Rural Municipality',
      'Pokhara Metropolitian City',
    ],
    'Lamjung': [
      'Dordi Rural Municipality',
      'Dudhpokhari Rural Municipality',
      'Marsyangdi Rural Municipality',
      'Kwholasothar Rural Municipality',
      'Sundarbazar Municipality',
      'Besishahar Municipality',
      'Rainas Municipality',
      'MadhyaNepal Municipality',
    ],
    'Manang': [
      'Chame Rural Municipality',
      'Narshon Rural Municipality',
      'Narpa Bhumi Rural Municipality',
      'Manang Ingshyang Rural Municipality',
    ],
    'Mustang': [
      'Thasang Rural Municipality',
      'Gharapjhong Rural Municipality',
      'Lomanthang Rural Municipality',
      'Lo-Ghekar Damodarkunda Rural Municipality',
      'Waragung Muktikhsetra Rural Municipality',
    ],
    'Myagdi': [
      'Mangala Rural Municipality',
      'Malika Rural Municipality',
      'Raghuganga Rural Municipality',
      'Dhaulagiri Rural Municipality',
      'Annapurna Rural Municipality',
      'Beni Municipality',
    ],
    'Nawalparasi (Bardaghat Susta Purba)': [
      'Baudeekali Rural Municipality',
      'Bulingtar Rural Municipality',
      'Hupsekot Rural Municipality',
      'Binayee Tribeni Rural Municipality',
      'Madhyabindu Municipality',
      'Devchuli Municipality',
      'Gaidakot Municipality',
      'Kawasoti Municipality',
    ],
    'Parbat': [
      'Modi Rural Municipality',
      'Painyu Rural Municipality',
      'Jaljala Rural Municipality',
      'Bihadi Rural Municipality',
      'Mahashila Rural Municipality',
      'Kushma Municipality',
      'Phalebas Municipality',
    ],
    'Syangja': [
      'Harinas Rural Municipality',
      'Biruwa Rural Municipality',
      'Aandhikhola Rural Municipality',
      'Phedikhola Rural Municipality',
      'Kaligandagi Rural Municipality',
      'Arjunchaupari Rural Municipality',
      'Putalibazar Municipality',
      'Bhirkot Municipality',
      'Galyang Municipality',
      'Chapakot Municipality',
      'Waling Municipality',
    ],
    'Tanahu': [
      'Ghiring Rural Municipality',
      'Devghat Rural Municipality',
      'Rhishing Rural Municipality',
      'Myagde Rural Municipality',
      'Bandipur Rural Municipality',
      'Anbukhaireni Rural Municipality',
      'Byas Municipality',
      'Shuklagandaki Municipality',
      'Bhimad Municipality',
      'Bhanu Municipality',
    ],
    'Arghakhanchi': [
      'Panini Rural Municipality',
      'Chhatradev Rural Municipality',
      'Malarani Rural Municipality',
      'Bhumekasthan Municipality',
      'Sitganga Municipality',
      'Sandhikharka Municipality',
    ],
    'Banke': [
      'Khajura Rural Municipality',
      'Janki Rural Municipality',
      'Baijanath Rural Municipality',
      'Duduwa Rural Municipality',
      'Narainapur Rural Municipality',
      'Rapti Sonari Rural Municipality',
      'Kohalpur Municipality',
      'Nepalgunj Sub-Metropolitian City',
    ],
    'Bardiya': [
      'Geruwa Rural Municipality',
      'Badhaiyatal Rural Municipality',
      'Thakurbaba Municipality',
      'Bansagadhi Municipality',
      'Barbardiya Municipality',
      'Rajapur Municipality',
      'Madhuwan Municipality',
      'Gulariya Municipality',
    ],
    'Dang': [
      'Babai Rural Municipality',
      'Gadhawa Rural Municipality',
      'Rapti Rural Municipality',
      'Rajpur Rural Municipality',
      'Dangisharan Rural Municipality',
      'Shantinagar Rural Municipality',
      'Banglachuli Rural Municipality',
      'Tulsipur Sub-Metropolitian City',
      'Ghorahi Sub-Metropolitian City',
      'Lamahi Municipality',
    ],
    'Gulmi': [
      'Ruru Rural Municipality',
      'Isma Rural Municipality',
      'Madane Rural Municipality',
      'Malika Rural Municipality',
      'Chatrakot Rural Municipality',
      'Dhurkot Rural Municipality',
      'Satyawati Rural Municipality',
      'Chandrakot Rural Municipality',
      'Kaligandaki Rural Municipality',
      'Gulmidarbar Rural Municipality',
      'Resunga Municipality',
      'Musikot Municipality',
    ],
    'Kapilvastu': [
      'Yashodhara Rural Municipality',
      'Bijayanagar Rural Municipality',
      'Mayadevi Rural Municipality',
      'Suddhodhan Rural Municipality',
      'Shivaraj Municipality',
      'Kapilbastu Municipality',
      'Buddhabhumi Municipality',
      'Maharajgunj Municipality',
      'Banganga Municipality',
      'Krishnanagar Municipality',
    ],
    'Nawalparasi (Bardaghat Susta Paschim)': [
      'Sarawal Rural Municipality',
      'Susta Rural Municipality',
      'Pratappur Rural Municipality',
      'Palhi Nandan Rural Municipality',
      'Bardaghat Municipality',
      'Sunwal Municipality',
      'Ramgram Municipality',
    ],
    'Palpa': [
      'Rambha Rural Municipality',
      'Tinau Rural Municipality',
      'Nisdi Rural Municipality',
      'Mathagadhi Rural Municipality',
      'Ribdikot Rural Municipality',
      'Purbakhola Rural Municipality',
      'Bagnaskali Rural Municipality',
      'Rainadevi Chhahara Rural Municipality',
      'Tansen Municipality',
      'Rampur Municipality',
    ],
    'Pyuthan': [
      'Ayirabati Rural Municipality',
      'Gaumukhi Rural Municipality',
      'Jhimruk Rural Municipality',
      'Naubahini Rural Municipality',
      'Mandavi Rural Municipality',
      'Mallarani Rural Municipality',
      'Sarumarani Rural Municipality',
      'Pyuthan Municipality',
      'Sworgadwary Municipality',
    ],
    'Rolpa': [
      'Madi Rural Municipality',
      'Thawang Rural Municipality',
      'Sunchhahari Rural Municipality',
      'Lungri Rural Municipality',
      'Gangadev Rural Municipality',
      'Tribeni Rural Municipality',
      'Pariwartan Rural Municipality',
      'Runtigadi Rural Municipality',
      'Sunil Smriti Rural Municipality',
      'Rolpa Municipality',
    ],
    'Rukum (Purba)': [
      'Bhume Rural Municipality',
      'Sisne Rural Municipality',
      'Putha Uttarganga Rural Municipality',
    ],
    'Rupandehi': [
      'Kanchan Rural Municipality',
      'Siyari Rural Municipality',
      'Rohini Rural Municipality',
      'Gaidahawa Rural Municipality',
      'Omsatiya Rural Municipality',
      'Sudhdhodhan Rural Municipality',
      'Mayadevi Rural Municipality',
      'Marchawari Rural Municipality',
      'Kotahimai Rural Municipality',
      'Sammarimai Rural Municipality',
      'Butwal Sub-Metropolitian City',
      'Lumbini Sanskritik Municipality',
      'Devdaha Municipality',
      'Sainamaina Municipality',
      'Siddharthanagar Municipality',
      'Tillotama Municipality',
    ],
    'Dailekh': [
      'Bhairabi Rural Municipality',
      'Mahabu Rural Municipality',
      'Gurans Rural Municipality',
      'Naumule Rural Municipality',
      'Bhagawatimai Rural Municipality',
      'Thantikandh Rural Municipality',
      'Dungeshwor Rural Municipality',
      'Aathabis Municipality',
      'Dullu Municipality',
      'Chamunda Bindrasaini Municipality',
      'Narayan Municipality',
    ],
    'Dolpa': [
      'Kaike Rural Municipality',
      'Jagadulla Rural Municipality',
      'Mudkechula Rural Municipality',
      'Dolpo Buddha Rural Municipality',
      'Shey Phoksundo Rural Municipality',
      'Chharka Tangsong Rural Municipality',
      'Tripurasundari Municipality',
      'Thuli Bheri Municipality',
    ],
    'Humla': [
      'Simkot Rural Municipality',
      'Namkha Rural Municipality',
      'Chankheli Rural Municipality',
      'Tanjakot Rural Municipality',
      'Sarkegad Rural Municipality',
      'Adanchuli Rural Municipality',
      'Kharpunath Rural Municipality',
    ],
    'Jajarkot': [
      'Kuse Rural Municipality',
      'Shiwalaya Rural Municipality',
      'Barekot Rural Municipality',
      'Junichande Rural Municipality',
      'Nalagad Municipality',
      'Bheri Municipality',
      'Chhedagad Municipality',
    ],
    'Jumla': [
      'Hima Rural Municipality',
      'Tila Rural Municipality',
      'Sinja Rural Municipality',
      'Guthichaur Rural Municipality',
      'Tatopani Rural Municipality',
      'Patrasi Rural Municipality',
      'Kanakasundari Rural Municipality',
      'Chandannath Municipality',
    ],
    'Kalikot': [
      'Mahawai Rural Municipality',
      'Palata Rural Municipality',
      'Naraharinath Rural Municipality',
      'Pachaljharana Rural Municipality',
      'Subha Kalika Rural Municipality',
      'Sanni Tribeni Rural Municipality',
      'Khandachakra Municipality',
      'Raskot Municipality',
      'Tilagufa Municipality',
    ],
    'Mugu': [
      'Soru Rural Municipality',
      'Khatyad Rural Municipality',
      'Mugum Karmarong Rural Municipality',
      'Chhayanath Rara Municipality',
    ],
    'Rukum (Paschim)': [
      'Tribeni Rural Municipality',
      'Sani Bheri Rural Municipality',
      'Banfikot Rural Municipality',
      'Aathbiskot Municipality',
      'Chaurjahari Municipality',
      'Musikot Municipality',
    ],
    'Salyan': [
      'Kumakh Rural Municipality',
      'Darma Rural Municipality',
      'Kapurkot Rural Municipality',
      'Kalimati Rural Municipality',
      'Tribeni Rural Municipality',
      'Chhatreshwori Rural Municipality',
      'Siddha Kumakh Rural Municipality',
      'Sharada Municipality',
      'Bangad Kupinde Municipality',
      'Bagchaur Municipality',
    ],
    'Surkhet': [
      'Chaukune Rural Municipality',
      'Simta Rural Municipality',
      'Chingad Rural Municipality',
      'Barahtal Rural Municipality',
      'Gurbhakot Municipality',
      'Panchpuri Municipality',
      'Bheriganga Municipality',
      'Lekbeshi Municipality',
      'Birendranagar Municipality',
    ],
    'Achham': [
      'Dhakari Rural Municipality',
      'Mellekh Rural Municipality',
      'Chaurpati Rural Municipality',
      'Ramaroshan Rural Municipality',
      'Turmakhad Rural Municipality',
      'Bannigadhi Jayagadh Rural Municipality',
      'Sanphebagar Municipality',
      'Mangalsen Municipality',
      'Kamalbazar Municipality',
      'Panchadewal Binayak Municipality',
    ],
    'Baitadi': [
      'Sigas Rural Municipality',
      'Shivanath Rural Municipality',
      'Surnaya Rural Municipality',
      'Dilasaini Rural Municipality',
      'Pancheshwar Rural Municipality',
      'Dogadakedar Rural Municipality',
      'Melauli Municipality',
      'Dasharathchanda Municipality',
      'Purchaudi Municipality',
      'Patan Municipality',
    ],
    'Bajhang': [
      'Masta Rural Municipality',
      'Thalara Rural Municipality',
      'Talkot Rural Municipality',
      'Surma Rural Municipality',
      'SaiPaal Rural Municipality',
      'Durgathali Rural Municipality',
      'Bithadchir Rural Municipality',
      'Kedarseu Rural Municipality',
      'Khaptadchhanna Rural Municipality',
      'Chabispathivera Rural Municipality',
      'JayaPrithivi Municipality',
      'Bungal Municipality',
    ],
    'Bajura': [
      'Gaumul Rural Municipality',
      'Himali Rural Municipality',
      'Jagannath Rural Municipality',
      'Khaptad Chhededaha Rural Municipality',
      'Swami Kartik Khaapar Rural Municipality',
      'Badimalika Municipality',
      'Tribeni Municipality',
      'Budhiganga Municipality',
      'Budhinanda Municipality',
    ],
    'Dadeldhura': [
      'Alital Rural Municipality',
      'Ajaymeru Rural Municipality',
      'Bhageshwar Rural Municipality',
      'Nawadurga Rural Municipality',
      'Ganayapdhura Rural Municipality',
      'Amargadhi Municipality',
      'Parashuram Municipality',
    ],
    'Darchula': [
      'Lekam Rural Municipality',
      'Naugad Rural Municipality',
      'Byas Rural Municipality',
      'Dunhu Rural Municipality',
      'Marma Rural Municipality',
      'Apihimal Rural Municipality',
      'Malikaarjun Rural Municipality',
      'Mahakali Municipality',
      'Shailyashikhar Municipality',
    ],
    'Doti': [
      'Sayal Rural Municipality',
      'Adharsha Rural Municipality',
      'Jorayal Rural Municipality',
      'Badikedar Rural Municipality',
      'Purbichauki Rural Municipality',
      'K I Singh Rural Municipality',
      'Bogtan Foodsil Rural Municipality',
      'Dipayal Silgadi Municipality',
      'Shikhar Municipality',
    ],
    'Kailali': [
      'Chure Rural Municipality',
      'Janaki Rural Municipality',
      'Kailari Rural Municipality',
      'Joshipur Rural Municipality',
      'Mohanyal Rural Municipality',
      'Bardagoriya Rural Municipality',
      'Tikapur Municipality',
      'Ghodaghodi Municipality',
      'Bhajani Municipality',
      'Dhangadhi Sub-Metropolitian City',
      'Gauriganga Municipality',
      'Godawari Municipality',
      'Lamkichuha Municipality',
    ],
    'Kanchanpur': [
      'Beldandi Rural Municipality',
      'Laljhadi Rural Municipality',
      'Punarbas Municipality',
      'Krishnapur Municipality',
      'Mahakali Municipality',
      'Bedkot Municipality',
      'Belauri Municipality',
      'Bhimdatta Municipality',
      'Shuklaphanta Municipality',
    ]
  };
}
