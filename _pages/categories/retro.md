---
title: "회고"
layout: archive
permalink: /categories/retro
author_profile: true
types: posts
---


{% assign posts = site.categories.retro %}
{% for post in posts %} {% include archive-single.html type=page.entries_layout %}
{% endfor %}

<!-- {% assign posts = site.categories.blog %}
{% for post in posts %} {% include archive-single.html type=page.entries_layout %}
{% endfor %} -->