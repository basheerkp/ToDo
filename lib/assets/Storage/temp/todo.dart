enum Timer {
  daily,
  weekly,
  monthly,
  yearly,
  onetime,
}

enum Category {
  chore,
  bucketList,
}

class todo {
  String title;
  Timer timer;
  Category category;

  todo(
    this.title,
    this.timer,
    this.category,
  );
}
