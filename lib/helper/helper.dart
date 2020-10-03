import 'package:newsapp/models/category_model.dart';

List<CategoryModel> getCataegories() {
  List<CategoryModel> category = new List<CategoryModel>();
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.contegoryName = "Business";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1593642634367-d91a135587b5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();

  categoryModel.contegoryName = "Entertainment";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();


  categoryModel.contegoryName = "General";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1489533119213-66a5cd877091?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();

  categoryModel.contegoryName = "Health";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1532938911079-1b06ac7ceec7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1489&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();

  categoryModel.contegoryName = "Science";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1532094349884-543bc11b234d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();

  categoryModel.contegoryName = "Sports";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1541534741688-6078c6bfb5c5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1349&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();


  categoryModel.contegoryName = "Technology";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1525980955931-afd2d0adf1c2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80";
  category.add(categoryModel);



  return category;
}
