List<Place> places = [
  Place(
      name: 'Naubikinz',
      place: 'Keyrang, Thailand',
      imgPath:
          'https://d36tnp772eyphs.cloudfront.net/blogs/1/2011/05/thailand-1200x819.jpg',
      rating: 4.0),
  Place(
      name: 'Normandy',
      place: 'Hibru, France',
      imgPath:
          'https://www.electronics-airliquide.com/sites/activity_electronics/files/styles/retina_cover_page/public/2016/03/24/france-banner-mobile.jpg?itok=hDLHJLhk',
      rating: 4.5),
  Place(
      name: 'Hamisberg',
      place: 'Porto, Portugal',
      imgPath:
          'https://img.etimg.com/thumb/msid-67603358,width-643,imgsize-1775669,resizemode-4/portugal-bccl.jpg',
      rating: 4.8),
  Place(
      name: 'Baleric',
      place: 'Pantelleria, Italy',
      imgPath:
          'https://c.ndtvimg.com/2020-03/p85koog_italy_625x300_10_March_20.jpg',
      rating: 4.8),
];

class Place {
  String name;
  String place;
  String imgPath;
  double rating;

  Place({this.name, this.place, this.imgPath, this.rating});
}
