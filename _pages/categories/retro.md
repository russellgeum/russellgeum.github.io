---
layout: archive
types: posts
title: "회고"
permalink: "/retro"
author_profile: true
sidebar:
  nav: "sidebar-category"
---


{% assign posts = site.categories.retro %}
{% for post in posts %} {% include archive-single.html type=page.entries_layout %}
{% endfor %}