---
permalink: /
title: ""
excerpt: ""
author_profile: true
redirect_from: 
  - /about/
  - /about.html
---

{% if site.google_scholar_stats_use_cdn %}
{% assign gsDataBaseUrl = "https://cdn.jsdelivr.net/gh/" | append: site.repository | append: "@" %}
{% else %}
{% assign gsDataBaseUrl = "https://raw.githubusercontent.com/" | append: site.repository | append: "/" %}
{% endif %}
{% assign url = gsDataBaseUrl | append: "google-scholar-stats/gs_data_shieldsio.json" %}
{% assign gsDataUrl = gsDataBaseUrl | append: "google-scholar-stats/gs_data.json" | url_encode %}
{% capture citeBadge %}https://img.shields.io/badge/dynamic/json?url={{ gsDataUrl }}&logo=Google%20Scholar&labelColor=f6f6f6&color=9cf&style=flat&label=citations&query=%24.publications%5B%27-5kDAz4AAAAJ%3A{% endcapture %}

<span class='anchor' id='about-me'></span>

I'm a machine learning researcher with an M.Sc. in Biomedical Engineering from Universidad de los Andes (CinfonIA), advised by [Prof. Pablo Arbeláez](https://scholar.google.com/citations?user=k0nZO90AAAAJ&hl=es). My work focuses on multimodal and generative deep learning for scientific applications. I am currently working on projects on reproducible models and benchmarks for AI in materials science, drug discovery, and biomedical data. I've published in venues such as NeurIPS and *Scientific Data*, and I collaborate with interdisciplinary teams as a Research Assistant in the Biomedical Computer Vision Group. My research interests include generative models and multimodal learning for science and healthcare.

# 📝 Publications <a href='https://scholar.google.com/citations?user=-5kDAz4AAAAJ'><img src="https://img.shields.io/endpoint?url={{ url | url_encode }}&logo=Google%20Scholar&labelColor=f6f6f6&color=9cf&style=flat&label=citations"></a>

<div class='paper-box'><div class='paper-box-image'><div style="width:100%"><div class="badge">NeurIPS 2026 E & D</div><div class="paper-box-anim" data-anim="https://bcv-uniandes.github.io/OPAL-WP/assets/header.html"><img src='images/opal-bench.png' alt="OPAL-Bench overview"><iframe title="How OPAL-Bench evaluates a crystal structure prediction"></iframe></div></div></div>
<div class='paper-box-text' markdown="1">

[Quantitative Assessment of Crystal Structure Prediction](https://arxiv.org/abs/2611.10380)

<p class="pub-badges">
<a href="https://arxiv.org/abs/2611.10380"><img src="https://img.shields.io/badge/arXiv-2611.10380-b31b1b?style=flat&logo=arxiv&logoColor=white" alt="arXiv"></a>
<a href="https://github.com/BCV-Uniandes/OPAL"><img src="https://img.shields.io/badge/Code-GitHub-181717?style=flat&logo=github&logoColor=white" alt="Code"></a>
<a href="https://neurips.cc/virtual/2026/loc/sydney/poster/138999"><img src="https://img.shields.io/badge/Poster-NeurIPS%202026-7b2cbf?style=flat" alt="Poster"></a>
<a href="https://bcv-uniandes.github.io/OPAL-WP/"><img src="https://img.shields.io/badge/Web-Project%20Page-2e8b57?style=flat&logo=googlechrome&logoColor=white" alt="Project page"></a>
</p>

Sergio Rincón\*, **Gabriel González**\*, Nicolás Andrade, Rafael Velásquez, Sebastián Ojeda, Juanita Puentes, Nicolás Aparicio, Paula Cárdenas, Pablo Arbeláez (\* equal contribution)

- Introduced **OPAL-Bench**, an orientation-invariant, polymorph-aware large benchmark for **crystal structure prediction (CSP)**.
- Developed **OPAL-CSP**, a top-ranking generative model that predicts crystal structures both **geometrically accurate and physically plausible**.
</div>
</div>

<script>
// figures with a live animation: show the static image, play the animation on hover (tap on touch screens)
document.querySelectorAll('.paper-box-anim').forEach(function (box) {
  var frame = box.querySelector('iframe'), timer;
  function play() {
    clearTimeout(timer);
    if (box.classList.contains('playing')) return;
    frame.onload = function () { box.classList.add('playing'); };
    frame.src = box.dataset.anim;
  }
  function stop() {
    box.classList.remove('playing');
    frame.onload = null;
    timer = setTimeout(function () { frame.src = 'about:blank'; }, 300);
  }
  var mouse = false;
  box.addEventListener('pointerenter', function (e) { mouse = e.pointerType === 'mouse'; if (mouse) play(); });
  box.addEventListener('pointerleave', function (e) { if (e.pointerType === 'mouse') stop(); });
  box.addEventListener('click', function () {
    if (mouse) return; // a mouse already plays on hover
    box.classList.contains('playing') ? stop() : play();
  });
});
</script>

<div class='paper-box'><div class='paper-box-image'><div><div class="badge">NeurIPS 2025 D & B</div><img src='images/architectureFigureEscape.png' alt="sym" width="100%"></div></div>
<div class='paper-box-text' markdown="1">

[A Standardized Benchmark for Multilabel Antimicrobial Peptide Classification](https://arxiv.org/pdf/2511.04814)

<p class="pub-badges">
<a href="https://doi.org/10.52202/085713-4303"><img src="https://img.shields.io/badge/DOI-10.52202%2F085713--4303-1f6feb?style=flat&logo=doi&logoColor=white" alt="DOI"></a>
<a href="https://github.com/BCV-Uniandes/ESCAPE"><img src="https://img.shields.io/badge/Code-GitHub-181717?style=flat&logo=github&logoColor=white" alt="Code"></a>
<a href="https://neurips.cc/virtual/2025/loc/san-diego/poster/121531"><img src="https://img.shields.io/badge/Poster-NeurIPS%202025-7b2cbf?style=flat" alt="Poster"></a>
</p>

Sebastian Ojeda, Rafael Velasquez, Nicolás Aparicio, Juanita Puentes, Paula Cárdenas, Nicolás Andrade, **Gabriel González**, Sergio Rincón, Carolina Muñoz-Camargo, Pablo Arbeláez

- Built a **comprehensive benchmark** for **multilabel antimicrobial peptide (AMP) classification**, under a unified set of antimicrobial categories.
- Implemented a new **SOTA baseline** for AMP discovery employing transformers modules for sequence and 3D structure processing.
</div>
</div>

<div class='paper-box'><div class='paper-box-image'><div><div class="badge">Scientific Data 2025</div><img src='images/simpod.jpg' alt="sym" width="100%"></div></div>
<div class='paper-box-text' markdown="1">

[A new benchmark for machine learning applied to powder X-ray diffraction](https://www.nature.com/articles/s41597-025-05534-3)

<p class="pub-badges">
<a href="https://doi.org/10.1038/s41597-025-05534-3"><img src="https://img.shields.io/badge/DOI-10.1038%2Fs41597--025--05534--3-1f6feb?style=flat&logo=doi&logoColor=white" alt="DOI"></a>
<a href="https://github.com/BCV-Uniandes/SIMPOD"><img src="https://img.shields.io/badge/Code-GitHub-181717?style=flat&logo=github&logoColor=white" alt="Code"></a>
</p>

Sergio Rincón, **Gabriel González**, Mario A. Macías, Pablo Arbeláez

- Curated **SIMPOD** dataset of simulated powder XRD patterns from **467,861** crystal structures (COD), with 1D diffractograms and radial 2D representations.  
- Created an **open source pipeline** for benchmarking Machine Learning and Computer Vision models for Space Group Prediction.
</div>
</div>

# 🎖 Honors and Awards
- *2019.01*, *Quiero Estudiar Escala Scholarship*, Recipient of 95% tuition coverage awarded for academic excellence.
- *2025.10*, *RISE–MICCAI Mentorship Program*, Selected mentee in a one-year program supporting early career researchers from low/middle income countries; mentored in collaboration with the University of Birmingham, UK.

# 📖 Education
- *2024.08 - 2026.04*, Universidad de los Andes, M.Sc. Biomedical Engineering.
- *2021.01 - 2024.04*, Universidad de los Andes, B.Sc. Biomedical Engineering.
- *2019.01 - 2024.10*, Universidad de los Andes, B.Sc. Electronics Engineering. 

# 🎓 Theses
- *M.Sc. Thesis,* Universidad de los Andes  
  * Towards symmetric crystal structure prediction with flow matching equivariant transformers [Google Scholar](https://scholar.google.com/citations?view_op=view_citation&hl=es&user=-5kDAz4AAAAJ&citation_for_view=-5kDAz4AAAAJ:9yKSN-GCB0IC)
  
  Advisor: [Pablo Arbeláez](https://scholar.google.com/citations?user=k0nZO90AAAAJ&hl=es)

- *B.Sc. Thesis*, Universidad de los Andes 
  * Robust-NeuroBiometrics: sistema robusto de identificación biométrica basado en señales de electroencefalograma (EEG) [Google Scholar](https://scholar.google.com/citations?view_op=view_citation&hl=es&user=-5kDAz4AAAAJ&citation_for_view=-5kDAz4AAAAJ:u5HHmVD_uO8C) 
  
  Advisors: [Pablo Arbeláez](https://scholar.google.com/citations?user=k0nZO90AAAAJ&hl=es) [Fernando Lozano](https://academia.uniandes.edu.co/AcademyCv/flozano)  

# 🔬 Experience
- *Research Assistant*, Universidad de los Andes
  * Research at the Biomedical Computer Vision Group at CinfonIA, advised by [Prof. Pablo Arbeláez](https://scholar.google.com/citations?user=k0nZO90AAAAJ&hl=es), focusing on multimodal and generative deep learning for drug discovery and materials design.
- *External Researcher*, University of Birmingham
  * Research at the Computer Science Department, advised by [Prof. Samuel Montero-Hernandez](https://scholar.google.com/citations?user=dgw0sREAAAAJ&hl=es), focusing on multimodal brain decoding for fNIRS.
