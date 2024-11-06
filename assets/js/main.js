function toggleFAQ(para) {
  const $answer = $(para).find(".answer");
  const $icon = $(para).find(".icon-down");

  if ($icon.css("transform") == "matrix(1, 0, 0, 1, 0, 0)") {
    $icon.css("transform", "rotateX(180deg)");
    $answer.slideToggle("normal");
  } else {
    $icon.css("transform", "rotateX(0deg)");
    $answer.slideToggle("normal");
  }
}

// mã javascript chưa sửa
