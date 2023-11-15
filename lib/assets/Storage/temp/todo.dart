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
  bool done;

  todo(
    this.title,
    this.timer,
    this.category, {
    this.done = false,
  });
}
