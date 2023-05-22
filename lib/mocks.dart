import 'package:places/domain/sight.dart';

final List<Sight> mocks = [
  Sight(
    name: 'Воронежский областной краеведческий музей',
    lat: '45.075998',
    lon: '38.902675',
    url:
        'https://visit-voronezh.ru/assets/components/phpthumbof/cache/0bd7bd9d67a0c362eca6811d8cd1a1e1-w2048-h2048.196a527c526537c45ead89437634006a264.jpg',
    details:
        'Воронежский областной краеведческий музей — один из ведущих музеев Воронежа. Музейные фонды насчитывают более 170 тыс. единиц хранения. Самыми ценными являются: этнографическая коллекция, коллекция нумизматики, фалеристики, бонистики, сфрагистики, филателии, коллекция фарфора, керамики, коллекция оружия и собрание редких книг.',
    type: 'Музей',
  ),
  Sight(
    name: 'Эльбрус',
    lat: '45.067476',
    lon: '38.914252',
    // url: 'https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcSzN7CHz-sQ5Jl4vbuqyZM9wuzrtPm1VB1vua0FR-2rkn11BZ9eBZmtFlEloQKH2QO1SAMZkQTpcgavcJMq37VEDA',
    url:
        'https://cdn.ventrata.com/image/upload/s--dSY5aV0A--/ar_1.5,c_fill,dpr_auto,q_auto,w_auto/v1586769359/Vista_do_Rei_7_e3bnpd.jpg',
    details:
        'Эльбру́с — стратовулкан на Кавказе — самая высокая горная вершина России и Европы при условии проведения границы между Европой и Азией по Главному Кавказскому хребту или южнее. Эльбрус включён в список высочайших вершин частей света «Семь вершин». Талая вода ледников, стекающих с его склонов, питает одни из наиболее крупных рек Северного Кавказа: Кубань, Малку и Баксан.',
    type: 'Парк',
  ),
  Sight(
    name: 'Храм Василия Блаженного',
    lat: '45.114546',
    lon: '38.930113',
    url:
        'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcS9O4IS_bM0GAZa0Mu1Cz_eghFPDrvJp0RC89xhzySQ0bPLD3eYrrQFngQWEtan0ZLBp-ipD0PFtxbLEQU0t1ZKpw',
    details:
        'Храм Васи́лия Блаже́нного, официально собо́р Покрова́ Пресвято́й Богоро́дицы, что на Рву — православный храм на Красной площади в Москве, памятник русской архитектуры. Построен в 1555—1561 годах. Объединяет одиннадцать церквей, часть из которых освящена в честь святых, дни памяти которых пришлись на решающие бои за Казань',
    type: 'Музей',
  ),
  Sight(
    name: 'Большой театр',
    lat: '45.061670',
    lon: '39.008500',
    url:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR80GJ7rn30UZPfKsQEga6UwpBL-dyS9wz3Rg8xFvmtTim94zZW8Te3AABpax7FJtZrT2_FNVvapt9CbmUos9eFJA',
    details:
        'Государственный академический Большой театр России, Большой театр России или просто Большой театр — один из крупнейших в России и один из самых значительных в мире театров оперы и балета. Комплекс зданий театра расположен в центре Москвы, на Театральной площади. Большой театр, его музей, здание исторической сцены — объект культурного наследия народов России федерального значения.',
    type: 'Музей',
  ),
  Sight(
    name: 'Путорана',
    lat: '78.198408',
    lon: '48.5106548',
    url:
        'https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcRgn2rX1G3vx3UYyihm-Pio-GKf_Hk1f2fiwyvq-2THCRicjVaNk0nVFZI-FokNo69jNJRXtXaqfn6CGo9f8AAAdQ',
    details:
        'Путора́на — сильно расчленённый горный массив, расположенный на северо-западе Среднесибирского плоскогорья. На севере и западе плато обрывается крутым уступом, в то время как южная и восточная части характеризуются пологими склонами. Максимальная высота плато — 1701 м, среди высочайших вершин горы Камень, Холокит, Котуйская. На севере плато Путорана граничит с Таймыром. Площадь плато составляет 250 тыс. км².',
    type: 'Парк',
  ),
  Sight(
    name: 'Екатерининский дворец',
    lat: '66.198408',
    lon: '33.5106548',
    url:
        'https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcSWKlRDjRVUqhXY-IillTTzvxFiBLC7gl39sEKD0iIrp_NWib3zhehbgK9TSGA_bGE0-Fy7rR0koyM1ENTpewARLA',
    details:
        'Большо́й Екатери́нинский дворе́ц — императорский дворец, официальная летняя резиденция трёх российских правительниц: Екатерины I, Елизаветы Петровны, Екатерины II. Дворец расположен в 26 км к югу от центра Санкт-Петербурга в бывшем Царском Селе. Является объектом культурного наследия России. Входит в состав «Дворцово-паркового ансамбля города Пушкин и его исторический центр», который является объектом всемирного наследия ЮНЕСКО «Исторический центр Санкт-Петербурга и связанные с ним комплексы памятников».',
    type: 'Музей',
  ),
  Sight(
    name: 'У Эдуарда',
    lat: '45.114546',
    lon: '38.930113',
    url:
        'https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcSWKlRDjRVUqhXY-IillTTzvxFiBLC7gl39sEKD0iIrp_NWib3zhehbgK9TSGA_bGE0-Fy7rR0koyM1ENTpewARLA',
    details: 'Лучший отель',
    type: 'Отель',
  ),
];

final List<String> mocksCategory = [
  'Кинотеатр',
  'Ресторан',
  'Особое место',
  'Театр',
  'Музей',
  'Кафе',
];
final List<String> mocksHistory = [
  'Кофейня у Рустама',
  'Рускеала',
  'Музей истории Российской Федерации',
  'Большой',
  'Эльбрус',
];
