---
title: "테스트"
layout: archive
permalink: categories/test
author_profile: true
types: posts
---

<!-- 이 페이지는 categories/test1 카테고리에서 test1에 해당하는 글들을 반복문으로 뿌려준다. -->

{% assign posts = site.categories['test']%}
{% for post in posts %}
  {% include archive-single.html type=page.entries_layout %}
{% endfor %}