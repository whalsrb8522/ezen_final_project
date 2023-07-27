// 상품 리스트 출력
// 리뷰 출력
// 찜 게시글 출력(유저가 찜한 전체 게시글 select하는 쿼리 ProductMapper에 추가할 것)




// 주소 인천 ㅇㅇ군/구까지 잘라내서 나타내기

let location_spans = document.getElementsByClassName('location-sub');

for (let i = 0; i < location_spans.length; i++) {
    let location_span = location_spans[i];
    let location_text = location_span.innerHTML;

    let endIndex;
    if (location_text.includes("구")) {
        endIndex = location_text.indexOf("구") + 1;
    } else if (location_text.includes("군")) {
        endIndex = location_text.indexOf("군") + 1;
    }

    let location_sub = location_text.substring(0, endIndex);
    location_span.innerHTML = location_sub;
}

