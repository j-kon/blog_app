import 'package:blog_app/models/models.dart';
import 'package:blog_app/utils/images.dart';

import 'colors.dart';

List<NewsModel> getList1Data() {
  var list = List<NewsModel>();
  var model1 = NewsModel();
  model1.name = "Life speed racered";
  model1.info = "7th aug- 3 min read";
  model1.image = img9;
  model1.otherinfo =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.dummy text of the printing and typesetting";

  var model2 = NewsModel();
  model2.name = "Move the world";
  model2.info = "7th aug- 3 min read";
  model2.image = img8;
  model2.otherinfo =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.dummy text of the printing and typesetting";

  var model3 = NewsModel();
  model3.name = "Piece of Pie";
  model3.info = "7th aug- 3 min read";
  model3.image = img6;
  model3.otherinfo =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.dummy text of the printing and typesetting";

  var model4 = NewsModel();
  model4.name = "The Addams Family";
  model4.info = "7th aug- 3 min read";
  model4.image = img5;
  model4.otherinfo =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.dummy text of the printing and typesetting";

  var model5 = NewsModel();
  model5.name = "Life speed racered";
  model5.info = "7th aug- 3 min read";
  model5.image = img2;
  model5.otherinfo =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.dummy text of the printing and typesetting";

  list.add(model1);
  list.add(model3);
  list.add(model2);
  list.add(model4);
  list.add(model5);
  list.add(model5);
  list.add(model1);
  list.add(model3);
  list.add(model2);
  list.add(model4);
  list.add(model5);
  list.add(model5);
  return list;
}

List<NewsModel> getCategoryData() {
  var list = List<NewsModel>();
  var model1 = NewsModel();
  model1.category = "World";
  model1.color = cat1;

  var model2 = NewsModel();
  model2.category = "Politics";
  model2.color = cat2;
  var model3 = NewsModel();
  model3.category = "Tech";
  model3.color = cat3;
  var model4 = NewsModel();
  model4.category = "Sports";
  model4.color = cat4;
  var model5 = NewsModel();
  model5.category = "Science";
  model5.color = cat5;

  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model4);
  list.add(model5);
  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model4);
  list.add(model5);
  return list;
}

List<NewsModel> getList2Data() {
  var list = List<NewsModel>();
  var model1 = NewsModel();
  model1.name = "Life speed racered";
  model1.info = "7th aug- 3 min read";
  model1.image = img8;

  var model2 = NewsModel();
  model2.name = "Life speed racered";
  model2.info = "7th aug- 3 min read";
  model2.image = img10;

  var model3 = NewsModel();
  model3.name = "Life speed racered";
  model3.info = "7th aug- 3 min read";
  model3.image = img5;

  list.add(model2);
  list.add(model3);
  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model1);
  return list;
}

List<NewsModel> getDashboardData() {
  var list = List<NewsModel>();
  var model1 = NewsModel();
  model1.name = "Life speed racered";
  model1.info = "7th aug- 3 min read";
  model1.image = img2;

  var model2 = NewsModel();
  model2.name = "Life speed racered";
  model2.info = "7th aug- 3 min read";
  model2.image = img1;

  var model3 = NewsModel();
  model3.name = "Life speed racered";
  model3.info = "7th aug- 3 min read";
  model3.image = img_3;

  var model4 = NewsModel();
  model4.name = "Life speed racered";
  model4.info = "7th aug- 3 min read";
  model4.image = img5;

  var model5 = NewsModel();
  model5.name = "Life speed racered";
  model5.info = "7th aug- 3 min read";
  model5.image = img6;

  var model6 = NewsModel();
  model6.name = "Life speed racered";
  model6.info = "7th aug- 3 min read";
  model6.image = img4;

  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model4);
  list.add(model6);
  list.add(model5);
  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model4);
  list.add(model6);
  list.add(model5);
  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model4);
  list.add(model6);
  list.add(model5);
  return list;
}
