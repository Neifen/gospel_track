import 'package:flutter/material.dart';
import 'package:gospel_track/gospel_track/gospel_info.dart';

class PageNumber extends ChangeNotifier {
  int currentPage = 0;
  static const int _min = 0;
  static const int _max = 4;

  final Map<int, GospelInfo> _infos = {
    0: GospelInfo(slideId: 0, title: "God loves you", descriptions: [
      "God created the world and made you with love. He knew what he was doing when he made you. He wants you and always wanted you. He desires to know you and you to know him",
      "You are made in God's image and are made beautifuly unique with your strenght, passions and dreams"
    ]),
    1: GospelInfo(slideId: 1, title: "Sin broke the connection", descriptions: [
      "Sin entered the world and because of that the connection between us and God is gone. We cannot see, feel or know God because we are full of sin.",
      "Imagine all the crap that you have done in your past, the bad thoughts, the depressions, the sadness. All of that is because we are far away from God",
      "The ultimate result of sin is death. Because of Sin we will die and stay away from God forever"
    ]),
    2: GospelInfo(slideId: 2, title: "The Solution", descriptions: [
      "But that was never God's plan for us. God's desire and love for us has not gone away. There is just Sin in the way",
      "And so God found a solution. Because sin leads to death he decided to die himself. He decided to take death away from us. To die for us.",
      "But for that he needed to live a life like us. Trapped in a human body he lived for over 30 years going though all the challenges we go though, living a perfect life without sin and then was hanged on a cross."
    ]),
    3: GospelInfo(slideId: 3, title: "It's a Gift", descriptions: [
      "And so God died on a cross, giving us the possibility to get rid of the sin that keeps us away from him.",
      "But it is a gift and like every gift we have the possibility to decline or accept the gift. Most reject him and choose a life away from him, a life of darkness and sadness.",
      "But if we belive that he did that for us and accept him as the Lord of our lives, the gift of forgiveness is ours."
    ]),
    4: GospelInfo(slideId: 4, title: "Holy Spirit", descriptions: [
      "And so is the Gift of the Holy Spirit. Jesus promised us we would never be alone but have a helper that would always be with us. This helper is the Spirit who helped Jesus to rise from the death. It is powerful, it is the Holy Spirit",
      "If you would like to accept the gift of forgivness and the gift of the Holy Spirit it is as simple as saying this prayer:"
          "Jesus thank you for your saccrifice. I recognize having lived a life away from you. I repent of my sins, the decisions I have made and living away from you. Please wash my sins away, forgive me. I believe in you and invite you in my life. Be my Lord Jesus, I will follow you. Holy Spirit please come into my life and help me!"
    ])
  };

  getInfo() {
    return _infos[currentPage];
  }

  changePage(int newPage) {
    currentPage = newPage;
    notifyListeners();
  }

  nextPage() {
    if (currentPage != _max) {
      currentPage++;
      notifyListeners();
    }
  }

  lastPage() {
    if (currentPage != _min) {
      currentPage--;
      notifyListeners();
    }
  }
}
