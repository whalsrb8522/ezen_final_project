let detailCate = document.getElementById('detail-cate-wrap');
let detailscroll = document.querySelector('.detail-cate-scroll');

detailCate.addEventListener('mouseover', () => {
    detailscroll.classList.replace("detail-cate-scroll", "detail-cate-scroll-over");
})
detailCate.addEventListener('mouseout', () => {
    detailscroll.classList.replace("detail-cate-scroll-over", "detail-cate-scroll");
    // detailscroll.classList.remove("detail-cate-scroll-over");
    // detailscroll.classList.add("detail-cate-scroll");
})

