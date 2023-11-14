enum Timer {
  daily,
  weekly,
  monthly,
  yearly,
  onetime,
}

enum cats {
  chore,
  bucketList,
}

class todo {
  String title;
  Timer timer;
  cats category;

  todo(
    this.title,
    this.timer,
    this.category,
  );
}
