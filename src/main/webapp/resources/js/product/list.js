
// let listCategory = document.querySelectorAll('.category');
// console.log(listCategory);
// listCategory.forEach(function (category) {
//     category.addEventListener('click', function () {
//         console.log(this);
//         this.classList.add("categoryBold");
//     });
// });

// function cateBold() {

// }

// document.addEventListener('click', function (event) {
//     let target = event.target;
//     if (target.classList.contains('category')) {
//         console.log(target);
//         target.classList.add('categoryBold');
//     }
// });


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

