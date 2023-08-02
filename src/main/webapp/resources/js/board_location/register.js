// 주소 ㅇㅇ군/구 잘라내서 나타내기

let location_spans = document.getElementsByClassName('location-sub');
console.log(Object.values(location_spans));
for (let i = 0; i < location_spans.length; i++) {
    console.log(location_spans.length);
    let location_span = location_spans[i];
    let location_text = location_span.innerHTML;
    console.log(location_text);
    let endIndex;
    if (location_text.includes("구")) {
        endIndex = location_text.indexOf("구") + 1;
    } else if (location_text.includes("군")) {
        endIndex = location_text.indexOf("군") + 1;
    }

    let location_sub = location_text.substring(3, endIndex);
    location_span.innerHTML = location_sub;
}

