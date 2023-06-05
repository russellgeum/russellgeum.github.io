---
title: "논문 리뷰"
layout: archive
permalink: /categories/paper
author_profile: true
types: posts
---


{% assign posts = site.categories['paper']%}
{% for post in posts %}
  {% include archive-single.html type=page.entries_layout %}
{% endfor %}